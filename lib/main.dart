import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'screens/splash_screen.dart';
import 'pages/signin_page.dart';
import 'pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://gwdscmfvxzvjponsrcyo.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd3ZHNjbWZ2eHp2anBvbnNyY3lvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjUyNzU0NDEsImV4cCI6MjA4MDg1MTQ0MX0.4Pl2JUImvO2NCzizWfEuKMTgL2OlqQvPbjrTx1A9Ins',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // App start screen
      home: const SplashScreen(),

      // All routes
      routes: {
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const Placeholder(), // temporary until we build it
      },
    );
  }
}

