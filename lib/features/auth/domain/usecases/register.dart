import '../../../../core/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class Register {
  final AuthRepository repository;

  Register(this.repository);

  Future<Either<Failure, User>> call(String email, String password) {
    return repository.register(email, password);
  }
}