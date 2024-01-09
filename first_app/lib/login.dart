import 'dart:math';

import 'package:first_app/home.dart';
import 'package:flutter/material.dart';
import 'package:fancy_button_flutter/fancy_button_flutter.dart';

class Login extends StatefulWidget {

  static const nameRoute = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  List<Tab> myTabs = const [
    Tab(
        text: 'Car',
        icon: Icon(Icons.directions_car)
    ),
    Tab(
        text: 'Transit',
        icon: Icon(Icons.directions_transit)
    ),
    Tab(
        text: 'Bike',
        icon: Icon(Icons.directions_bike)
    ),
  ];

  List<Container> myColor = List.generate(15, (index) =>
      Container(
        height: 50,
        width: 100,
        color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
      )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  icon: Icon(Icons.mail)
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    icon: Icon(Icons.key)
                ),
              ),
              const SizedBox(height: 40),
              FancyButton(
                  button_text: "Login",
                  button_height: 50,
                  button_width: 200,
                  button_radius: 50,
                  button_color: Colors.blue,
                  button_outline_color: Colors.yellow,
                  button_outline_width: 1,
                  button_text_color: Colors.white,
                  // button_icon_color: Colors.white,
                  // icon_size: 22,
                  button_text_size: 16,
                  onClick: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) {
                              return DefaultTabController(
                                  length: 3,
                                  child: MyHomePage(myTabs: myTabs, myColor: myColor)
                              );
                            }
                        )
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}