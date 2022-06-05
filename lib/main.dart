import 'package:flutter/material.dart';
import 'package:tlesson/colors.dart';
import 'package:tlesson/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Dys',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.coffee,
          actionsIconTheme: IconThemeData(
            color: AppColors.teal,
          ),
          // color: AppColors.coffee,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.teal,
          ),
          titleTextStyle: TextStyle(
            color: AppColors.teal,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: AppColors.blackCoffee,
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: AppColors.teal,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.teal,
          thickness: 2,
        ),
        backgroundColor: AppColors.tan,
        primaryColor: AppColors.teal,
        scaffoldBackgroundColor: AppColors.tan,
      ),
      home: const MainPage(),
    );
  }
}
