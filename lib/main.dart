import 'package:expense_tracker_app/splash.screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottom_bar.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
// <<<<<<< feature/krish-features
        home: const Bottom(),
// =======
//       home: const SplashScreen(),
// >>>>>>> master
      theme: ThemeData(
        primaryColor: Constants().primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
