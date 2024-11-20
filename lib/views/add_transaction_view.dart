import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:saving_app/cubits/add_transaction_cubit/add_transaction_cubit.dart';
import 'package:saving_app/models/income_transaction_model.dart';
import 'package:saving_app/models/outcome_transaction_model.dart';
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
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  // Define categories here
  final List<String> _incomeCategories = ['Salary', 'Investment', 'Gift']; // **Income categories**
  final List<String> _outcomeCategories = ['Grocery', 'Rent', 'Entertainment']; // **Outcome categories**
  final List<String> _frequencies = ['Monthly', 'Weekly', 'Daily', 'Yearly'];

  bool _isAmountValid = true;

  @override
  void initState() {
    super.initState();
    // Set default category based on transaction type
    _selectedCategory = _transactionType == 0 ? _outcomeCategories[0] : _incomeCategories[0];
    _selectedFrequency = _frequencies[0];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTransactionCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Transaction'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(),
        ),
        body: BlocConsumer<AddTransactionCubit, AddTransactionState>(
          listener: (context, state) {
            if (state is AddTransactionSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Transaction added successfully!')),
              );
              Navigator.pop(context); // Navigate back after success
            } else if (state is AddTransactionFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // **Transaction type toggle (Outcome or Income)**
                    CustomToggleSwitch(
                      labels: const ['Outcome', 'Income'],
                      initialIndex: _transactionType,
                      onToggle: (index) {
                        setState(() {
                          _transactionType = index;
                          // Update categories based on transaction type
                          _selectedCategory =
                              index == 0 ? _outcomeCategories[0] : _incomeCategories[0];
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // **Amount input field**
                    TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        border: const OutlineInputBorder(),
                        errorText: !_isAmountValid ? 'Please enter a valid amount.' : null,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // **Date picker**
                    ListTile(
                      title: const Text('Date'),
                      subtitle: Text(DateFormat('yyyy-MM-dd').format(_selectedDate)),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: _pickDate, // **Calls date picker method**
                    ),
                    const SizedBox(height: 20),

                    // **Category dropdown based on transaction type**
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

                    // **Description field**
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description (optional)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // **Automatic switch and frequency**
                    SwitchListTile(
                      title: const Text('Automatic'),
                      value: _isAutomatic,
                      activeColor: Colors.white,
                      activeTrackColor: Colors.blueAccent,
                      onChanged: (value) {
                        setState(() {
                          _isAutomatic = value;
                          if (!_isAutomatic) _selectedFrequency = null;
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

                    // **Submit button**
                    Center(
                      child: ElevatedButton(
                        onPressed: () => _submitTransaction(context), // **Handles submission**
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Add Transaction'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // **Method to pick date**
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

  // **Method to submit transaction**
  void _submitTransaction(BuildContext context) {
    String description = _descriptionController.text;
    double? amount = double.tryParse(_amountController.text);

    setState(() {
      _isAmountValid = amount != null && amount > 0;
    });

    if (!_isAmountValid || _selectedCategory == null) {
      return; // **Prevent submission if validation fails**
    }

    final cubit = context.read<AddTransactionCubit>();

    // **Call the appropriate cubit method based on transaction type**
    if (_transactionType == 0) {
      cubit.addOutComeTransaction(OutcomeModel(
        title: description.isEmpty ? "No Description" : description,
        amount: amount!,
        category: _selectedCategory!,
        date: _selectedDate,
      ));
    } else {
      cubit.addInComeTransaction(IncomeModel(
        title: description.isEmpty ? "No Description" : description,
        amount: amount!,
        source: _selectedCategory!,
        date: _selectedDate,
      ));
    }
  }
}
