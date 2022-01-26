import 'package:flutter/material.dart';
import 'package:p9/pages/home_page.dart';
import 'package:get/get.dart';

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
