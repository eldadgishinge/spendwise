import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/firebase/auth/firebase_auth_services.dart';
import 'package:spendwise/global/toast.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _termsAccepted = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextField('Name', _nameController),
            _buildTextField('Email', _emailController),
            _buildTextField('Password', _passwordController, isPassword: true),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      _termsAccepted = value ?? false;
                    });
                  },
                ),
                const Text(
                  'By signing up, you agree to the ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const Text(
                  'Terms of Service and Privacy Policy',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _termsAccepted ? _signUp : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF00B2E7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child:
                  const Text('Sign Up', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            const Text('Or continue with'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Implement Google Sign-Up logic here
              },
              icon: Image.asset(
                'assets/google-icon.png',
                width: 24, // Specify the size of the icon
                height: 24,
              ),
              label: const Text('Sign Up with Google'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Already have an account? Login',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[500], fontSize: 14.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[50],
          suffixIcon: isPassword ? const Icon(Icons.visibility) : null,
        ),
        obscureText: isPassword,
      ),
    );
  }

  Future<void> _signUp() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      User? userCredential = await _auth.signUpWithEmailAndPassword(
        email,
        password,
      );
      if (userCredential != null) {
        // Optionally update the user's display name
        showToast(message: 'Sign up successful');
        await userCredential.updateDisplayName(_nameController.text.trim());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? 'An unknown error occurred';
      });
    }
  }
}
