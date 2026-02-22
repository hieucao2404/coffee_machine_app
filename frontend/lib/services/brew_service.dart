// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import '../config/api_config.dart';

class BrewService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    connectTimeout: ApiConfig.connectTimeout,
    receiveTimeout: ApiConfig.receiveTimeout,
  ));

  /// Start brewing a process
  Future<Map<String, dynamic>> brewProcess(int processId) async {
    try {
      final response = await _dio.post('/api/brew/process/$processId');
      return response.data;
    } on DioException catch (e) {
      print('Error brewing process: $e');

      // Log detailed error information
      if (e.response != null) {
        print('Response status: ${e.response?.statusCode}');
        print('Response data: ${e.response?.data}');
        print('Response headers: ${e.response?.headers}');
      } else {
        print('Error message: ${e.message}');
      }

      rethrow;
    }
  }

  /// Initialize the coffee machine
  Future<Map<String, dynamic>> initializeMachine() async {
    try {
      final response = await _dio.post('/api/brew/init');
      return response.data;
    } catch (e) {
      print('Error initializing machine: $e');
      rethrow;
    }
  }

  /// Preview STM32 command without executing
  Future<Map<String, dynamic>> previewCommand(int processId) async {
    try {
      final response = await _dio.get('/api/brew/preview/$processId');
      return response.data;
    } catch (e) {
      print('Error previewing command: $e');
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