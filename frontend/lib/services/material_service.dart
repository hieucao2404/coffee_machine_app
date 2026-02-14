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

  //Get all materials
  Future<List<dynamic>> getAllMaterials() async {
    try {
      final response = await _dio.get('/api/material');
      return response.data as List;
    } catch (e) {
      print('Error getting materials: $e');
      rethrow;
    }
  }

  //Get low stock materials (stock < threshold)
  Future<List<dynamic>> getLowStockMaterials({double threshold = 10.0}) async {
    try {
      final materials = await getAllMaterials();
      return materials.where((m){ final stock = m['stockQuantity'] ?? 0;
      return stock < threshold;}).toList();
    } catch (e){
      print('Error getting low stock materials: $e');
      return[];
    }
  }

  //Get material by Id
  Future<Map<String, dynamic>?> getMaterialById(int materialId) async {
    try {
      final response = await _dio.get('api/material/$materialId');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('Error getting material: $e');
      return null;
    }
  }
}