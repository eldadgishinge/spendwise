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
          _buildS
          // Add navigation to setting detail pages if necessary
        },
      ),
    );
  }
}
