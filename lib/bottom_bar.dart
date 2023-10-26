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

  TextEditingController nameOfExpense = TextEditingController();
  TextEditingController amountOfExpense = TextEditingController();

  TextEditingController tags = TextEditingController();
  // GlobalKey<_BottomState> bottomStateKey = GlobalKey();
  List<Widget> list = <Widget>[];
  List<Tag> tagArray = <Tag>[];
  int index_color=0;  
  
  bool _nameError = false, _amountError = false;

  void checkError(){

    try{
      double.parse(amountOfExpense.text);
        _amountError = false;
        
    }catch(e){
      setState(() {
        _amountError = true;
      });
    }

    if(nameOfExpense.text.isEmpty){
      setState(() {
        _nameError = true;
      });

    }else{
        _nameError = false;
    }



  }
  void addExpense(String name, double amount){
    setState(() => list.add(Expense(name: name, amount: amount, tags: tagArray,)));
  }
  

  void onDeleteTag(String s){
    setState(() {
      tagArray.removeWhere((element) => element.tagString == s);
    });
  }

  Tag makeNewChip(String s){
    return Tag(tagString: s,onDelete: onDeleteTag);
  }



  @override
  Widget build(BuildContext context) {
    List Screen = [Home(addExpense: addExpense,list: list, ),const Chart(),const Profile()];
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState((){
          tagArray.clear();
        });
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
            
            

            
            return AlertDialog(
              title: const Text("Add Expense",
                textAlign: TextAlign.left,
              ),
              content: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      TextField(
              
                        controller:nameOfExpense,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Enter The Expense-Name',
                          errorText: _nameError ? "Invalid Name" : null,
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
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Enter the amount',
                          errorText: _amountError ? "Invalid Amount" : null,
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
                      controller: tags,
                      onEditingComplete: (){

                        String tag = tags.text;
                        
                        setState(() {
                          tagArray.add(makeNewChip(tag));
                        });
                        tags.clear();

                      },
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Enter Tags',
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
                    Wrap(
                      textDirection: TextDirection.ltr,
                      alignment: WrapAlignment.center,
                      children: tagArray ,
                    ),
                      const SizedBox(height: 15,),
                    ]
                ),
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  checkError();
                  if(!_amountError && !_nameError){
                    String name = nameOfExpense.text;
                    double amount = double.parse(amountOfExpense.text);
                    addExpense(name, double.parse(amount.toStringAsFixed(3)));
                    Navigator.of(context).pop();
                    nameOfExpense.clear();
                    amountOfExpense.clear();
                    
                    
                  }
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



