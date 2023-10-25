import 'package:expense_tracker_app/add_expense_page.dart';
import 'package:expense_tracker_app/expense_list.dart';
import 'package:expense_tracker_app/expenses_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<void> _expensesFuture;

  @override
  void initState() {
    super.initState();
    _expensesFuture = ref.read(expenseProvider.notifier).loadPlaces();
  }

  Widget build(BuildContext context) {
    final expenses = ref.watch(expenseProvider);
    double sum = expenses
        .map((expense) => expense.price)
        .fold(0, (prev, amount) => prev + amount);
    Widget content = ExpenseList(expenses: expenses);

    Widget totalAmt = Text(
      sum.toString() + " ₹",
      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 30),
    );
    if (expenses.isEmpty) {
      totalAmt = Text('No Expense Added');
    }
    if (expenses.isEmpty) {
      content = Center(
        child: Text('Add an expense'),
      );
    }
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(90))),
        title: const Text('Expenses App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.6,
            height: MediaQuery.sizeOf(context).width * 0.2,
            child: Card(
              elevation: 7,
              margin: EdgeInsets.all(8),
              color: Colors.purple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(90))),
              child: Center(child: totalAmt),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: FutureBuilder(
                future: _expensesFuture,
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
                        ? const Center(child: CircularProgressIndicator())
                        : content),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 191, 0),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const AddExpenseScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
