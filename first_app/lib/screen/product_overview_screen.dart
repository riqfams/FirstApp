import 'package:first_app/provider/carts.dart';
import 'package:first_app/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/product_grid.dart';
import '../widget/badge.dart' as customBadge;

class ProductOverviewScreen extends StatelessWidget{

  static const routeName = '/home';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return customBadge.Badge(
                color: Theme.of(context).hintColor,
                value: value.cartCount.toString(),
                child: child!,
              );
            },
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName
                );
              },
            ),
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}

