


import 'package:flutter/material.dart';

var list = <Widget>[];


class Expense extends StatefulWidget {
  final String name;
  final int amount;
  Expense({super.key, required this.name, required this.amount});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),

      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('./assets/credit.jpg'),
        ),
        tileColor: Color(0xfff4bbff),
        shape: RoundedRectangleBorder( //<-- SEE HERE

          borderRadius: BorderRadius.circular(20),
        ),


        title: Text(widget.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        subtitle: Row(
          children: [
            Text('captions',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        trailing: Text('\₹ ${widget.amount}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}



