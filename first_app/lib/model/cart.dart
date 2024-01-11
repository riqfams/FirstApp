
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final String id;
  final String name;
  final String imgUrl;
  final double price;
  final int qty;

  Cart({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
    required this.qty
  });
}