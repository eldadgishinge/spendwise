import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spendwise/utils.dart';

class FinancialQuotesPage extends StatelessWidget {
  const FinancialQuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Quotes'),
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: getFinancialQuotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final List<Map<String, dynamic>> quotes =
                snapshot.data!.docs.map((doc) => doc.data()).toList();

          
  }
}
