import 'package:flutter/material.dart';
import 'home.dart';
import 'chart.dart';
import 'profile.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color=0;
  List Screen = [Home(),Chart(),Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(onPressed: (){
        popUpDialog(context);

      },
      child: Icon(Icons.add),
      backgroundColor: Color(0xffec88ff),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
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
                  color: index_color==0?Color(0xffec88ff):Colors.grey,),
                ),
                SizedBox(width: 90,),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color=1;
                    });
                  },
                  child: Icon(Icons.bar_chart,
                    size: 30,
                    color: index_color==1?Color(0xffec88ff):Colors.grey,),
                ),
                SizedBox(width: 90,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color=2;
                    });

                  },
                  child: Icon(Icons.person,
                    size: 30,
                    color: index_color==2?Color(0xffec88ff):Colors.grey,),
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
            return AlertDialog(
              title: const Text("Add Expense",
                textAlign: TextAlign.left,
              ),
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:[
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
                            borderSide: BorderSide(
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
                    SizedBox(height: 15,),
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
                            borderSide: BorderSide(
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
                    SizedBox(height: 15,),
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
                            borderSide: BorderSide(
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
                    SizedBox(height: 15,),
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
                            borderSide: BorderSide(
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
                    SizedBox(height: 15,),
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
                            borderSide: BorderSide(
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
                  Navigator.of(context).pop();
                }, child: const Text("Create"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),


              ],

            );})
      );
    });


  }
}



