import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:production_app/features/auth/domain/repositories/auth_repository.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/login.dart';
import '../../features/auth/domain/usecases/register.dart';
import '../network/api_client.dart';

final apiClientProvider = Provider((ref) => ApiClient());

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(
  ref.read(apiClientProvider),
));

final loginUseCaseProvider = Provider((ref) => Login(ref.read(authRepositoryProvider as ProviderListenable<AuthRepository>)));
final registerUseCaseProvider = Provider((ref) => Register(ref.read(authRepositoryProvider as ProviderListenable<AuthRepository>)));