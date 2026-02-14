// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:frontend/config/api_config.dart';

class BrewService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 30),
  ));


  // Initialize the coffee machine
  Future<Map<String, dynamic>> initializeMachine() async {
    try {
      final response = await _dio.post('/api/brew/init');
      return response.data;
    } catch (e) {
      print('Error initializing machine: $e');
      rethrow;
    }
  }

  /// Start brewing a process
  Future<Map<String, dynamic>> brewProcess(int processId) async {
    try {
      final response = await _dio.post('/api/brew/process/$processId');
      return response.data;
    } catch (e) {
      print('Error brewing process: $e');
      rethrow;
    }
  }

   /// Run cleaning cycle
  Future<Map<String, dynamic>> cleanMachine() async {
    try {
      final response = await _dio.post('/api/brew/clean');
      return response.data;
    } catch (e) {
      print('Error cleaning machine: $e');
      rethrow;
    }
  }


}