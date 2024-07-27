import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendwise/firebase_options.dart';
import 'package:spendwise/login.dart';
import 'home_page.dart';
import 'resources_page.dart';
import 'financial_quotes_page.dart';
import 'talk_to_expert_page.dart';
import 'signup.dart';
import 'package:logger/logger.dart';
import 'reset_password.dart';
import 'launch_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  final logger = Logger(); // Initialize a Logger instance

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    logger.i('User: $user');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spendwise',
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: const Color(0xFF00B2E7),
          secondary: const Color(0xFFFF8D6C),
          tertiary: const Color(0xFFE064F7),
          outline: Colors.grey,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LaunchScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/reset_password': (context) => ResetPasswordPage(),
        '/home': (context) => const HomePage(),
        '/resources': (context) => const ResourcesPage(),
        '/financial_quotes': (context) => FinancialQuotesPage(),
        '/talk_to_expert': (context) => TalkToExpertPage(),
      },
    );
  }
}

