import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/auth_viewmodel.dart';

class RegisterPage extends ConsumerWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (authState.isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () {
                  ref.read(authViewModelProvider.notifier).register(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
                child: const Text('Register'),
              ),
            if (authState.error != null)
              Text(
                authState.error!,
                style: const TextStyle(color: Colors.red),
              ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}