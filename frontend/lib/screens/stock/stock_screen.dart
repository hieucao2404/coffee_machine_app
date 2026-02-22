import 'package:flutter/material.dart';
import 'package:frontend/screens/stock/stock_detail_screen.dart';
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
  String _selectedFilter = 'all'; // 'all', 'consumables', 'low'

  @override
  void initState() {
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
    
    var filtered = _materials!;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((material) {
        final name = (material['materialName'] ?? '').toString().toLowerCase();
        final type = (material['materialType'] ?? '').toString().toLowerCase();
        return name.contains(_searchQuery.toLowerCase()) ||
            type.contains(_searchQuery.toLowerCase());
      }).toList();
    }

    // Apply category filter
    if (_selectedFilter == 'consumables') {
      filtered = filtered.where((material) {
        final type = (material['materialType'] ?? '').toString().toLowerCase();
        return type == 'liquid' || type == 'solid' || type == 'powder';
      }).toList();
    } else if (_selectedFilter == 'low') {
      filtered = filtered.where((material) {
        return _isLowStock(material);
      }).toList();
    }

    return filtered;
  }

  Map<String, List<dynamic>> get _groupedMaterials {
    final grouped = <String, List<dynamic>>{};
    for (var material in _filteredMaterials) {
      final type = material['materialType']?.toString() ?? 'Other';
      final category = _getCategoryName(type);
      if (!grouped.containsKey(category)) {
        grouped[category] = [];
      }
      grouped[category]!.add(material);
    }
    return grouped;
  }

  String _getCategoryName(String type) {
    switch (type.toLowerCase()) {
      case 'solid':
        return 'Bean Hoppers';
      case 'liquid':
        return 'Liquids';
      case 'powder':
        return 'Supplies';
      default:
        return 'Other';
    }
  }

  bool _isLowStock(Map<String, dynamic> material) {
    final stockQuantity = (material['stockQuantity'] ?? 0).toDouble();
    final minStock = (material['minStockLevel'] ?? 50).toDouble();
    return stockQuantity < minStock;
  }

  int get _lowStockCount {
    return _materials?.where((m) => _isLowStock(m)).length ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F6),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            // Search Bar
            _buildSearchBar(),
            // Filter Tabs
            _buildFilterTabs(),
            // Materials List
            Expanded(
              child: _buildMaterialsList(),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFFF7F7F6).withOpacity(0.9),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 28),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              color: const Color(0xFF161413),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Inventory',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF161413),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFF34a853),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Connected to Machine #04',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF34a853),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.sync, size: 24, color: Color(0xFF714f38)),
              onPressed: _loadMaterials,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F2F1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.search, color: Color(0xFF7e746d)),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) => setState(() => _searchQuery = value),
                decoration: const InputDecoration(
                  hintText: 'Search materials...',
                  hintStyle: TextStyle(color: Color(0xFF7e746d)),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.mic, size: 20, color: Color(0xFF7e746d)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F2F1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(child: _buildFilterTab('All', 'all')),
            Expanded(child: _buildFilterTab('Consumables', 'consumables')),
            Expanded(child: _buildFilterTabWithBadge('Low Stock', 'low', _lowStockCount)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTab(String label, String value) {
    final isSelected = _selectedFilter == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)]
              : null,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? const Color(0xFF161413) : const Color(0xFF7e746d),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTabWithBadge(String label, String value, int count) {
    final isSelected = _selectedFilter == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? const Color(0xFF161413) : const Color(0xFF7e746d),
              ),
            ),
            if (count > 0) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFea4335),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialsList() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF714f38)),
      );
    }

    if (_filteredMaterials.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isEmpty ? 'No materials found' : 'No results for "$_searchQuery"',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    final grouped = _groupedMaterials;
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
      itemCount: grouped.keys.length,
      itemBuilder: (context, index) {
        final category = grouped.keys.elementAt(index);
        final materials = grouped[category]!;
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7e746d),
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            
            // Materials in Category
            ...materials.map((material) => _buildMaterialCard(material)),
          ],
        );
      },
    );
  }

  Widget _buildMaterialCard(Map<String, dynamic> material) {
    final stockQuantity = (material['stockQuantity'] ?? 0).toDouble();
    final minStock = (material['minStockLevel'] ?? 50).toDouble();
    final isLowStock = stockQuantity < minStock;
    final maxStock = minStock * 2;
    final stockPercentage = (stockQuantity / maxStock * 100).clamp(0.0, 100.0);
    
    final status = isLowStock ? 'Low' : (stockQuantity < minStock * 1.5 ? 'Medium' : 'Good');
    final statusColor = isLowStock ? const Color(0xFFea4335) : 
                       (status == 'Medium' ? const Color(0xFFfbbc04) : const Color(0xFF34a853));

    return GestureDetector(
      onTap: () => _navigateToDetail(material),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isLowStock ? Border.all(color: const Color(0xFFea4335).withOpacity(0.2)) : 
                 Border.all(color: const Color(0xFF000000).withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getMaterialIcon(material['materialType']),
                color: statusColor,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              material['materialName'] ?? 'Unknown',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF161413),
                              ),
                            ),
                            Text(
                              material['materialType'] ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF7e746d),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            if (isLowStock)
                              Icon(Icons.warning, size: 14, color: statusColor),
                            if (isLowStock) const SizedBox(width: 4),
                            Text(
                              status,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: statusColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Progress Bar
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: const Color(0xFFe3e0de),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: FractionallySizedBox(
                            widthFactor: stockPercentage / 100,
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                color: statusColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 60,
                        child: Text(
                          '${stockQuantity.toStringAsFixed(0)}${material['materialUnit'] ?? ''}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF161413),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getMaterialIcon(String? type) {
    switch (type?.toLowerCase()) {
      case 'solid':
        return Icons.coffee;
      case 'liquid':
        return Icons.water_drop;
      case 'powder':
        return Icons.local_cafe;
      default:
        return Icons.inventory_2;
    }
  }

  Widget _buildFAB() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: const Color(0xFF714f38),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF714f38).withOpacity(0.4),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.add, size: 28, color: Colors.white),
        onPressed: () => _navigateToEdit(null),
      ),
    );
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

  void _navigateToDetail(Map<String, dynamic> material) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StockDetailScreen(material: material),
      ),
    );
    _loadMaterials();
  }
}
