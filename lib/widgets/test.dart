import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String transactionType = 'Income'; // Default type
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
        backgroundColor: transactionType == 'Income' ? Colors.green : Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Income / Outcome Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTransactionTypeButton('Income', Colors.green),
                SizedBox(width: 16),
                _buildTransactionTypeButton('Outcome', Colors.red),
              ],
            ),
            SizedBox(height: 16),

            // Amount Input
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Description Input
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Date Picker
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey),
                    SizedBox(width: 12),
                    Text(
                      selectedDate != null
                          ? "${selectedDate!.toLocal()}".split(' ')[0]
                          : 'Select Date',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: _saveTransaction,
                child: Text('Save Transaction'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: transactionType == 'Income' ? Colors.green : Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Transaction type button
  Widget _buildTransactionTypeButton(String type, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          transactionType = type;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: transactionType == type ? color : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          type,
          style: TextStyle(
            color: transactionType == type ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Date picker function
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // Save transaction function
  void _saveTransaction() {
    final String amount = _amountController.text.trim();
    final String description = _descriptionController.text.trim();

    if (amount.isEmpty || selectedDate == null || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill out all fields.')),
      );
      return;
    }

    // Add logic to save transaction here (e.g., call a Cubit method)

    Navigator.pop(context); // Close the page after saving
  }
}
