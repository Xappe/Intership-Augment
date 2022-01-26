import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p8/models/cart.dart';
import 'package:p8/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CartAdapter());
  await Hive.openBox<Cart>('boxCart');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Shop App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
