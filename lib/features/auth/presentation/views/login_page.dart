import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/auth_viewmodel.dart';

class LoginPage extends ConsumerWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);

    ref.listen(authViewModelProvider, (previous, next) {
      if (next.user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            if (authState.isLoading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () {
                  ref.read(authViewModelProvider.notifier).login(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
                child: Text('Login'),
              ),
            if (authState.error != null)
              Text(authState.error!, style: TextStyle(color: Colors.red)),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}