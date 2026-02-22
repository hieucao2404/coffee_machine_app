import 'dart:core';

import 'package:flutter/material.dart';
import 'package:frontend/screens/stock/stock_edit_screen.dart';
import 'package:frontend/services/material_service.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final MaterialService _materialService = MaterialService();
  List<dynamic>? _materials;
  bool _isLoading = false;
  String _searchQuery = '';
  final Color _primary = const Color(0xFF714F38);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMaterials();
  }

  Future<void> _loadMaterials() async {
    setState(() => _isLoading = true);
    try {
      final materials = await _materialService.getAllMaterials();
      setState(() {
        _materials = materials;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading materials: $e');
      setState(() => _isLoading = false);
    }
  }

  List<dynamic> get _filteredMaterials {
    if (_materials == null) return [];
    if (_searchQuery.isEmpty) return _materials!;

    return _materials!.where((material) {
      final name = (material['materialName'] ?? '').toString().toLowerCase();
      final type = (material['materialType'] ?? '').toString().toLowerCase();
      return name.contains(_searchQuery.toLowerCase()) ||
          type.contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F6),
      appBar: AppBar(
        title: const Text('Stock Management'),
        backgroundColor: _primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadMaterials,
          ),
        ],
      ),
      body: Column(
        children: [
          //Search bar
          Container(
            color: _primary,
            padding: const EdgeInsetsGeometry.fromLTRB(16, 0, 16, 16),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: "Seach materials ...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Material List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredMaterials.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isEmpty
                              ? 'No materials found'
                              : 'No results for "$_searchQuery"',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _loadMaterials,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _filteredMaterials.length,
                      itemBuilder: (context, index) {
                        final material = _filteredMaterials[index];
                        return _buildMaterialCard(material);
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToEdit(null),
        backgroundColor: _primary,
        icon: const Icon(Icons.add),
        label: const Text('Add Material'),
      ),
    );
  }

  Widget _buildMaterialCard(Map<String, dynamic> material) {
    final stockQuantity = (material['stockQuantity'] ?? 0).toDouble();
    final minStock = (material['minStockLevel'] ?? 50).toDouble();
    final isLowStock = stockQuantity < minStock;
    final stockPercentage = (stockQuantity / 100).clamp(0.0, 1.0);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => _navigateToEdit(material),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Material Icon
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isLowStock ? Colors.red[50] : Colors.green[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getMaterialIcon(material['materialType']),
                      color: isLowStock ? Colors.red[700] : Colors.green[700],
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Material Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                material['materialName'] ?? 'Unknown',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isLowStock)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'LOW',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[900],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          material['materialType'] ?? 'N/A',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Stock Quantity
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${stockQuantity.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isLowStock ? Colors.red[700] : _primary,
                        ),
                      ),
                      Text(
                        material['materialUnit'] ?? '',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Progress Bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stock Level',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      Text(
                        'Min: ${minStock.toStringAsFixed(0)} ${material['materialUnit'] ?? ''}',
                        style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: stockPercentage,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(
                        isLowStock ? Colors.red : Colors.green,
                      ),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _quickRefill(material),
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Quick +50'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _primary,
                        side: BorderSide(color: _primary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _navigateToEdit(material),
                      icon: const Icon(Icons.edit, size: 16),
                      label: const Text('Edit'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getMaterialIcon(String? type) {
    switch (type?.toLowerCase()) {
      case 'liquid':
        return Icons.water_drop;
      case 'solid':
        return Icons.grain;
      case 'powder':
        return Icons.blur_on;
      default:
        return Icons.inventory_2;
    }
  }

  Future<void> _quickRefill(Map<String, dynamic> material) async {
    try {
      final currentStock = (material['stockQuantity'] ?? 0).toDouble();
      final newStock = currentStock + 50;

      await _materialService.adjustStock(
        material['materialId'],
        newStock,
        'Quick refill +50',
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${material['materialName']} refilled (+50)'),
            backgroundColor: Colors.green,
          ),
        );
        _loadMaterials();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to refill: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _navigateToEdit(Map<String, dynamic>? material) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StockEditScreen(material: material),
      ),
    );

    if (result == true) {
      _loadMaterials();
    }
  }
}
