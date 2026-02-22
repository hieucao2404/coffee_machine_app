import 'package:flutter/material.dart';
import 'package:frontend/screens/product_detail_screen.dart';
import 'package:frontend/screens/product_edit_screen.dart';
import 'package:frontend/screens/stock/stock_screen.dart';
import 'package:frontend/screens/widgets/product_card.dart';
import 'package:frontend/services/product_service.dart';
import 'package:frontend/services/material_service.dart';
import 'package:frontend/services/sales_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService _productService = ProductService();
  final MaterialService _materialService = MaterialService();
  final SalesService _salesService = SalesService(); // Add this

  List<Map<String, dynamic>>? _products;
  List<Map<String, dynamic>>? _allProducts;
  List<dynamic>? _lowStockMaterials;
  bool _isLoading = false;
  String _selectedCategory = 'All';

  // Sales data
  double _totalRevenue = 0.0;
  int _totalCupsSold = 0;

  final List<String> _categories = [
    'All',
    'Milk',
    'Black',
  ];

  // Colors matching the HTML design
  final Color _primary = const Color(0xFF714F38);
  final Color _bgLight = const Color(0xFFF7F7F6);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final products = await _productService.getAllProducts();
      final lowStock = await _materialService.getLowStockMaterials(threshold: 50);
      final revenue = await _salesService.getTotalRevenue();
      final cupsSold = await _salesService.getTotalCupsSold();
      
      // Check availability for each product
      final productsWithStatus = await Future.wait<Map<String, dynamic>>(
        products.map((product) async {
          try {
            final canMake = await _productService.canMakeProduct(product['productId']);
            product['status'] = canMake['canMake'] == true ? 'Ready' : (canMake['reason'] ?? 'Unknown');
            return product;
          } catch (e) {
            print('Error checking product: $e');
            product['status'] = 'Ready';
            return product;
          }
        }),
      );
      
      setState(() {
        _allProducts = productsWithStatus;
        _products = productsWithStatus;
        _lowStockMaterials = lowStock;
        _totalRevenue = revenue;
        _totalCupsSold = cupsSold;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading data: $e');
      setState(() => _isLoading = false);
    }
  }  void _filterByCategory(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _products = _allProducts;
      } else {
        _products = _allProducts?.where((product) {
          final productCategory = (product['category'] ?? '').toString().toLowerCase();
          final categoryLower = category.toLowerCase();
          return productCategory == categoryLower;
        }).toList();
      }
    });
  }

  // Get current shift based on time
  String _getCurrentShift() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'MORNING SHIFT';
    } else if (hour >= 12 && hour < 17) {
      return 'AFTERNOON SHIFT';
    } else if (hour >= 17 && hour < 21) {
      return 'EVENING SHIFT';
    } else {
      return 'NIGHT SHIFT';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 8),
              child: _buildHeader(),
            ),

            // Dashboard Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: _buildDashboardCards(),
            ),

            // Coffee Menu Title
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: _buildSectionTitle(),
            ),

            // Category Tabs
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 8, bottom: 16),
              child: _buildCategoryTabs(),
            ),

            // Product Grid
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : (_products == null || _products!.isEmpty)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.coffee_outlined,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No products found',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemCount: _products!.length,
                      itemBuilder: (context, index) {
                        final product = _products![index];
                        return ProductCard(
                          product: product,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  productId: product['productId'],
                                  productName: product['productName'],
                                ),
                              ),
                            ).then((_) => _loadData()); // Reload to update sales
                          },
                          onAction: () {},
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      // FAB
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 32),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: _primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: _primary.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEditScreen(),
                ),
              ).then((val) {
                if (val == true) _loadData();
              });
            },
            icon: const Icon(Icons.add, size: 32, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Removed avatar picture, only showing shift text
        Text(
          _getCurrentShift(),
          style: TextStyle(
            color: _primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        Row(
          children: [
            // Reload Button
            InkWell(
              onTap: _loadData,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: _isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(_primary),
                        ),
                      )
                    : Icon(Icons.refresh, color: _primary, size: 22),
              ),
            ),
            const SizedBox(width: 12),
            // Notification Button
            Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.grey[600],
                    size: 22,
                  ),
                ),
                if (_lowStockMaterials != null &&
                    _lowStockMaterials!.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDashboardCards() {
    final lowStockMaterial = _lowStockMaterials?.isNotEmpty == true 
        ? _lowStockMaterials!.first 
        : null;
    final stockQuantity = (lowStockMaterial?['stockQuantity'] ?? 15).toDouble();
    final stockPercentage = (stockQuantity / 100).clamp(0.0, 1.0);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Revenue Card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),  // Reduced from 14
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),  // Reduced from 7
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.attach_money, color: Colors.green[700], size: 14),  // Reduced from 16
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),  // Reduced
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.trending_up, size: 7, color: Colors.green[700]),  // Reduced from 8
                            const SizedBox(width: 2),
                            Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 8,  // Reduced from 9
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),  // Reduced from 8
                  Text(
                    'Revenue',
                    style: TextStyle(color: Colors.grey[600], fontSize: 10, fontWeight: FontWeight.w500),  // Reduced from 11
                  ),
                  const SizedBox(height: 2),
                  Flexible(  // Added Flexible
                    child: FittedBox(  // Added FittedBox to prevent overflow
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '\$${_totalRevenue.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),  // Reduced from 8
                  Row(
                    children: [
                      Icon(Icons.coffee, size: 11, color: Colors.grey[600]),  // Reduced from 12
                      const SizedBox(width: 3),  // Reduced from 4
                      Flexible(  // Added Flexible
                        child: Text(
                          '$_totalCupsSold cups',  // Shortened text
                          style: TextStyle(fontSize: 9, color: Colors.grey[600]),  // Reduced from 10
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Low Stock Card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),  // Reduced from 14
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),  // Reduced from 7
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.inventory_2_outlined, color: Colors.orange[600], size: 14),  // Reduced from 16
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),  // Reduced
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.warning, size: 7, color: Colors.red[600]),  // Reduced from 8
                            const SizedBox(width: 2),
                            Text(
                              '${_lowStockMaterials?.length ?? 0}',
                              style: TextStyle(
                                fontSize: 8,  // Reduced from 9
                                color: Colors.red[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),  // Reduced from 8
                  Text(
                    'Stock Alert',
                    style: TextStyle(color: Colors.grey[600], fontSize: 10, fontWeight: FontWeight.w500),  // Reduced from 11
                  ),
                  const SizedBox(height: 2),
                  Flexible(  // Added Flexible
                    child: Text(
                      lowStockMaterial?['materialName'] ?? 'All Good',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),  // Reduced from 18
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 6),  // Reduced from 8
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: stockPercentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: stockPercentage < 0.2 ? Colors.red : Colors.orange,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Coffee Menu',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        Row(
          children: [
            Text(
              'See All',
              style: TextStyle(color: _primary, fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Icon(Icons.chevron_right, size: 16, color: _primary),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => _filterByCategory(category),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                decoration: BoxDecoration(
                  color: isSelected ? _primary : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: _primary.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ] : [],
                  border: isSelected ? null : Border.all(color: Colors.grey.withOpacity(0.05)),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.1))),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.home, 'Home', true),
              _navItem(Icons.bar_chart_rounded, 'Stats', false),
              const SizedBox(width: 60), // Space for FAB
              _navItem(Icons.inventory_2_outlined, 'Stock', false),
              _navItem(Icons.settings_outlined, 'Settings', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isSelected) {
    return InkWell(
      onTap: () {
        if (label == 'Stock') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StockScreen(),
            ),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? _primary : Colors.grey[400],
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? _primary : Colors.grey[400],
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
