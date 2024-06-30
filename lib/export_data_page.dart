import 'package:flutter/material.dart';

class ExportDataPage extends StatelessWidget {
  const ExportDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_download,
                size: 80, color: Theme.of(context).primaryColor),
            const SizedBox(height: 20),
            const Text(
              'Export the financial report in CSV format?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Later'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add export functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    minimumSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: const TextStyle(color: Colors.white), // Text color
                  ),
                  child: const Text('Download'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
