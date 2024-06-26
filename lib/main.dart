import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';
import 'reset_password.dart';
import 'launch_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LaunchScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/reset_password': (context) => ResetPasswordPage(),
      },
    );
  }
}
