// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'export_data_page.dart';
import 'logout_confirmation_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://example.com/profile_image.jpg'), // Replace with the actual image URL
            ),
            const SizedBox(height: 10),
            const Text(
              'ALU Student',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // _buildProfileOption(context, 'Account', Icons.account_circle),
            _buildProfileOption(
                context, 'Settings', Icons.settings, SettingsPage()),
            _buildProfileOption(
                context, 'Export Data', Icons.cloud_download, const ExportDataPage()),
            _buildProfileOption(
                context, 'Logout', Icons.exit_to_app, const LogoutConfirmationPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, String title, IconData icon,
      [Widget? page]) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor, size: 30),
          title: Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
