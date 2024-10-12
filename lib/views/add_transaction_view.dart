import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saving_app/widgets/toggle_switch.dart';

class AddTransactionView extends StatefulWidget {
  const AddTransactionView({super.key});

  @override
  _AddTransactionViewState createState() => _AddTransactionViewState();
}

class _AddTransactionViewState extends State<AddTransactionView> {
  int _transactionType = 0; // 0 for Outcome, 1 for Income
  DateTime _selectedDate = DateTime.now();
  String? _selectedCategory;
  bool _isAutomatic = false;
  String? _selectedFrequency;
  final TextEditingController _descriptionController = TextEditingController(); // Renamed to description
  final TextEditingController _amountController = TextEditingController();

  final List<String> _incomeCategories = ['Salary', 'Investment', 'Gift'];
  final List<String> _outcomeCategories = ['Grocery', 'Rent', 'Entertainment'];
  final List<String> _frequencies = ['Monthly', 'Weekly', 'Daily', 'Yearly']; // Default to Monthly

  // Validation flags
  bool _isAmountValid = true;

  @override
  void initState() {
    super.initState();
    _selectedCategory = _transactionType == 0 ? _outcomeCategories[0] : _incomeCategories[0]; // Default selection
    _selectedFrequency = _frequencies[0]; // Default to Monthly
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // No shadow
        iconTheme: const IconThemeData(), // Set back button color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomToggleSwitch(
                labels: const ['Outcome', 'Income'],
                initialIndex: _transactionType,
                onToggle: (index) {
                  setState(() {
                    _transactionType = index;
                    _selectedCategory = index == 0 ? _outcomeCategories[0] : _incomeCategories[0]; // Reset category when type changes
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  errorText: !_isAmountValid ? 'Please enter a valid amount.' : null, // Show error if invalid
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Date'),
                subtitle: Text(DateFormat('yyyy-MM-dd').format(_selectedDate)),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickDate,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: (_transactionType == 0 ? _outcomeCategories : _incomeCategories)
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description (optional)', // Renamed to Description
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text('Automatic'),
                value: _isAutomatic,
                activeColor: Colors.white,
                activeTrackColor: Colors.blueAccent,
                onChanged: (value) {
                  setState(() {
                    _isAutomatic = value;
                    if (!_isAutomatic) _selectedFrequency = null; // Reset frequency if disabled
                  });
                },
              ),
              if (_isAutomatic) ...[
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedFrequency,
                  items: _frequencies
                      .map((frequency) => DropdownMenuItem(
                            value: frequency,
                            child: Text(frequency),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedFrequency = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Frequency',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: _submitTransaction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white, // White text
                  ),
                  child: const Text('Add Transaction'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitTransaction() {
    // Access the input data
    String description = _descriptionController.text; // Get description
    double? amount = double.tryParse(_amountController.text);

    // Validate the inputs
    setState(() {
      _isAmountValid = amount != null && amount > 0;
    });

    if (!_isAmountValid) {
      return; // Return early if there are validation errors
    }

    if (_selectedCategory == null) {
      _showError('Please select a category.');
      return;
    }

    if (_isAutomatic && _selectedFrequency == null) {
      _showError('Please select a frequency for automatic transactions.');
      return;
    }

    // Process the transaction here (e.g., save it using your models)
    print('Transaction Type: ${_transactionType == 0 ? 'Outcome' : 'Income'}');
    print('Description: $description'); // Print description
    print('Amount: $amount');
    print('Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}');
    print('Category: $_selectedCategory');
    print('Is Automatic: $_isAutomatic');
    if (_isAutomatic) {
      print('Frequency: $_selectedFrequency');
    }

    // Perform additional actions like saving to the database and closing the view if needed
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
