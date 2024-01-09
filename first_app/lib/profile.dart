import 'package:fancy_button_flutter/fancy_button_flutter.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  static const nameRoute = 'profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final String profileImg = "assets/images/fotoAriq.png";
  final String email = "ariqfadhil2015@gmail.com";
  final String name = "Ariq Fadhil Musyaffa";
  bool statusSwitch = false;
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        leading: const SizedBox(
          width: 1,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.asset(profileImg),
            ),
            const SizedBox(height: 25),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              email,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 25),
            FancyButton(
                button_text: "Logout",
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
                  Navigator.of(context).pop();
                }),
            const SizedBox(height: 25),
            Switch(
                activeColor: Colors.lightGreen,
                inactiveThumbColor: Colors.amber,
                inactiveTrackColor: Colors.limeAccent,
                value: statusSwitch,
                onChanged: (value) {
                  setState(() {
                    statusSwitch = !statusSwitch;
                  });
                }
            ),
            Text(
                (statusSwitch == true) ? "Switch ON" : "Switch OFF",
              style: const TextStyle(
                fontSize: 16
              ),
            ),
            const SizedBox(height: 25),
            const Text(
                "Time",
              style: TextStyle(
                  fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: selectDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050)
                      ).then((value) {
                        setState(() {
                          selectDate = value!;
                        });
                      }
                      );
                    },
                    child: const Text("Date Picker")
                ),
                const SizedBox(width: 10),
                Text(
                  selectDate.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}