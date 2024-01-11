import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/carts.dart';

class CartScreen extends StatelessWidget {

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {

    final cartData = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Consumer<CartProvider>(
                      builder: (context, value, child) {
                        return Text(
                          "\$${value.totalPrice}",
                          style: TextStyle(
                            color: Theme.of(context).hintColor
                          ),
                        );
                      },
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.network(
                        cartData.items.values.toList()[i].imgUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  ),
                  title: Text(
                    cartData.items.values.toList()[i].name,
                  ),
                  subtitle: Text(
                    "Quantity: ${cartData.items.values.toList()[i].qty}",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  trailing: Text(
                    "\$${cartData.items.values.toList()[i].price * cartData.items.values.toList()[i].qty}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                );
              },
              itemCount: cartData.items.length
            ),
          )
        ],
      )
    );
  }
}