import 'package:flutter/material.dart';
import 'package:mbi/Styles/constants.dart';
import 'package:mbi/Screens/home.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF26A59A),
        scaffoldBackgroundColor: const Color(0xFF26A59A),
        appBarTheme: const AppBarTheme(centerTitle: true, color: kInactiveCardColor),
      ),
      home: HomePage(),
    );
  }
}