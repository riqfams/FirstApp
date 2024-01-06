import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var faker = new Faker();
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Flutter Demo',
              style: TextStyle(
                  fontFamily: 'Montserrat'
              ),
            ),
          ),
          backgroundColor: Colors.lightGreen
        ),
        // body: ListView.separated(
        //   separatorBuilder: (BuildContext context, int index) {
        //     return const Divider(
        //       color: Colors.white,
        //     );
        //   },
        //   itemCount: 10,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       height: 200,
        //       color: Colors.blue,
        //       child: const Center(
        //         child: Text(
        //           'Hello World',
        //           style: TextStyle(
        //               color: Colors.amber,
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold,
        //               fontFamily: 'Montserrat'
        //           ),
        //         ),
        //       ),
        //     );
        //   }
        // )
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (counter != 1) {
                      setState(() {
                        counter--;
                      });
                    }
                    print(counter);
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                    print(counter);
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListWidget(
                      imageUrl: 'https://picsum.photos/id/$index/200/300',
                      title: faker.person.name(),
                      subtitle: faker.lorem.sentence(),
                    );
                  },
                  itemCount: 20,
                )
            )

          ]
        ),
      )
    );
  }
}

class ListWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  ListWidget({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.favorite_border),
      onTap: () {
        print('Hello World');
      },
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        0.5,
      ),
    );
  }
}
