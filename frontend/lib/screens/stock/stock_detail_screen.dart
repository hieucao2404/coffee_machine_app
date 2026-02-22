import 'package:flutter/material.dart';
import 'package:frontend/services/material_service.dart';
import 'stock_edit_screen.dart';

class StockDetailScreen extends StatefulWidget {
  final Map<String, dynamic> material;

  const StockDetailScreen({
    super.key,
    required this.material,
  });

  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  final MaterialService _materialService = MaterialService();
  late Map<String, dynamic> _material;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _material = widget.material;
  }

 Future<void> _adjustStock(double amount) async {
  setState(() => _isLoading = true);
  try {
    // Use ADD or SUBTRACT instead of calculating new stock
    final adjustmentType = amount > 0 ? 'ADD' : 'SUBTRACT';
    final adjustmentAmount = amount.abs();
    
    final result = await _materialService.adjustStock(
      materialId: _material['materialId'],
      quantity: adjustmentAmount,
      adjustmentType: adjustmentType,
      notes: amount > 0 ? 'Added $adjustmentAmount' : 'Removed $adjustmentAmount',
    );

    setState(() {
      // Update with the returned value from backend
      _material['stockQuantity'] = result['stockQuantity'];
      _isLoading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(amount > 0 ? 'Stock increased by $adjustmentAmount' : 'Stock decreased by $adjustmentAmount'),
          backgroundColor: const Color(0xFF34a853),
        ),
      );
    }
  } catch (e) {
    setState(() => _isLoading = false);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adjusting stock: $e')),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    final stockQuantity = (_material['stockQuantity'] ?? 0).toDouble();
    final minStock = (_material['minStockLevel'] ?? 50).toDouble();
    final isLowStock = stockQuantity < minStock;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F6),
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable Content
            SingleChildScrollView(
              child: Column(
                children: [
                  // Header
                  _buildHeader(),
                  // Hero Section
                  _buildHeroSection(),
                  // Adjustment Controls
                  _buildAdjustmentControls(),
                  // Analytics Section
                  _buildAnalyticsSection(),
                  const SizedBox(height: 100), // Space for bottom button
                ],
              ),
            ),
            // Sticky Bottom Action Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomActionBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              color: const Color(0xFF161413),
            ),
          ),
          Text(
            _material['materialName'] ?? 'Material',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF161413),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.edit, size: 20),
              onPressed: () => _navigateToEdit(),
              padding: EdgeInsets.zero,
              color: const Color(0xFF161413),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    final stockQuantity = (_material['stockQuantity'] ?? 0).toDouble();
    final minStock = (_material['minStockLevel'] ?? 50).toDouble();
    final isLowStock = stockQuantity < minStock;
    final statusColor = isLowStock ? const Color(0xFFea4335) : const Color(0xFF34a853);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        children: [
          // Icon/Image
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(color: const Color(0xFFe3e0de), width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(
                  _getMaterialIcon(_material['materialType']),
                  size: 80,
                  color: const Color(0xFF714f38),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Icon(
                    isLowStock ? Icons.warning : Icons.check_circle,
                    color: statusColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Value Display
          Text(
            '${stockQuantity.toStringAsFixed(0)}${_material['materialUnit'] ?? ''}',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF714f38),
              height: 1.1,
            ),
          ),
          const SizedBox(height: 12),
          // Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF34a853),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'IoT Synced',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7e746d),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '•',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Machine A',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF7e746d),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdjustmentControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFe3e0de)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            // Minus Button
            Expanded(
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F2F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: _isLoading ? null : () => _adjustStock(-10),
                    child: const Icon(
                      Icons.remove,
                      size: 32,
                      color: Color(0xFF161413),
                    ),
                  ),
                ),
              ),
            ),
            // Label
            const Expanded(
              child: Column(
                children: [
                  Text(
                    'ADJUST',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      color: Color(0xFF7e746d),
                    ),
                  ),
                ],
              ),
            ),
            // Plus Button
            Expanded(
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFF714f38),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF714f38).withOpacity(0.3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: _isLoading ? null : () => _adjustStock(10),
                    child: const Icon(
                      Icons.add,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsSection() {
    final stockQuantity = (_material['stockQuantity'] ?? 0).toDouble();
    final minStock = (_material['minStockLevel'] ?? 50).toDouble();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '7-Day Consumption',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF161413),
            ),
          ),
          const SizedBox(height: 16),
          // Analytics Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFe3e0de)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Average Daily',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '120${_material['materialUnit'] ?? ''}',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF161413),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF34a853).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.trending_down, size: 14, color: Color(0xFF34a853)),
                          SizedBox(width: 4),
                          Text(
                            '-5%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF34a853),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Graph Placeholder
                SizedBox(
                  height: 120,
                  child: CustomPaint(
                    painter: ConsumptionGraphPainter(),
                    size: const Size(double.infinity, 120),
                  ),
                ),
                const SizedBox(height: 16),
                // X-Axis Labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
                  ].map((day) => Text(
                    day,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[500],
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Info Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF714f38).withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF714f38).withOpacity(0.1)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info,
                  color: Color(0xFF714f38),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Restock Recommendation',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF714f38),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Based on your usage, you should order more by next Tuesday.',
                        style: TextStyle(
                          fontSize: 13,
                          color: const Color(0xFF714f38).withOpacity(0.8),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        border: Border(
          top: BorderSide(color: const Color(0xFFe3e0de)),
        ),
      ),
      child: ElevatedButton(
        onPressed: () => _navigateToEdit(),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF714f38),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 8,
          shadowColor: const Color(0xFF714f38).withOpacity(0.3),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Update Stock',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 18),
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

  void _navigateToEdit() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StockEditScreen(material: _material),
      ),
    );

    if (result == true) {
      // Reload material data
      Navigator.pop(context);
    }
  }
}

// Custom Painter for Consumption Graph
class ConsumptionGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF714f38)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF714f38).withOpacity(0.2),
          const Color(0xFF714f38).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Sample data points
    final points = [
      Offset(0, size.height * 0.6),
      Offset(size.width * 0.16, size.height * 0.6),
      Offset(size.width * 0.32, size.height * 0.3),
      Offset(size.width * 0.48, size.height * 0.5),
      Offset(size.width * 0.64, size.height * 0.25),
      Offset(size.width * 0.8, size.height * 0.65),
      Offset(size.width, size.height * 0.3),
    ];

    // Draw area fill
    final fillPath = Path();
    fillPath.moveTo(points[0].dx, size.height);
    for (var i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];
      final controlPoint1 = Offset(p1.dx + (p2.dx - p1.dx) / 2, p1.dy);
      final controlPoint2 = Offset(p1.dx + (p2.dx - p1.dx) / 2, p2.dy);
      fillPath.cubicTo(
        controlPoint1.dx, controlPoint1.dy,
        controlPoint2.dx, controlPoint2.dy,
        p2.dx, p2.dy,
      );
    }
    fillPath.lineTo(size.width, size.height);
    fillPath.close();
    canvas.drawPath(fillPath, fillPaint);

    // Draw line
    final linePath = Path();
    linePath.moveTo(points[0].dx, points[0].dy);
    for (var i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];
      final controlPoint1 = Offset(p1.dx + (p2.dx - p1.dx) / 2, p1.dy);
      final controlPoint2 = Offset(p1.dx + (p2.dx - p1.dx) / 2, p2.dy);
      linePath.cubicTo(
        controlPoint1.dx, controlPoint1.dy,
        controlPoint2.dx, controlPoint2.dy,
        p2.dx, p2.dy,
      );
    }
    canvas.drawPath(linePath, paint);

    // Draw data points
    final pointPaint = Paint()
      ..color = const Color(0xFF714f38)
      ..style = PaintingStyle.fill;
    final pointOutlinePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (var point in points) {
      canvas.drawCircle(point, 5, pointOutlinePaint);
      canvas.drawCircle(point, 3, pointPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
