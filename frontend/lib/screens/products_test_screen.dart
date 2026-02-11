import 'package:flutter/material.dart';
import 'package:frontend/screens/widgets/product_list_item.dart';
import '../services/product_service.dart';
import 'product_detail_screen.dart';
import 'product_edit_screen.dart';

class ProductsTestScreen extends StatefulWidget {
  const ProductsTestScreen({super.key});

  @override
  State<ProductsTestScreen> createState() => _ProductsTestScreenState();
}

class _ProductsTestScreenState extends State<ProductsTestScreen> {
  final ProductService _productService = ProductService();
  List<dynamic>? _products;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final products = await _productService.getAllProducts();
      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  // Extracted navigation logic to keep the build method clean
  Future<void> _navigateToProductDetail(dynamic product) async {
    final bool? hasChanges = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          productId: product['productId'],
          productName: product['productName'] ?? 'Product',
        ),
      ),
    );

    // Auto-reload if the user edited or deleted the product
    if (hasChanges == true) {
      _loadProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadProducts,
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductEditScreen(),
          ),
        ).then((result) {
          // Auto-reload if a new product was created
          if (result == true) _loadProducts();
        }),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading products...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: $_error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadProducts,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_products == null || _products!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.coffee_outlined, size: 48),
            const SizedBox(height: 16),
            const Text('No products found'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showCreateProductDialog(),
              child: const Text('Create Product'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadProducts,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _products!.length,
        itemBuilder: (context, index) {
          final product = _products![index];
          // Using our newly created reusable widget!
          return ProductListItem(
            product: product,
            onTap: () => _navigateToProductDetail(product),
          );
        },
      ),
    );
  }

  void _showCreateProductDialog() {
    final nameController = TextEditingController();
    final codeController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Product'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: 'Product Code'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.isNotEmpty &&
                  codeController.text.isNotEmpty &&
                  priceController.text.isNotEmpty) {
                try {
                  await _productService.createProduct(
                    productName: nameController.text,
                    productCode: codeController.text,
                    productType: 'Hot',
                    category: 'Coffee',
                    price: double.parse(priceController.text),
                    description: 'Test product',
                  );
                  Navigator.pop(context);
                  _loadProducts();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Product created!')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                }
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}