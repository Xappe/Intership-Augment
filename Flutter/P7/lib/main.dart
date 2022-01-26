import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p7/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "To do App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
