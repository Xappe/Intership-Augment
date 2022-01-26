import 'package:flutter/material.dart';
import 'package:extractscreen/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extract',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
