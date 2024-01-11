import 'package:first_app/provider/products.dart';
import 'package:first_app/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<ProductProvider>(context);
    final allProduct = productData.allProducts;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: allProduct[i],
        child: ProductItem(),
      ),
      padding: const EdgeInsets.all(10.0),
      itemCount: allProduct.length,
    );
  }
}