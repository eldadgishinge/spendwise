import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart';
import 'login.dart';
import 'reset_password.dart';
import 'launch_screen.dart';
import 'home_page.dart'; // Import the HomePage class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpendWise App',
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
          )),
      home: LaunchScreen(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/reset_password': (context) => ResetPasswordPage(),
        '/home': (context) => const HomePage(), // Add this route
      },
    );
  }
}
