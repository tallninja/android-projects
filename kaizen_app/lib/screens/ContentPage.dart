// ignore_for_file: non_constant_identifier_names, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen_app/screens/Media.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final List<String> Listof = [
    'Photosynthesis',
    'Human Eye',
    'Human Body',
    'Human Tooth',
    'Human Brain',
    'Evolution',
    'Food Chain',
    'Breathing System',
    'Digestive system',
    'Animal Health',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: Text(
            'Contents',
            style: TextStyle(
              fontSize: 19.0,
            ),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
        ),
        backgroundColor: Colors.grey,
        body: Container(
          child: ListView.builder(
            itemBuilder: (_, int index) => listContentpage(this.Listof[index]),
            itemCount: this.Listof.length,
          ),
        ));
  }
}

class listContentpage extends StatelessWidget {
  String ContentName;
  listContentpage(this.ContentName);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(MyApp());
      },
      child: Card(
        elevation: 7,
        child: Container(
          margin: EdgeInsets.all(9.0),
          padding: EdgeInsets.all(6.0),
          child: Row(children: <Widget>[
            CircleAvatar(
              child: Text(ContentName[0]),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Text(
              ContentName,
              style: TextStyle(fontSize: 20),
            )
          ]),
        ),
      ),
    );
  }
}

// class ContentPage extends StatefulWidget {
//   @override
//   _ContentPageState createState() => _ContentPageState();
// }
//
// class _ContentPageState extends State<ContentPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Material(
//         child: Container(
//             width: double.infinity,
//             decoration: BoxDecoration(color: Palette.primaryColor),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 50.0, left: 20),
//                       child: Row(
//                         children: [
//                           Icon(Icons.arrow_back, color: Colors.white),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         SizedBox(height: 0),
//                         Container(
//                           color: Colors.grey,
//                           width: 2000.0,
//                           height: 100.0,
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         Text(
//                           'Contents',
//                           style:
//                               TextStyle(fontSize: 18.0, color: Colors.white70),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                       child: Container(
//
//                           //color: Colors.grey,
//                           child: ListWheelScrollView(
//                             //children: page,
//
//                             children: <Widget>[
//                               GestureDetector(onTap: () {
//                                 print('Detected');
//                               })
//                             ],
//
//                             itemExtent: 75,
//                             squeeze: 2,
//
//                             //itemExtent: 100,
//                             // clipToSize: true,
//                             diameterRatio: 0.8,
//                             offAxisFraction: 0.1,
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(50.0),
//                                   topLeft: Radius.circular(50.0)))))
//                 ])),
//       ),
//     );
//   }
//
//   final page = [
//     RaisedButton(
//       color: Colors.blueAccent,
//       onPressed: () {},
//       child: Text(' The Human Eye'),
//     ),
//     RaisedButton(
//       color: Colors.blueAccent,
//       onPressed: () {},
//       child: Text('The Human Ear '),
//     ),
//     RaisedButton(
//       color: Colors.blueAccent,
//       onPressed: () {},
//       child: Text('Reproduction System'),
//     ),
//     RaisedButton(
//       color: Colors.blueAccent,
//       onPressed: () {},
//       child: Text('Digestive System'),
//     ),
//     RaisedButton(
//       color: Colors.blueAccent,
//       onPressed: () {
//         print('Button Clicked');
//       },
//       child: Text('Breathing System'),
//     ),
//     RaisedButton(
//       color: Colors.blueAccent,
//       onPressed: () {},
//       child: Text('Reproduction System'),
//     ),
//     /*ListTile(
//       title: Text('Introduction to Photosynthesis'),
//     ),
//     ListTile(
//       title: Text('Human Body '),
//     ),
//
//     ListTile(
//       title: Text('The human eye'),
//     ),
//     ListTile(
//       title: Text('Bones'),
//     ),*/
//   ];
// }
