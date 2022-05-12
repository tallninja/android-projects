// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  String receivedText;
  String imagelist;
  CustomItem({
    @required this.receivedText,
    @required this.imagelist,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          child: Container(
            height: double.infinity,
            width: 110.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                  ),
                ]),
          ),
        ),
        ClipRect(
          child: Container(
            height: double.infinity,
            width: 110.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                  ),
                ]),
            child: Image.asset(imagelist),
            // child: Image.asset(
            //     //   items [0]
            //     "assets/logos/R63936791e5028e895017440ed0c26072.png"),
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Text(receivedText),
        ),
        /*Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Image.asset(imagelist),
        ),*/
      ],
    );
  }
}
