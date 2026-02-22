import 'package:dio/dio.dart';
import 'package:frontend/config/api_config.dart';

class MaterialService {
  late final Dio _dio;

  MaterialService() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
    ));
  }

  /// Get all materials
  Future<List<dynamic>> getAllMaterials() async {
    try {
      final response = await _dio.get('/api/Materials');
      return response.data as List;
    } catch (e) {
      print('Error getting materials: $e');
      rethrow;
    }
  }

  /// Get material by ID
  Future<Map<String, dynamic>?> getMaterialById(int materialId) async {
    try {
      final response = await _dio.get('/api/Materials/$materialId');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error getting material: $e');
      return null;
    }
  }

  /// Get low stock materials (stock < threshold)
  Future<List<dynamic>> getLowStockMaterials({double threshold = 50.0}) async {
    try {
      final materials = await getAllMaterials();
      return materials.where((m) {
        final stock = (m['stockQuantity'] ?? 0).toDouble();
        final minStock = (m['minStockLevel'] ?? threshold).toDouble();
        return stock < minStock;
      }).toList();
    } catch (e) {
      print('Error getting low stock materials: $e');
      return [];
    }
  }

  /// Create a new material
  Future<Map<String, dynamic>> createMaterial({
    required String name,
    required String unit,
    required double stockQuantity,
    double? costPerUnit,
    bool isConsumable = true,
    String? imageUrl,
  }) async {
    try {
      final response = await _dio.post('/api/Materials', data: {
        'materialName': name,
        'materialUnit': unit,
        'stockQuantity': stockQuantity,
        if (costPerUnit != null) 'costPerUnit': costPerUnit,
        'isConsumable': isConsumable,
        if (imageUrl != null) 'imageUrl': imageUrl,
      });
      return response.data;
    } catch (e) {
      print('Error creating material: $e');
      rethrow;
    }
  }

  /// Update material details
  Future<Map<String, dynamic>> updateMaterial({
    required int materialId,
    String? name,
    String? unit,
    double? stockQuantity,
    double? costPerUnit,
    bool? isConsumable,
    String? imageUrl,
  }) async {
    try {
      final response = await _dio.put('/api/Materials/$materialId', data: {
        if (name != null) 'materialName': name,
        if (unit != null) 'materialUnit': unit,
        if (stockQuantity != null) 'stockQuantity': stockQuantity,
        if (costPerUnit != null) 'costPerUnit': costPerUnit,
        if (isConsumable != null) 'isConsumable': isConsumable,
        if (imageUrl != null) 'imageUrl': imageUrl,
      });
      return response.data;
    } catch (e) {
      print('Error updating material: $e');
      rethrow;
    }
  }

  /// Adjust stock quantity only (add/subtract/set)
  Future<Map<String, dynamic>> adjustStock({
    required int materialId,
    required double quantity,
    required String adjustmentType, // "ADD", "SUBTRACT", "SET"
    String? notes,
  }) async {
    try {
      print('Adjusting stock: materialId=$materialId, quantity=$quantity, type=$adjustmentType'); // Debug
      
      final response = await _dio.post('/api/Materials/adjust-stock', data: {
        'materialId': materialId,
        'adjustmentQuantity': quantity,
        'adjustmentType': adjustmentType.toUpperCase(), // Ensure uppercase
        if (notes != null && notes.isNotEmpty) 'notes': notes,
      });
      
      print('Stock adjusted successfully: ${response.data}'); // Debug
      return response.data;
    } catch (e) {
      print('Error adjusting stock: $e');
      rethrow;
    }
  }

  /// Quick refill - convenience method
  Future<Map<String, dynamic>> quickRefill(
    int materialId,
    double amount,
    String reason,
  ) async {
    return adjustStock(
      materialId: materialId,
      quantity: amount,
      adjustmentType: 'ADD',
      notes: reason,
    );
  }

  /// Set stock to exact amount - convenience method
  Future<Map<String, dynamic>> setStock(
    int materialId,
    double newQuantity,
    String reason,
  ) async {
    return adjustStock(
      materialId: materialId,
      quantity: newQuantity,
      adjustmentType: 'SET',
      notes: reason,
    );
  }

  /// Consume/reduce stock - convenience method
  Future<Map<String, dynamic>> consumeStock(
    int materialId,
    double amount,
    String reason,
  ) async {
    return adjustStock(
      materialId: materialId,
      quantity: amount,
      adjustmentType: 'SUBTRACT',
      notes: reason,
    );
  }

  /// Delete a material
  Future<void> deleteMaterial(int materialId) async {
    try {
      await _dio.delete('/api/Materials/$materialId');
    } catch (e) {
      print('Error deleting material: $e');
      rethrow;
    }
  }

  /// Bulk update stock for multiple materials
  Future<void> bulkUpdateStock(List<Map<String, dynamic>> adjustments) async {
    try {
      await _dio.post('/api/Materials/bulk-adjust-stock', data: adjustments);
    } catch (e) {
      print('Error bulk updating stock: $e');
      rethrow;
    }
  }
}