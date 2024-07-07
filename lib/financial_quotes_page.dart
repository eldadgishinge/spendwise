import 'package:flutter/material.dart';

class FinancialQuotesPage extends StatelessWidget {
  final List<Map<String, String>> quotes = [
    {
      'quote': 'An investment in knowledge pays the best interest.',
      'author': 'Benjamin Franklin'
    },
    {
      'quote': 'In investing, what is comfortable is rarely profitable.',
      'author': 'Robert Arnott'
    },
    {
      'quote': 'Price is what you pay. Value is what you get.',
      'author': 'Warren Buffett'
    },
    {
      'quote': 'A penny saved is a penny earned.',
      'author': 'Benjamin Franklin'
    },
    {
      'quote': 'The art is not in making money, but in keeping it.',
      'author': 'Proverb'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Quotes'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quotes[index]['quote']!,
                    style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '- ${quotes[index]['author']}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
