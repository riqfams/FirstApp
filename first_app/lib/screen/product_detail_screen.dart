import 'package:fancy_button_flutter/fancy_button_flutter.dart';
import 'package:first_app/provider/carts.dart';
import 'package:first_app/provider/products.dart';
import 'package:first_app/widget/badge.dart' as customBadge;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {

  static const routeName = '/product_detail';

  @override
  Widget build(BuildContext context){

    final productId = ModalRoute
        .of(context)?.settings
        .arguments as String;

    final product = Provider
        .of<ProductProvider>(context)
        .findById(productId);
    
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
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
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.network(
                product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  height: 50,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "Rp${product.price}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                product.description,
                style: const TextStyle(
                    fontSize: 16,
                ),
              )
            ],
          ),
          FancyButton(
              button_icon: Icons.add_shopping_cart_rounded,
              button_text: "  Add to Cart  ",
              button_height: 40,
              button_width: 200,
              button_radius: 50,
              button_color: Theme.of(context).hintColor,
              button_outline_color: Colors.yellow,
              button_outline_width: 1,
              button_text_color: Colors.white,
              button_icon_color: Colors.white,
              icon_size: 22,
              button_text_size: 15,
              onClick: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Product added to cart"),
                      duration: Duration(
                          milliseconds: 1000
                      ),
                    )
                );
                cart.addToCart(product.id, product.name, product.price, product.imageUrl);
              })
      ],
      ),
    );
  }
}