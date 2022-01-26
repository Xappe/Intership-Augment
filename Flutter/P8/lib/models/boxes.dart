import 'package:hive/hive.dart';
import 'package:p8/models/cart.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static Box<Cart> getCart() => Hive.box<Cart>('boxCart');
}
