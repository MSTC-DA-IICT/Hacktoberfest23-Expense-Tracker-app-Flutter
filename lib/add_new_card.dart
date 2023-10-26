


import 'package:flutter/material.dart';




class Expense extends StatefulWidget {
  final String name;
  final double amount;
  final List<Widget> tags;
  const Expense({super.key, required this.name, required this.amount, required this.tags});

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
        tileColor: const Color(0xfff4bbff),
        shape: RoundedRectangleBorder( //<-- SEE HERE

          borderRadius: BorderRadius.circular(20),
        ),


        title: Text(widget.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        subtitle: Row(
          children: widget.tags,
        ),
        trailing: Text('₹ ${widget.amount}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class Tag extends StatefulWidget {
  final String tagString;
  final Function onDelete;
  const Tag({super.key, required this.tagString, required this.onDelete});

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(9,5,9,5),
      child: Stack(
        children: [
        Chip(
          backgroundColor: const Color(0xffec88ff),
          label:  Text(widget.tagString),
          deleteIconColor: Colors.red,
          deleteButtonTooltipMessage: 'Delete',
          ),
          Positioned(
            top: -17.5,
            left: -17.5,
            child: IconButton(
            icon:  Container(
              width: 20,
              height: 20,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red, // Color of the circle
      ),
      child: IconButton(
        icon: const Icon(Icons.close, color: Colors.white, size: 10,), // Close (X) icon
        onPressed: (){
          setState(() {
            //tagArray.removeWhere((element) => element);
            widget.onDelete(widget.tagString);
          });
        },
      ),
    ),
            onPressed: (){},
                  ),
          ),
        ],
      ),
    );
  }
}





