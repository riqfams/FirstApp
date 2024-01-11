import 'package:first_app/model/product.dart';
import 'package:first_app/provider/carts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<Product>(context, listen: false);
    final cartData = Provider.of<CartProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black.withOpacity(0.5),
          leading: Consumer<Product>(
            builder: (context, productData, child) => IconButton(
              icon: (productData.isFavorite) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
              color: Theme.of(context).hintColor,
              onPressed: () {
                productData.changeFavorite();
                },
            )
          ),
          title: Text(
            productData.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart_rounded),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Product added to cart"),
                  duration: Duration(
                    milliseconds: 1000
                  ),
                )
              );
              cartData.addToCart(productData.id, productData.name, productData.price, productData.imageUrl);
            },
            color: Theme.of(context).hintColor,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id
            );
          },
          child: Image.network(
            productData.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}