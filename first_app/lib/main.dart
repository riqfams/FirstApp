import 'package:first_app/provider/carts.dart';
import 'package:first_app/provider/products.dart';
import 'package:first_app/screen/cart_screen.dart';
import 'package:first_app/screen/product_detail_screen.dart';
import 'package:first_app/screen/product_overview_screen.dart';
import 'package:first_app/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Shop",
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            hintColor: Colors.deepOrange,
            fontFamily: "Montserrat"
        ),
        home: SplashScreen(),
        routes: {
          ProductOverviewScreen.routeName: (ctx) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen()
        },
      ),
    );
  }
}
