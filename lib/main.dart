import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist1/pages/pages.dart';

void main() async {
  // initial hive
  await Hive.initFlutter();

  // creat a box
  var box = await Hive.openBox('MyBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.yellow,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.yellow,
        ),
      ),
      home: homePage(),
    );
  }
}
