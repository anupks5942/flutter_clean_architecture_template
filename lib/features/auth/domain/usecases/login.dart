import '../../../../core/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<Either<Failure, User>> call(String email, String password) {
    return repository.login(email, password);
  }
}