import 'package:p8/models/item.dart';
import 'package:hive/hive.dart';
part 'cart.g.dart';

@HiveType(typeId: 0)
class Cart extends HiveObject {
  @HiveField(0)
  late Item item;
  @HiveField(1)
  late int amount;

  Cart({
    required this.item,
    required this.amount,
  });
}
