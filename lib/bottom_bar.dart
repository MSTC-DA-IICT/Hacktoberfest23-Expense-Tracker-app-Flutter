// ignore_for_file: non_constant_identifier_names


import 'package:flutter/material.dart';
import 'add_new_card.dart';
import 'home.dart';
import 'chart.dart';
import 'profile.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  GlobalKey<_BottomState> bottomStateKey = GlobalKey();
  int index_color=0;
  

  void addExpense(String name, int amount){
    setState(() => list.add(Expense(name: name, amount: amount)));
  }

  @override
  Widget build(BuildContext context) {
    List Screen = [Home(addExpense: addExpense,),const Chart(),const Profile()];
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(onPressed: (){
        popUpDialog(context);
      },
      backgroundColor: const Color(0xffec88ff),
      child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.only(top: 7.5, bottom: 7.5,left: 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color=0;
                    });
                  },
                  child: Icon(Icons.home,
                  size: 30,
                  color: index_color==0?const Color(0xffec88ff):Colors.grey,),
                ),
                const SizedBox(width: 90,),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color=1;
                    });
                  },
                  child: Icon(Icons.bar_chart,
                    size: 30,
                    color: index_color==1?const Color(0xffec88ff):Colors.grey,),
                ),
                const SizedBox(width: 90,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color=2;
                    });

                  },
                  child: Icon(Icons.person,
                    size: 30,
                    color: index_color==2?const Color(0xffec88ff):Colors.grey,),
                ),
              ],
            ),
          ),
        ),
    );
  }

  popUpDialog(BuildContext context){
    showDialog(
        barrierDismissible: true,context: context, builder: (context)
    {
      return StatefulBuilder(
          builder: ((context,setState) {
            TextEditingController nameOfExpense = TextEditingController();
            TextEditingController amountOfExpense = TextEditingController();
            
            return AlertDialog(
              title: const Text("Add Expense",
                textAlign: TextAlign.left,
              ),
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:[
                    TextField(
                      controller:nameOfExpense,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      controller: amountOfExpense,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      onChanged: (val){

                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      onChanged: (val){

                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      onChanged: (val){

                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                  ]
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  String name = nameOfExpense.text;
                  int amount = int.parse(amountOfExpense.text);
                  addExpense(name, amount);
                  Navigator.of(context).pop();
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ), child:  const Text("Create"),
                ),


              ],

            );})
      );
    });


  }

  
}



