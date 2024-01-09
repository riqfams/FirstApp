import 'package:faker/faker.dart';
import 'package:first_app/login.dart';
import 'package:first_app/profile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  static const nameRoute = 'home';

  const MyHomePage({
    super.key,
    required this.myTabs,
    required this.myColor,
  });

  final List<Tab> myTabs;
  final List<Container> myColor;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String hasil = "";
  String dialogText = "";

  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Flutter Demo',
            style: TextStyle(
                fontFamily: 'Montserrat'
            ),
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        bottom: TabBar(
          tabs: widget.myTabs,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey[700],
        ),
        leading: const SizedBox(
          width: 1,
          height: 1,
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            child: IconButton(
              icon: const Icon(
                  Icons.person
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Profile.nameRoute);
              },
            )
          )
        ],
      ),
      body: TabBarView(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Car Name',
                          prefixIcon: Icon(
                              Icons.directions_car
                          ),
                          icon: Icon(
                              Icons.directions_car
                          )
                      ),
                      controller: TextEditingController(),
                      onSubmitted: (value) {
                        setState(() {
                          hasil = value;
                        });
                      },
                    ),
                    Column(
                      children: [
                        const Text(
                            "Hasil Submit"
                        ),
                        Text(hasil),
                        const Text(
                            "Hasil Dialog"
                        ),
                        Text(dialogText)
                      ],
                    )
                  ],
                )
            ),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(10),
              children: widget.myColor,
            ),
            Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                        key: Key(index.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete),
                        ),
                        confirmDismiss: (direction) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: Text("Confirm"),
                                    content: Text("Are you sure you want to add this file?"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text("No")
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text("Yes")
                                      )
                                    ]
                                );
                              }
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Center(
                              child: Text("${index+1}"),
                            ),
                          ),
                          title: Text(faker.person.name()),
                          subtitle: Text(faker.lorem.sentence()),
                        )
                    );
                  },
                  itemCount: 20,
                )
            ),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("tombol telah diklik");
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Confirm"),
                  content: Text("Are you sure you want to add this file?"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          print("No");
                          setState(() {
                            dialogText = "NO :(";
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("No")
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print("Yes");
                          setState(() {
                            dialogText = "YES :)";
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Yes")
                    )
                  ],
                );
              }
          );
        },
        child: Icon(
            Icons.add
        ),
      ),
    );
  }
}
