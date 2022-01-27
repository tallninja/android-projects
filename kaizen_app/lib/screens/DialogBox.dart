// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen_app/config/palette.dart';
import 'package:kaizen_app/screens/ContentPage.dart';

class ListViewDialog extends StatelessWidget {
  final List<String> subject = List<String>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Choose Subject',
            style: TextStyle(color: Colors.white),
          ),
        ),
        color: Palette.primaryColor,
      ),
      content: setupAlertDialogContainer(context),
    );
  }

  Widget setupAlertDialogContainer(context) {
    subject.add("English");
    subject.add('Kiswahili');
    subject.add('Science');
    subject.add('Social skills');
    subject.add('Health');
    subject.add('Skills');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          //color: Colors.grey,
          height: 300.0, // Change as per your requirement
          width: 300.0, // Change as per your requirement
          child: ListView.builder(
            // shrinkWrap: true,
            // itemCount: 15,
            itemCount: subject.length,
            itemBuilder: (BuildContext context, int index) {
              String subJ = subject[index];
              return ListTile(
                leading: Icon(
                  Icons.subject,
                  color: Colors.brown,
                ),
                title: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ContentPage());
                    },
                    //child: Text('subject $index')
                    //child:subject,
                    child: Text('$subJ'),
                    //  child: Text('List Item $index'),
                  ),
                )),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        )
      ],
    );
  }
}
