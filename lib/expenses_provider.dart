import 'package:expense_tracker_app/expense_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'expenses.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE Expenses(id TEXT PRIMARY KEY, title TEXT, amount REAL, dateTime TEXT)');
    },
    version: 1,
  );
  return db;
}

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super(const []);
  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('expenses');
    final places = data
        .map(
          (row) => Expense(
            id: row['id'] as String,
            name: row['title'] as String,
            price: row['amount'] as double,
            date: row['dateTime'] as String,
          ),
        )
        .toList();

    state = places;
  }

  void addExpense(
      double amount, String title, String id, String dateTime) async {
    final newExpense =
        Expense(price: amount, name: title, date: dateTime, id: id);
    final db = await _getDatabase();
    db.insert('Expenses', {
      'id': newExpense.id,
      'title': newExpense.name,
      'amount': newExpense.price,
      'dateTime': newExpense.date,
    });
    state = [newExpense, ...state];
  }

  Future<void> deleteExpense(String id) async {
    // Get a reference to the database.
    state = state.where((m) => m.id != id).toList();
    final db = await _getDatabase();

    // Remove the Dog from the database.
    await db.delete(
      'Expenses',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}

final expenseProvider = StateNotifierProvider<ExpenseNotifier, List<Expense>>(
  (ref) => ExpenseNotifier(),
);
