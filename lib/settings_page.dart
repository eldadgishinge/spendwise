import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildSettingOption(context, 'Currency', 'RWF'),
          _buildSettingOption(context, 'Language', 'English'),
          _buildSettingOption(context, 'Theme', 'Dark'),
          _buildSettingOption(context, 'Security', 'Face ID'),
          _buildSettingOption(context, 'Notification', ''),
          _buildSettingOption(context, 'About', ''),
          _buildSettingOption(context, 'Help', ''),
        ],
      ),
    );
  }

  Widget _buildSettingOption(
      BuildContext context, String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          // Add navigation to setting detail pages if necessary
        },
      ),
    );
  }
}
