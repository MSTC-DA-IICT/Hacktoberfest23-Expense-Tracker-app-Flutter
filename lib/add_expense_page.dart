import 'package:expense_tracker_app/expenses_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
// import 'package:google_fonts/google_fonts.dart';

class AddExpenseScreen extends ConsumerStatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  ConsumerState<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends ConsumerState<AddExpenseScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();

  void _saveExpense() {
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;
    final expenseTimeStamp = _dateTimeController.text;
    final expenseId = _titleController.text + _dateTimeController.text;

    if (enteredTitle.isEmpty) {
      return;
    }
    ref.read(expenseProvider.notifier).addExpense(
        double.tryParse(enteredAmount)!,
        enteredTitle,
        expenseId,
        expenseTimeStamp);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Expense'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                // cursorColor: Colors.amber,
                decoration: const InputDecoration(
                  label: Text("Title"),
                ),
                controller: _titleController,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                cursorColor: Colors.amber,
                decoration: const InputDecoration(
                  prefixText: '₹',
                  label: Text("Amount"),
                ),
                controller: _amountController,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                //editing controller of this TextField
                controller: _dateTimeController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      _dateTimeController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 255, 191, 0)),
                ),
                onPressed: _saveExpense,
                icon: const Icon(Icons.add),
                label: Text(
                  "Add Expense",
                  // style: GoogleFonts.montserrat(
                  //   color: Color.fromARGB(255, 0, 0, 0),
                  // ),
                ),
              )
            ],
          )),
    );
  }
}
