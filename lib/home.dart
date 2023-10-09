
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final List<Widget> list;
  final Function(String,double) addExpense;
  const Home({Key? key, required this.addExpense, required this.list}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 300, child: head()),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children : [
                    Text('Your past transactions:' ,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ]
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(widget.list),
            )
          ],
        )
      ),
    );
  }

  Widget head(){
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Stack(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 110),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'EXPENSE TRACKER',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    )



                  ]
              ),
            ),
          ],
        ),
        Positioned(
          top: 110,
          left: 37,
          child: Container(
            height: 170,
            width: 320,
            decoration: BoxDecoration(
              boxShadow:const [
                BoxShadow(
                  color: Colors.purpleAccent,
                  offset: Offset(0,6),
                  blurRadius: 12,
                  spreadRadius: 6,
                ),
              ],


              color: Colors.purple,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your balance:',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 3),
                Padding(
                  padding:  EdgeInsets.only(left: 105),
                  child: Row(
                      children: [
                        Text('₹ 0.00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 29,
                            color: Colors.white,
                          ),
                        )
                      ]
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:15),
                  child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Your Income:',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Row(
                          children: [
                            Text(
                              'Your Expenses:',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(

                    children: [
                      Text('₹ 0.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 90,),
                      Text('₹ 0.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


