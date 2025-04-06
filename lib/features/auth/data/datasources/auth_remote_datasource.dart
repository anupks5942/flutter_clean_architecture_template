import 'package:dio/dio.dart';
import '../../../../../core/network/api_client.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSource(this.apiClient);

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await apiClient.post('/login', {
        'email': email,
        'password': password,
      });
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }

  Future<UserModel> register(String email, String password) async {
    try {
      final response = await apiClient.post('/register', {
        'email': email,
        'password': password,
      });
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Registration failed');
    }
  }
}