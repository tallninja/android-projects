// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:kaizen_app/screens/Video_page/page6.dart';
import 'package:kaizen_app/screens/Video_page/page7.dart';
import 'package:kaizen_app/screens/core/const.dart';

class viedo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(AppColors.lightBlueShadow);
    return Scaffold(
      backgroundColor: Color(0XFFe5eefc), //maincolor
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Text('Learning Materials ',
            style: TextStyle(
              color: (Colors.white), //stylecolor
            )),
        //  backgroundColor: Color(0XFFe5eefc), //maincolor
        centerTitle: true,
      ),
      body: Container(
        color: Color(0XFFe5eefc), //maincolor

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(50.0),
                child: Image.asset(
                    'assets/logos/R63936791e5028e895017440ed0c26072.png'),

                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: NetworkImage(
                //         'https://miro.medium.com/max/1000/0*_KISko3_H_L7hZMj.jpg'),
                //     fit: BoxFit.cover,
                //   ),
                //   color: AppColors.mainColor,
                //   borderRadius: BorderRadius.circular(180),
                //   border: Border.all(
                //     width: 2,
                //     color: AppColors.mainColor,
                //   ),
                //   boxShadow: [
                //     BoxShadow(
                //       color: AppColors.activeColor,
                //       blurRadius: 10,
                //       offset: Offset(5, 5),
                //       spreadRadius: 3,
                //     ),
                //     BoxShadow(
                //       color: Colors.white,
                //       blurRadius: 5,
                //       offset: Offset(-5, -5),
                //       spreadRadius: 3,
                //     )
                //   ],
                //   gradient: RadialGradient(colors: [
                //     AppColors.mainColor,
                //     AppColors.mainColor,
                //     AppColors.mainColor,
                //     Colors.white,
                //   ]),
                // ),
                // // margin: EdgeInsets.all(20),
                // width: 300,
                // height: 300,
                // // color: Colors.blue,
                // // child: Text('second'),
              ),
              Container(
                  color: Color(0XFFd0ddf3),
                  width: 400,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.signal_cellular_connected_no_internet_4_bar,
                        size: 40.0,
                        color: Color(0XFF5880ff),
                      ),
                      SizedBox(
                        width: 150.0,
                      ),
                      // margin: const EdgeInsets.all(10.0),
                      MaterialButton(
                        splashColor: Color(0XAA92aeff),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500)),
                        height: 50,
                        color: Color(0XFF92aeff),
                        child: Text(
                          '       Offline           ',
                          style: TextStyle(
                            color: Color(0XFF6f7e96),
                            letterSpacing: 2.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Page6()), //Page2
                          );
                          // Navigate to second route when tapped.
                        },
                      ),
                    ],
                  )),
              Container(
                  color: Color(0XFFd0ddf3),
                  width: 400,
                  height: 100,
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.language,
                        size: 40.0,
                        color: Color(0XFF5880ff),
                      ),
                      SizedBox(
                        width: 150.0,
                      ),
                      // margin: const EdgeInsets.all(10.0),
                      MaterialButton(
                        splashColor: Color(0XAA92aeff),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500)),
                        height: 50,
                        color: Color(0XFF92aeff),
                        child: Text(
                          '      Online     ',
                          style: TextStyle(
                            color: Color(0XFF6f7e96),
                            letterSpacing: 2.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Page7()),
                          );
                          // Navigate to second route when tapped.
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
