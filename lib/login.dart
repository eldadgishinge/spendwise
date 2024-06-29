import 'package:flutter/material.dart';
import 'home_page.dart'; // Ensure HomePage is imported

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextField('Email'),
            _buildTextField('Password', isPassword: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Replace with your actual login logic (e.g., validate credentials, call a login API)
                // Assuming successful login...
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF00B2E7),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/reset_password'),
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/signup'),
              child: const Text(
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
          suffixIcon: isPassword ? const Icon(Icons.visibility) : null,
        ),
        obscureText: isPassword,
      ),
    );
  }
}
