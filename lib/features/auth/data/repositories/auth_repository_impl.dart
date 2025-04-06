import 'package:fpdart/fpdart.dart';

import '../../../../core/failure.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient apiClient;
  late final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this.apiClient) {
    _dataSource = AuthRemoteDataSource(apiClient);
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await _dataSource.login(email, password);
      return Right(User(id: userModel.id, email: userModel.email));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> register(String email, String password) async {
    try {
      final userModel = await _dataSource.register(email, password);
      return Right(User(id: userModel.id, email: userModel.email));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}