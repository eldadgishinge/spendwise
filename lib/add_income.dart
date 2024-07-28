import 'package:flutter/material.dart';
import 'package:spendwise/utils.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

 
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
      activeColor: Theme.of(context).colorScheme.primary,
      value: _recurring,
      onChanged: (bool value) {
        setState(() {
          _recurring = value;
        });
      },
    );
  }
}
