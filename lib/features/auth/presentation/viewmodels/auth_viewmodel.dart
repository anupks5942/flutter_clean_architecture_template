import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/register.dart';
import '../../../../core/storage/storage.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  final Login _login;
  final Register _register;

  AuthViewModel(this._login, this._register) : super(const AuthState.initial());

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    final result = await _login(email, password);
    state = result.fold(
          (failure) => AuthState.error(failure.message),
          (user) {
        if (user.token != null) Storage.saveToken(user.token!);
        return AuthState.authenticated(user);
      },
    );
  }

  Future<void> register(String email, String password) async {
    state = const AuthState.loading();
    final result = await _register(email, password);
    state = result.fold(
          (failure) => AuthState.error(failure.message),
          (user) {
        if (user.token != null) Storage.saveToken(user.token!);
        return AuthState.authenticated(user);
      },
    );
  }
}

class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;

  const AuthState.initial() : isLoading = false, user = null, error = null;
  const AuthState.loading() : isLoading = true, user = null, error = null;
  const AuthState.authenticated(this.user) : isLoading = false, error = null;
  const AuthState.error(this.error) : isLoading = false, user = null;
}

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(loginUseCaseProvider),
    ref.read(registerUseCaseProvider),
  );
});