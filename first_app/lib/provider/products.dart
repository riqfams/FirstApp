
import 'dart:math';

import 'package:flutter/cupertino.dart';
import '../model/product.dart';
class ProductProvider with ChangeNotifier {

  final List<Product> _allProducts = List.generate(
      10,
          (index) {
        return Product(
            id: "id ${index + 1}",
            name: "Product ${index + 1}",
            description: "Ini deskripsi produk ${index + 1}",
            imageUrl: "https://picsum.photos/id/${index + 50}/200/300",
            price: Random().nextInt(10000).toDouble()
        );
      }
  );

  List<Product> get allProducts {
    return [..._allProducts];
  }

  Product findById(productId) {
    return _allProducts.firstWhere((prod) => prod.id == productId);
  }
}