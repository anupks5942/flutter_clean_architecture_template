import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio(BaseOptions(
    baseUrl: dotenv.env['API_BASE_URL'] ?? 'https://default-url.com',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    headers: {'Content-Type': 'application/json'},
  ));

  Future<Response> post(String path, Map<String, dynamic> body) async {
    return await _dio.post(path, data: body);
  }
}