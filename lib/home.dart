import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
              delegate: SliverChildBuilderDelegate(
                  (content,index) {
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


                        title: const Text('expense',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: const Text('caption',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        trailing: const Text('\₹ 50',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  }
              ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
                  padding: const EdgeInsets.only(left: 105),
                  child: Row(
                      children: [
                        Text('\₹ 0.00',
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
                  padding: const EdgeInsets.symmetric(horizontal:15),
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(

                    children: [
                      Text('\₹ 0.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 90,),
                      Text('\₹ 0.00',
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
