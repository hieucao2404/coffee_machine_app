import 'package:flutter/material.dart';
import '../../../config/api_config.dart';

class ProductListItem extends StatelessWidget {
  final dynamic product;
  final VoidCallback onTap;

  const ProductListItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = product['imageUrl']?.toString();
    final bool hasImage = imageUrl != null && imageUrl.isNotEmpty;

    return Card(clipBehavior: Clip.antiAlias,
    elevation: 2,
    child: InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3,
          child: Container(
            width: double.infinity,
            color: Colors.grey[200],
            child:hasImage ? Image.network(
              ApiConfig.getImageUrl(imageUrl),
              fit: BoxFit.cover,
              errorBuilder:(context, error, stackTrace){
                return const Icon(Icons.coffee, size: 48, color: Colors.grey);
              },
            )
            : const Icon(Icons.coffee, size: 48, color: Colors.brown),
          ),),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['productName'] ?? 'Unknown',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['category'] ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${(product['price'] ?? 0).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF6F4E37),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: (product['isActive'] ?? false) ? Colors.green[100] : Colors.red[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          (product['isActive'] ?? false) ? 'Active' : 'Inactive',
                          style: TextStyle(
                            fontSize: 10,
                            color: (product['isActive'] ?? false) ? Colors.green[900] : Colors.red[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ),);
  }
}
