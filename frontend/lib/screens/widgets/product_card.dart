import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../config/api_config.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;
  final VoidCallback onAction; // Renamed from onEdit to reflect dynamic action

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Determine Status (Mock logic - replace with your real inventory logic)
    final String name = product['productName'] ?? 'Product';
    final double price = (product['price'] ?? 0).toDouble();
    final String? imageUrl = product['imageUrl'];
    final bool isActive = product['isActive'] ?? true;
    
    // Logic to match your screenshot examples:
    // In real app, check: if (product['stock'] < 10) ...
    String status = 'Ready'; 
    if (!isActive) {
      status = 'Unavailable';
    } else if (name.contains('Latte')) { 
      status = 'Low Milk'; // Example for UI demo
    } else if (name.contains('Mocha')) {
      status = 'Empty';    // Example for UI demo
    }

    // 2. Define Styles based on status
    final styles = _getStyles(status);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- IMAGE SECTION ---
            Expanded(
              flex: 4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: imageUrl != null && imageUrl.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: ApiConfig.getImageUrl(imageUrl),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(color: Colors.grey[100]),
                            errorWidget: (context, url, error) => _buildPlaceholder(),
                          )
                        : _buildPlaceholder(),
                  ),
                  
                  // Status Icon (Top Right)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        styles.iconData,
                        size: 16,
                        color: styles.statusColor,
                      ),
                    ),
                  ),

                  // Warning Banner (Bottom of Image) - Only for issues
                  if (status != 'Ready')
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          status == 'Unavailable' ? 'UNAVAILABLE' : 'REFILL NEEDED',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // --- DETAILS SECTION ---
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Price Row
                        Row(
                          children: [
                            Text(
                              '\$${price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF5D4037), // Coffee Brown
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              status == 'Ready' ? 'Ready' : status,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: styles.statusColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Dynamic Action Button
                    SizedBox(
                      width: double.infinity,
                      height: 36, // Fixed height for consistency
                      child: ElevatedButton(
                        onPressed: onAction,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: styles.buttonBgColor,
                          foregroundColor: styles.buttonTextColor,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Text(
                          styles.buttonLabel,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[100],
      child: const Center(
        child: Icon(Icons.coffee, size: 40, color: Colors.brown),
      ),
    );
  }

  // Helper to keep the build method clean
  _CardStyles _getStyles(String status) {
    switch (status) {
      case 'Low Milk':
      case 'Low Stock':
        return _CardStyles(
          statusColor: Colors.orange,
          iconData: Icons.warning_amber_rounded,
          buttonBgColor: const Color(0xFFFFF3E0), // Light Orange
          buttonTextColor: Colors.orange[900]!,
          buttonLabel: 'Restock',
        );
      case 'Empty':
      case 'Unavailable':
        return _CardStyles(
          statusColor: Colors.grey,
          iconData: Icons.do_not_disturb_on,
          buttonBgColor: Colors.grey[200]!,
          buttonTextColor: Colors.grey[700]!,
          buttonLabel: 'Fix Error',
        );
      case 'Ready':
      default:
        return _CardStyles(
          statusColor: Colors.green,
          iconData: Icons.wifi, // Or check_circle
          buttonBgColor: const Color(0xFFF5F5F5), // Light Grey
          buttonTextColor: Colors.black87,
          buttonLabel: 'Edit',
        );
    }
  }
}

// Simple data class for styles
class _CardStyles {
  final Color statusColor;
  final IconData iconData;
  final Color buttonBgColor;
  final Color buttonTextColor;
  final String buttonLabel;

  _CardStyles({
    required this.statusColor,
    required this.iconData,
    required this.buttonBgColor,
    required this.buttonTextColor,
    required this.buttonLabel,
  });
}