import 'package:flutter/material.dart';
import 'package:spendwise/utils.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _recurring = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Add Income'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('How much was made?', style: TextStyle(fontSize: 18)),
            const Text('\$0',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildTextField('Category'),
            _buildTextField('Description'),
            _buildAttachmentButton(),
            _buildRepeatSwitch(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addTransaction(
                    context: context,
                    formKey: _formKey,
                    type: 'income',
                    amountController: _amountController,
                    categoryController: _categoryController,
                    descriptionController: _descriptionController,
                    recurring: _recurring);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
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
