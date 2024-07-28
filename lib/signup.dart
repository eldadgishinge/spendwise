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
