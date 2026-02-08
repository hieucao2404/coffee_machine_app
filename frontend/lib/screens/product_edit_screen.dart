import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../services/product_service.dart';

class ProductEditScreen extends StatefulWidget {
  final int? productId;
  final Map<String, dynamic>? productData;

  const ProductEditScreen({
    super.key,
    this.productId,
    this.productData,
  });

  @override
  State<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final ProductService _productService = ProductService();
  final ImagePicker _imagePicker = ImagePicker();

  late TextEditingController _nameController;
  late TextEditingController _codeController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  
  String _selectedType = 'Hot Coffee';
  String _selectedCategory = 'Black';
  bool _isActive = true;
  File? _selectedImage;
  bool _isLoading = false;

  final List<String> _productTypes = [
    'Hot Coffee',
    'Cold Coffee',
    'Tea',
    'Other'
  ];

  final List<String> _categories = [
    'Black',
    'Milk',
    'Specialty',
    'Seasonal'
  ];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    if (widget.productData != null) {
      // Edit mode
      _nameController = TextEditingController(
        text: widget.productData!['productName'] ?? '',
      );
      _codeController = TextEditingController(
        text: widget.productData!['productCode'] ?? '',
      );
      _priceController = TextEditingController(
        text: (widget.productData!['price'] ?? 0).toString(),
      );
      _descriptionController = TextEditingController(
        text: widget.productData!['description'] ?? '',
      );
      _selectedType = widget.productData!['productType'] ?? 'Hot Coffee';
      _selectedCategory = widget.productData!['category'] ?? 'Black';
      _isActive = widget.productData!['isActive'] ?? true;
    } else {
      // Create mode
      _nameController = TextEditingController();
      _codeController = TextEditingController();
      _priceController = TextEditingController();
      _descriptionController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.productId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Product' : 'Create Product'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildImagePicker(),
                    const SizedBox(height: 24),
                    _buildTextField(
                      controller: _nameController,
                      label: 'Product Name',
                      hint: 'e.g., Espresso',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _codeController,
                      label: 'Product Code',
                      hint: 'e.g., ESP001',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product code';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildDropdown(
                      label: 'Product Type',
                      value: _selectedType,
                      items: _productTypes,
                      onChanged: (value) {
                        setState(() => _selectedType = value!);
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildDropdown(
                      label: 'Category',
                      value: _selectedCategory,
                      items: _categories,
                      onChanged: (value) {
                        setState(() => _selectedCategory = value!);
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _priceController,
                      label: 'Price',
                      hint: 'e.g., 2.50',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _descriptionController,
                      label: 'Description',
                      hint: 'Product description...',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: const Text('Active'),
                      subtitle: const Text('Product available for sale'),
                      value: _isActive,
                      onChanged: (value) {
                        setState(() => _isActive = value);
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _saveProduct,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        backgroundColor: const Color(0xFF6F4E37),
                      ),
                      child: Text(
                        isEditMode ? 'Update Product' : 'Create Product',
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[400]!),
        ),
        child: _selectedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(_selectedImage!, fit: BoxFit.cover),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_photo_alternate, size: 48, color: Colors.grey[600]),
                  const SizedBox(height: 8),
                  Text(
                    'Tap to add product image',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items.map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: onChanged,
    );
  }

  Future<void> _pickImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _saveProduct() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      final price = double.parse(_priceController.text);

      if (widget.productId != null) {
        // Update existing product
        await _productService.updateProduct(
          widget.productId!,
          productName: _nameController.text,
          productCode: _codeController.text,
          productType: _selectedType,
          category: _selectedCategory,
          price: price,
          description: _descriptionController.text,
          isActive: _isActive,
          imagePath: _selectedImage?.path,
        );
      } else {
        // Create new product
        await _productService.createProduct(
          productName: _nameController.text,
          productCode: _codeController.text,
          productType: _selectedType,
          category: _selectedCategory,
          price: price,
          description: _descriptionController.text,
          isActive: _isActive,
          imagePath: _selectedImage?.path,
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.productId != null
                  ? 'Product updated successfully'
                  : 'Product created successfully',
            ),
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }
}