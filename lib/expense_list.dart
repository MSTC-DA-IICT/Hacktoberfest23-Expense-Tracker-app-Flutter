import 'package:expense_tracker_app/expense_item.dart';
import 'package:expense_tracker_app/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
  });
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          return ExpenseItem(
            expense: expenses[index],
          );
        });
  }
}
