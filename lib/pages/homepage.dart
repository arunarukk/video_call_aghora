import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'joinWithCode.dart';
import 'new_meeting.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Conference"),
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
          child: ElevatedButton.icon(
            onPressed: () {
              Get.to(NewMeeting());
            },
            icon: Icon(Icons.add),
            label: Text(
              "New Meeting",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(350, 50),
              primary: Colors.green.shade400,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
        ),
        Divider(
          thickness: 1,
          height: 40,
          indent: 40,
          endIndent: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: OutlinedButton.icon(
            onPressed: () {
              Get.to(JoinWithCode());
            },
            icon: Icon(Icons.margin),
            label: Text(
              "Join with code",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            style: OutlinedButton.styleFrom(
              primary: Colors.green.shade400,
              side: BorderSide(color: Colors.green.shade400),
              fixedSize: Size(350, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
        ),
      ]),
    );
  }
}
