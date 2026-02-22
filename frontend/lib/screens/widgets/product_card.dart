import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../config/api_config.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;
  final VoidCallback onAction;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final String name = product['productName'] ?? 'Product';
    final double price = (product['price'] ?? 0).toDouble();
    final String? imageUrl = product['imageUrl'];
    final bool isActive = product['isActive'] ?? true;
    
    // Use real status from product data
    String status = 'Ready';
    if (!isActive) {
      status = 'Unavailable';
    } else if (product['status'] != null) {
      status = product['status'];
    }

    final styles = _getStyles(status);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
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
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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

            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),  // Changed from 3 to 2
                    // Price Row
                    Row(
                      children: [
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF5D4037),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            status == 'Ready' ? 'Ready' : status,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: styles.statusColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    // Dynamic Action Button
                    SizedBox(
                      width: double.infinity,
                      height: 31,  // Changed from 32 to 31
                      child: ElevatedButton(
                        onPressed: onAction,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: styles.buttonBgColor,
                          foregroundColor: styles.buttonTextColor,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          styles.buttonLabel,
                          style: const TextStyle(
                            fontSize: 12,
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

  _CardStyles _getStyles(String status) {
    switch (status) {
      case 'Low Milk':
      case 'Low Stock':
        return _CardStyles(
          statusColor: Colors.orange,
          iconData: Icons.warning_amber_rounded,
          buttonBgColor: const Color(0xFFFFF3E0),
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
          iconData: Icons.wifi,
          buttonBgColor: const Color(0xFFF5F5F5),
          buttonTextColor: Colors.black87,
          buttonLabel: 'Edit',
        );
    }
  }
}

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