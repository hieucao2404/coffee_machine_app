import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../config/api_config.dart';
import 'product_edit_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  final String productName;

  const ProductDetailScreen({
    super.key,
    required this.productId,
    required this.productName,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductService _productService = ProductService();
  Map<String, dynamic>? _productDetail;
  Map<String, dynamic>? _materialRequirements;
  List<dynamic?> _productProcesses = [];
  Map<int, List<String>> _processSequences = {};
  bool _isLoading = true;
  String? _error;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _loadProductDetail();
  }

  Future<void> _loadProductDetail() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final detail = await _productService.getProductDetail(widget.productId);
      final materials = await _productService.getProductMaterials(
        widget.productId,
      );
      final allProcesses = await _productService.getProductProcesses(
        widget.productId,
      );

      print('DEBUG: All processes: $allProcesses'); // ✅ ADD THIS

      // Filter to show only the latest version
      List<dynamic> latestProcesses = [];
      if (allProcesses != null && allProcesses.isNotEmpty) {
        // Find the maximum version number
        int maxVersion = 0;
        for (var process in allProcesses) {
          int version = process['version'] ?? 1;
          if (version > maxVersion) {
            maxVersion = version;
          }
        }

        print('DEBUG: Max version: $maxVersion'); // ✅ ADD THIS

        // Keep only processes with the max version
        latestProcesses = allProcesses
            .where((process) => process['version'] == maxVersion)
            .toList();

        print('DEBUG: Latest processes: $latestProcesses'); // ✅ ADD THIS
      }

      // Load material sequences for each latest process
      Map<int, List<String>> sequences = {};
      for (var process in latestProcesses) {
        final processId = process['processId'] as int;
        final sequence = await _productService.getProcessMaterialsSequence(
          processId,
        );
        sequences[processId] = sequence;
      }

      setState(() {
        _productDetail = detail;
        _materialRequirements = materials;
        _productProcesses = latestProcesses;
        _processSequences = sequences;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) return;

        //Manually pop and return the _hasChanges flag
        Navigator.pop(context, _hasChanges);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.productName),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, _hasChanges); // ✅ Return the flag
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _navigateToEdit(),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _confirmDelete(),
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: $_error'),
            ElevatedButton(
              onPressed: _loadProductDetail,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_productDetail == null) {
      return const Center(child: Text('Product not found'));
    }

    return RefreshIndicator(
      onRefresh: _loadProductDetail,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            const SizedBox(height: 16),
            _buildProductInfo(),
            const SizedBox(height: 24),
            _buildProcessInfo(),
            const SizedBox(height: 24),
            _buildMaterialRequirements(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    final imageUrl = _productDetail?['imageUrl'];
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 250,
        width: double.infinity,
        color: Colors.grey[200],
        child: imageUrl != null && imageUrl.toString().isNotEmpty
            ? Image.network(
                ApiConfig.getImageUrl(imageUrl),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.coffee, size: 80);
                },
              )
            : const Icon(Icons.coffee, size: 80),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Product Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _infoRow('Code', _productDetail?['productCode'] ?? 'N/A'),
            _infoRow('Type', _productDetail?['productType'] ?? 'N/A'),
            _infoRow('Category', _productDetail?['category'] ?? 'N/A'),
            _infoRow(
              'Price',
              '\$${(_productDetail?['price'] ?? 0).toStringAsFixed(2)}',
            ),
            _infoRow('Description', _productDetail?['description'] ?? 'N/A'),
            _infoRow(
              'Status',
              (_productDetail?['isActive'] ?? false)
                  ? '✅ Active'
                  : '❌ Inactive',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProcessInfo() {
    final processes = _productProcesses;

    if (processes.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Icon(Icons.info_outline, size: 48, color: Colors.orange),
              const SizedBox(height: 8),
              const Text('No brewing process defined for this product'),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Brewing Processes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ...processes.map((process) {
              final processId = process['processId'] as int;
              final materialSequence = _processSequences[processId] ?? [];

              if (materialSequence.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'No materials defined',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Material Sequence (STM32):',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...materialSequence.asMap().entries.map((entry) {
                      final index = entry.key;
                      final materialName = entry.value;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: const Color(0xFF6F4E37),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                materialName,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialRequirements() {
    if (_materialRequirements == null || _materialRequirements!.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Icon(
                Icons.inventory_2_outlined,
                size: 48,
                color: Colors.grey,
              ),
              const SizedBox(height: 8),
              const Text('No material requirements defined'),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Required Materials',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Materials needed to make one serving:',
              style: TextStyle(color: Colors.grey),
            ),
            const Divider(),
            ..._materialRequirements!.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF6F4E37),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        entry.key,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Text(
                      '${entry.value}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6F4E37),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  void _navigateToEdit() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductEditScreen(
          productId: widget.productId,
          productData: _productDetail!,
        ),
      ),
    );

    if (result == true) {
      _hasChanges = true;
      _loadProductDetail();
    }
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text(
          'Are you sure you want to delete "${widget.productName}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              Navigator.pop(context);
              await _deleteProduct();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteProduct() async {
    try {
      await _productService.deleteProduct(widget.productId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product deleted successfully')),
        );
        Navigator.pop(context, true); // Return to list
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error deleting product: $e')));
      }
    }
  }
}
