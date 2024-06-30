import 'package:flutter/material.dart';
import 'financial_quotes_page.dart';
import 'talk_to_expert_page.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Resources'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildResourceTile(
              context,
              'Financial Quotes',
              'Daily inspiring financial wisdom',
              Icons.account_balance,
              FinancialQuotesPage(),
            ),
            _buildResourceTile(
              context,
              'Talk to an expert',
              'Personalized expert financial advice',
              Icons.headset,
              TalkToExpertPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceTile(BuildContext context, String title, String subtitle,
      IconData icon, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Card(
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
