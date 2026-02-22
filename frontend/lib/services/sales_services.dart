import 'package:dio/dio.dart';
import 'package:frontend/config/api_config.dart';


class SalesService {
    final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    connectTimeout: ApiConfig.connectTimeout,
    receiveTimeout: ApiConfig.receiveTimeout,));

    //Get total revenue for today
    Future<double> getTotalRevenue() async {
    try {
    final response = await _dio.get('/api/sales/revenue');
    return (response.data['totalRevenue'] as num).toDouble();
    } catch (e){
    print('Error getting total revenue: $e');
    return 0.0;
        }
    }

    /// Get all sales record
    Future<List<dynamic>> getAllSales() async {
    try {
    final response = await _dio.get('/api/sales/all');
    return response.data as List<dynamic>;
    } catch (e){
    print('Error getting all sales: $e');
    return [];
    }
}

    ///get sales  total cups sold today
    Future<int> getTotalCupsSold() async {
    try {
    final response = await _dio.get('api/sales/cups-sold');
    return response.data['totalCups'] as int;
    } catch (e) {
    print('Error gettiung total cups sold: $e');
    return 0;
    }}


    ///Get sales breakdown by product
    Future<Map<String, int>> getSalesByProduct() async {
    try {
    final response = await _dio.get('/api/sales/by-product');
    return Map<String, int>.from(response.data);
    } catch (e) {
    print('Error getting sales by product: $e');
    return {};}}

    /// Get sales summany
    Future<Map<String, dynamic>> getSalesSummary() async {
    try {
    final response = await _dio.get('api/sales/summary');
    return response.data;
    } catch (e){
    print('Error getting sales summary: $e');
    return {};
    }}

    /// Reset daily sales
    Future<bool> resetDailySales() async {
    try {
    await _dio.post('/api/sales/reset');
    return true;
    } catch (e){
    print('Error reseting daily sales: $e');
    return false;
    }}

    
  /// Manually record a sale
  Future<bool> recordSale(String productName, double price) async {
    try {
      await _dio.post('/api/sales/record', data: {
        'productName': productName,
        'price': price,
      });
      return true;
    } catch (e) {
      print('Error recording sale: $e');
      return false;
    }
  }

  }
