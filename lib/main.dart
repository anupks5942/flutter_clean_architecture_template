import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/storage/storage.dart';
import 'features/auth/presentation/views/login_page.dart';
import 'features/auth/presentation/views/register_page.dart';
import 'features/home/presentation/views/home_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Storage.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
