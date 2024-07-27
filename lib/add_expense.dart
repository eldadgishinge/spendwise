import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/utils.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

final FirebaseFirestore db = FirebaseFirestore.instance;

class _AddExpensePageState extends State<AddExpensePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _recurring = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF8D6C),
        title: const Text('Add Expense', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('How much was spent?', style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '\$0',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildTextField(_categoryController, 'Category'),
              _buildTextField(_descriptionController, 'Description'),
              _buildAttachmentButton(),
              _buildRepeatSwitch(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  addTransaction(
                    context: context,
                    formKey: _formKey,
                    type: 'expense',
                    amountController: _amountController,
                    categoryController: _categoryController,
                    descriptionController: _descriptionController,
                    recurring: _recurring,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFFFF8D6C),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a $label';
          }
          return null;
        },
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
      activeColor: const Color(0xFFFF8D6C),
      value: _recurring,
      onChanged: (bool value) {
        setState(() {
          _recurring = value;
        });
      },
    );
  }
}
