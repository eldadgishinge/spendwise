import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'home_page.dart';
import 'resources_page.dart';
import 'financial_quotes_page.dart';
import 'talk_to_expert_page.dart';
=======
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart';
import 'login.dart';
import 'reset_password.dart';
import 'launch_screen.dart';
import 'home_page.dart'; // Import the HomePage class
>>>>>>> 381017899abc09111adbb51a4e5e326f8984bf07

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Spendwise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/resources': (context) => ResourcesPage(),
        '/financial_quotes': (context) => FinancialQuotesPage(),
        '/talk_to_expert': (context) => TalkToExpertPage(),
=======
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
>>>>>>> 381017899abc09111adbb51a4e5e326f8984bf07
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextField('Email'),
            _buildTextField('Password', isPassword: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFF00B2E7),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/reset_password'),
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/signup'),
              child: Text(
                'Don\'t have an account yet? Sign Up',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          suffixIcon: isPassword ? Icon(Icons.visibility) : null,
        ),
        obscureText: isPassword,
      ),
    );
  }
}
