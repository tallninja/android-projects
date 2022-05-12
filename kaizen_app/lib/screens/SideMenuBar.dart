import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Cultural Practices.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                child: Image.asset(
                    'assets/logos/R63936791e5028e895017440ed0c26072.png'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "User",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              // Text('email'),
              Text(
                "Student",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("Edit Profile"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.inbox,
          color: Colors.black,
        ),
        title: Text("Messages"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.assessment,
          color: Colors.black,
        ),
        title: Text("View reports"),
      ),
      ListTile(
        onTap: () {
          Get.to(CulturalPractises());
        },
        leading: Icon(
          Icons.warning_sharp,
          color: Colors.black,
        ),
        title: Text("Report Cultural Act"),
      ),
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: Text("Settings"),
      ),
    ]);
  }
}
