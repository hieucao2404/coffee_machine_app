import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/services/material_service.dart';

class StockEditScreen extends StatefulWidget {
  final Map<String, dynamic>? material;

  const StockEditScreen({super.key, this.material});

  @override
  State<StockEditScreen> createState() => _StockEditScreenState();
}

class _StockEditScreenState extends State<StockEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final MaterialService _materialService = MaterialService();
  
  late TextEditingController _nameController;
  late TextEditingController _typeController;
  late TextEditingController _unitController;
  late TextEditingController _stockController;
  late TextEditingController _minStockController;
  late TextEditingController _reasonController;
  
  bool _isSaving = false;
  final Color _primary = const Color(0xFF714F38);

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.material?['materialName'] ?? '',
    );
    _typeController = TextEditingController(
      text: widget.material?['materialType'] ?? '',
    );
    _unitController = TextEditingController(
      text: widget.material?['materialUnit'] ?? '',
    );
    _stockController = TextEditingController(
      text: widget.material?['stockQuantity']?.toString() ?? '0',
    );
    _minStockController = TextEditingController(
      text: widget.material?['minStockLevel']?.toString() ?? '50',
    );
    _reasonController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _unitController.dispose();
    _stockController.dispose();
    _minStockController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  bool get _isEditing => widget.material != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F6),
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Material' : 'Add Material'),
        backgroundColor: _primary,
        foregroundColor: Colors.white,
        actions: _isEditing
            ? [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: _confirmDelete,
                ),
              ]
            : null,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Material Name
            _buildCard(
              title: 'Material Information',
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Material Name *',
                    prefixIcon: Icon(Icons.label),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter material name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Unit
                TextFormField(
                  controller: _unitController,
                  decoration: const InputDecoration(
                    labelText: 'Unit *',
                    prefixIcon: Icon(Icons.straighten),
                    hintText: 'e.g., ml, g, piece',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter unit';
                    }
                    return null;
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Stock Levels
            _buildCard(
              title: 'Stock Levels',
              children: [
                TextFormField(
                  controller: _stockController,
                  decoration: InputDecoration(
                    labelText: 'Current Stock *',
                    prefixIcon: const Icon(Icons.inventory),
                    suffixText: _unitController.text,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter stock quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _minStockController,
                  decoration: InputDecoration(
                    labelText: 'Minimum Stock Level *',
                    prefixIcon: const Icon(Icons.warning_amber),
                    suffixText: _unitController.text,
                    helperText: 'Alert when stock falls below this level',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter minimum stock level';
                    }
                    return null;
                  },
                ),
              ],
            ),
            
            if (_isEditing) ...[
              const SizedBox(height: 16),
              _buildCard(
                title: 'Adjustment Reason',
                children: [
                  TextFormField(
                    controller: _reasonController,
                    decoration: const InputDecoration(
                      labelText: 'Reason for adjustment (optional)',
                      prefixIcon: Icon(Icons.note),
                      hintText: 'e.g., Refill, Spillage, Correction',
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ],
            
            const SizedBox(height: 24),
            
            // Save Button
            ElevatedButton.icon(
              onPressed: _isSaving ? null : _save,
              icon: _isSaving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.save),
              label: Text(_isSaving ? 'Saving...' : 'Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required List<Widget> children}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
  if (!_formKey.currentState!.validate()) return;

  setState(() => _isSaving = true);

  try {
    if (_isEditing) {
      // Update existing material
      await _materialService.setStock(
        widget.material!['materialId'],
        double.parse(_stockController.text),
        _reasonController.text.isEmpty 
            ? 'Stock adjustment' 
            : _reasonController.text,
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Stock updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, true);
      }
    } else {
      // Create new material - REMOVED materialType parameter
      await _materialService.createMaterial(
        name: _nameController.text,
        unit: _unitController.text,
        stockQuantity: double.parse(_stockController.text),
        costPerUnit: double.tryParse(_minStockController.text), // Or use a separate field
        isConsumable: true,
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Material created successfully'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, true);
      }
    }
  } catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } finally {
    if (mounted) {
      setState(() => _isSaving = false);
    }
  }
}

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Material'),
        content: Text(
          'Are you sure you want to delete "${_nameController.text}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await _deleteMaterial();
    }
  }

  Future<void> _deleteMaterial() async {
    setState(() => _isSaving = true);
    
    try {
      await _materialService.deleteMaterial(widget.material!['materialId']);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Material deleted successfully'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete: $e'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() => _isSaving = false);
      }
    }
  }
}