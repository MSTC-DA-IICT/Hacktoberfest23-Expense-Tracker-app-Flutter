import 'dart:convert';

import 'package:expense_tracker_app/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool loading = false;
  // final _formKey =GlobalKey<FormState>();

  final namecontroller = TextEditingController();

  final Emailcontroller = TextEditingController();

  final phoneNumberController = TextEditingController();

  final Addcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late SharedPreferences sharedPreferences;
  //final phoneNumberController=TextEditingController();
  //final auth = FirebaseAuth.instance;

  // final databaseRef1 = FirebaseDatabase.instance.ref("ContactDetails");
  final firestore = FirebaseFirestore.instance.collection("ProfileFormDetails");
void initState(){
  super.initState();
  initialGetSaved();
}
void initialGetSaved()async{
  sharedPreferences= await SharedPreferences.getInstance();
  Map<String,dynamic>jsondatais = jsonDecode(sharedPreferences.getString('userdata')!);
  User user= User.fromJson(jsondatais);

  if(jsondatais.isNotEmpty){
    namecontroller.value=TextEditingValue(text: user.name);
    Emailcontroller.value=TextEditingValue(text: user.email);
    phoneNumberController.value=TextEditingValue(text: user.phone);
    Addcontroller.value=TextEditingValue(text: user.Add);
  }
}
void storeData(){
  User user =User(namecontroller.text, Emailcontroller.text, phoneNumberController.text, Addcontroller.text);
String userdata = jsonEncode(user);
print(userdata);
sharedPreferences.setString('userdata', userdata);

}
  @override
  Widget build(BuildContext context) {
    Size size;

    double height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Profile'),
          centerTitle: true,
          leading: Icon(Icons.arrow_back),
        ),
        body: Stack(children: <Widget>[
          Center(
            child: Container(
              child: Center(
                  child: Image.asset(
                'assets/dollar.gif',
              )),
            ),
          ),
          Container(
              color: Colors.transparent,
              height: double.infinity,
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                          key: _formKey,
                          child: Column(children: [
                            SizedBox(
                              height: height * 0.07,
                            ),
                            Text("Name",textAlign: TextAlign.left,style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
                            SizedBox(height: height*0.015,),
                            TextFormField(
                                onChanged: (val) {},
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 209, 18, 220)),
                                controller: namecontroller,
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    focusColor:
                                        const Color.fromARGB(255, 92, 232, 99),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.purpleAccent),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: ("Enter Your Name"),
                                    hintStyle: const TextStyle(
                                        fontSize: 14,
                                        color:
                                             Color.fromARGB(255, 219, 7, 234))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your Name';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Text("Email ID",textAlign: TextAlign.left,style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
                            SizedBox(height: height*0.015,),
                            TextFormField(
                                onChanged: (val) {},
                                style: const TextStyle(
                                    color:  Color.fromARGB(255, 219, 7, 234)),
                                controller: Emailcontroller,
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    focusColor:
                                        const Color.fromARGB(255, 92, 232, 99),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(255, 219, 7, 234)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: ("Enter Your Email ID"),
                                    hintStyle: const TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 219, 7, 234))),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !value.contains(RegExp(
                                          r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'))) {
                                    return 'Enter valid email Id ';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Text("Phone number",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
                            SizedBox(height: height*0.015,),
                            TextFormField(
                                onChanged: (val) {},
                                style: const TextStyle(
                                    color: Colors.purpleAccent),
                                controller: phoneNumberController,
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    focusColor:
                                        const Color.fromARGB(255, 92, 232, 99),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color:  Color.fromARGB(255, 219, 7, 234)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: ("Enter phone no(+91)"),
                                    hintStyle: const TextStyle(
                                        fontSize: 14,
                                        color:
                                             Colors.purpleAccent)),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value.length != 13 ||
                                      value.contains(RegExp(
                                          r'^(?=.*[a-zA-Z!@#$%^&*])[\w!@#$%^&*]{1,9}$'))) {
                                    return 'Enter valid Phone number';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Text("Estimated Expenses",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
                            SizedBox(height: height*0.015,),
                            TextFormField(
                                onChanged: (val) {},
                                style: const TextStyle(
                                    color: Colors.purpleAccent),
                                controller: Addcontroller,
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.number,
                                // maxLines: 3,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    focusColor:
                                        const Color.fromARGB(255, 92, 232, 99),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color:  Colors.purpleAccent),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: ("Enter approx monthly expenses"),
                                    hintStyle: const TextStyle(
                                        fontSize: 14,
                                        color:
                                             Colors.purpleAccent)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter approx expenses ';
                                  }
                                  return null;
                                }),
                            SizedBox(height: height*0.02,),
                            TextButton(
                                onPressed: () {
                                  storeData();
                                  if (_formKey.currentState!.validate()) {
                                    String Id =
                                        DateTime.now().millisecond.toString();
                                    firestore.doc(Id).set({
                                      'name': namecontroller.text.toString(),
                                      'address': Addcontroller.text.toString(),
                                      'phone number':
                                          phoneNumberController.text.toString(),
                                      'email': Emailcontroller.text.toString(),
                                    });
                                    //             Container(
                                    //               height: height*0.05,
                                    //               width: height*0.05,
                                    //               child: Image(image: NetworkImage(
                                    //   "https://cdn3.iconfinder.com/data/icons/flat-actions-icons-9/792/Tick_Mark_Dark-256.png",
                                    // ),)
                                    //             );
                                  }
                                },

                                //if at all realtime database is required to be used, the following code
                                //snippet can be uncommented and also its reference is to be uncommented

                                // databaseRef1
                                //     .child(DateTime.now()
                                //         .millisecondsSinceEpoch
                                //         .toString())
                                //     .set({
                                //   'id':
                                //       DateTime.now().millisecondsSinceEpoch.toString(),
                                //   'name': namecontroller.text.toString(),
                                //   'address': Addcontroller.text.toString(),
                                //   'phone number': phoneNumbercontroller.text.toString(),
                                //   'email': Emailcontroller.text.toString(),
                                //   //'Contact info ': PhController.text.toString()
                                // });
                               
                                  

                                style: TextButton.styleFrom(
                                  backgroundColor:
                                       Color.fromARGB(255, 181, 45, 205),
                                ),
                                child: SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.6,
                                  child: const Text("Update Profile",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 252, 253, 253),
                                      )),
                                )),
                          ]))))),
        ]));
  }
}
