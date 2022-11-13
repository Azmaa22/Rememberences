import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/citation_screen/citation_screen.dart';
import 'package:flutter_apps/screens/home_screen/home_screen.dart';
import 'package:flutter_apps/utilities/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: const HomeScreen(),
    );
  }
}
