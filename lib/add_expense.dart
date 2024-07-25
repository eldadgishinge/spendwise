import 'package:flutter/material.dart';

class AddExpensePage extends StatelessWidget {
  const AddExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF8D6C),
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('How much was spent?', style: TextStyle(fontSize: 18)),
            const Text('\$0',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildTextField('Category'),
            _buildTextField('Description'),
            _buildTextField('Wallet'),
            _buildAttachmentButton(),
            _buildRepeatSwitch(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFFFF8D6C),
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildAttachmentButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.attachment),
        label: const Text('Add attachment'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.black,
        ),
      ),
    );
  }

  Widget _buildRepeatSwitch() {
    return SwitchListTile(
      title: const Text('Repeat transaction'),
      value: false,
      onChanged: (bool value) {},
    );
  }
}
