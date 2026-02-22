import 'dart:async';

import 'package:dio/dio.dart';
import '../config/api_config.dart';

class ProductService {
  late final Dio _dio;

  ProductService() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
    ));
  }

  // ============ READ Operations ============
  
  /// Get all products
  Future<List<Map<String, dynamic>>> getAllProducts() async {
    try {
      final response = await _dio.get('/api/products');
      final data = response.data as List;
      return data.map((item) => Map<String, dynamic>.from(item as Map)).toList();
    } catch (e) {
      print('Error getting products: $e');
      rethrow;
    }
  }

  /// Get product detail 
  Future<Map<String, dynamic>?> getProductDetail(int productId) async {
    try {
      final response = await _dio.get('/api/products/$productId');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error getting product detail: $e');
      return null;
    }
  }

    /// Get materials used in a specific process
  Future<List<dynamic>> getProcessMaterials(int processId) async {
    try {
      final response = await _dio.get('/api/process/$processId/materials');
      return response.data as List<dynamic>;
      }catch(e){
       print('Error getting process materials: $e');
      return [];
      }
  }

  /// Get all processes for a product
Future<List<dynamic>> getProductProcesses(int productId) async {
  try {
    final response = await _dio.get('/api/process/product/$productId');
    return response.data as List<dynamic>;
  } catch (e) {
    print('Error getting product processes: $e');
    return [];
  }
}

    /// Get materials sequence for a process (for STM32)
  /// Returns: ["Material1", "Material2", "Material3"]
  /// Array index represents the order
  Future<List<String>> getProcessMaterialsSequence(int processId) async {
    try {
      final response = await _dio.get('/api/process/$processId/materials-sequence');
      return List<String>.from(response.data as List);
    } catch (e) {
      print('Error getting materials sequence: $e');
      return [];
    }
  }

  /// Get material requirements for a product
  Future<Map<String, dynamic>> getProductMaterials(int productId) async {
    try {
      final response = await _dio.get('/api/products/$productId/material-requirements');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error getting product materials: $e');
      return {};
    }
  }

  /// Check if product is available (has enough materials)
  Future<bool> checkProductAvailability(int productId) async {
    try {
      final response = await _dio.get('/api/products/$productId/availability');
      return response.data as bool;
    } catch (e) {
      print('Error checking availability: $e');
      return false;
    }
  }

  // ============ CREATE Operation ============
  
  /// Create a new product
  Future<Map<String, dynamic>> createProduct({
    required String productName,
    required String productCode,
    required String productType,
    required String category,
    required double price,
    required String description,
    bool isActive = true,
    String? imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        'productName': productName,
        'productCode': productCode,
        'productType': productType,
        'category': category,
        'price': price,
        'description': description,
        'isActive': isActive,
      });

      // Add image if provided
      if (imagePath != null) {
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(imagePath),
        ));
      }

      final response = await _dio.post('/api/products', data: formData);
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error creating product: $e');
      rethrow;
    }
  }

  // ============ UPDATE Operation ============
  
  /// Update existing product
  Future<Map<String, dynamic>> updateProduct(
    int productId, {
    String? productName,
    String? productCode,
    String? productType,
    String? category,
    double? price,
    String? description,
    bool? isActive,
    String? imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        if (productName != null) 'productName': productName,
        if (productCode != null) 'productCode': productCode,
        if (productType != null) 'productType': productType,
        if (category != null) 'category': category,
        if (price != null) 'price': price,
        if (description != null) 'description': description,
        if (isActive != null) 'isActive': isActive,
      });

      // Add image if provided
      if (imagePath != null) {
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(imagePath),
        ));
      }

      final response = await _dio.put('/api/products/$productId', data: formData);
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error updating product: $e');
      rethrow;
    }
  }

  /// Toggle product active status
  Future<void> toggleProductStatus(int productId) async {
    try {
      await _dio.patch('/api/products/$productId/toggle');
    } catch (e) {
      print('Error toggling product status: $e');
      rethrow;
    }
  }

  // ============ DELETE Operation ============
  
  /// Delete a product
  Future<void> deleteProduct(int productId) async {
    try {
      await _dio.delete('/api/products/$productId');
    } catch (e) {
      print('Error deleting product: $e');
      rethrow;
    }
  }

  // ============ SEARCH & FILTER ============
  
  /// Search products
  Future<List<dynamic>> searchProducts(String searchTerm) async {
    try {
      final response = await _dio.get('/api/products/search/$searchTerm');
      return response.data as List;
    } catch (e) {
      print('Error searching products: $e');
      return [];
    }
  }

  /// Get products by category
  Future<List<dynamic>> getProductsByCategory(String category) async {
    try {
      final response = await _dio.get('/api/products/category/$category');
      return response.data as List;
    } catch (e) {
      print('Error getting products by category: $e');
      return [];
    }
  }

  /// Get active products only
  Future<List<dynamic>> getActiveProducts() async {
    try {
      final response = await _dio.get('/api/products/active');
      return response.data as List;
    } catch (e) {
      print('Error getting active products: $e');
      return [];
    }
  }

  /// Check if a product can be made based on current material stock
  Future<Map<String, dynamic>> canMakeProduct(int productId) async {
    try {
      final response = await _dio.get('/api/products/$productId/can-make');
      // Convert dynamic map to Map<String, dynamic>
      final data = response.data;
      return Map<String, dynamic>.from(data);
    } catch (e) {
      print('Error checking if product can be made: $e');
      return {'canMake': true, 'reason': ''};
    }
  }

  
}
