// utils.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spendwise/home_page.dart';

Future<void> addTransaction({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required String type,
  required TextEditingController amountController,
  required TextEditingController categoryController,
  required TextEditingController descriptionController,
  required bool recurring,
}) async {
  final docRef = FirebaseFirestore.instance.collection('transactions').doc();
  final userAuth = FirebaseAuth.instance.currentUser;

  if (formKey.currentState!.validate()) {
    try {
      await docRef.set({
        "type": type,
        "amount": amountController.text,
        "category": categoryController.text,
        "description": descriptionController.text,
        "recurring": recurring,
        "date": Timestamp.now(),
        "userId": userAuth!.uid,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Transaction added successfully'),
            backgroundColor: Color(0xFF00B2E7),
          ),
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add transaction: $e')),
      );
    }

    formKey.currentState!.reset();
  }
}

// read all transactions
Future<QuerySnapshot<Map<String, dynamic>>> getTransactions() async {
  final userAuth = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;
  final recentTransactionsRef = db
      .collection('transactions')
      .where('userId', isEqualTo: userAuth!.uid)
      .orderBy('date', descending: true)
      .limit(5);

  print(recentTransactionsRef);

  return recentTransactionsRef.get();
}

Future getTopTransactions() async {
  final userAuth = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;
  final topTransactionsRef = db
      .collection('transactions')
      .where('userId', isEqualTo: userAuth!.uid)
      .orderBy('amount', descending: true)
      .limit(5);

  return topTransactionsRef.get();
}
