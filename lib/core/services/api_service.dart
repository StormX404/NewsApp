import 'package:dio/dio.dart';

class ApiService {

  ApiService(this._dio);
  final Dio _dio;

  final baseUrl = 'https://newsapi.org/v2/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}