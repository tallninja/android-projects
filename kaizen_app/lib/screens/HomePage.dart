// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:kaizen_app/config/palette.dart';
import 'package:kaizen_app/screens/ContentPage.dart';
import 'package:kaizen_app/widgets/cutom_item.dart';

import 'Courses.dart';
import 'SideMenuBar.dart';

List<String> items = List<String>();
List<String> imagelist = List<String>();
List<String> classList = List<String>();
List<String> skills = List<String>();
List<String> skillsimage = List<String>();

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var items = [
      'Maths',
      'English',
      'Science',
      'World',
    ];
    var imagelist = [
      'assets/logos/math.png',
      'assets/logos/english.png',
      'assets/logos/science.png',
      'assets/logos/world.png',
    ];
    var skills = [
      'Drawing',
      'Guitar',
      'Time management',
      'communication',
    ];
    var skillsimage = [
      'assets/logos/drawing.png',
      'assets/logos/guitar.png',
      'assets/logos/time.png',
      'assets/logos/communication.png',
    ];

    return Scaffold(
      //drawer: NavBar(),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: Color(0XFF5880ff),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print('Notification bell pressed');
              }),
          // IconButton(
          //     icon: Icon(Icons.warning_outlined),
          //     onPressed: () {
          //       Get.to(CulturalPractice());
          //     }),
          IconButton(
            icon: Icon(Icons.announcement_outlined),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => NetworkGiffyDialog(
                        image: Image.network(
                          'https://classroomclipart.com/images/gallery/Animations/Education_School/student-holding-pen-paper-pad-animation.gif',
                          fit: BoxFit.fitHeight,
                        ),
                        entryAnimation: EntryAnimation.LEFT,
                        title: Text(
                          '''Education Tip
                         Did you know??''',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Palette.primaryColorLight),
                        ),
                        description: Text(
                          '''Education is the most powerful weapon which you can use to change the world.
                        Education is perhaps one of the most important ingredients to a happy, successful, and constructive life. In fact, having access to a good education during childhood and your early adulthood can make a real difference in your later life.''',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onlyCancelButton: true,
                        buttonCancelColor: Palette.primaryColorLight,
                        buttonOkColor: Colors.blue,
                      ));
            },
          )
        ],
        title: Text(
          'Kaizen App',
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'Recommended Lessons',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: GestureDetector(
                onTap: () {
                  Get.to(ContentPage());
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    //                 return GestureDetector()
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 200.0,
                        // child: CustomItem(
                        //   receivedText: items[index],
                        // ),
                        child: CustomItem(
                          receivedText: items[index],
                          imagelist: imagelist[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'Top Skills',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                //shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: skills.length,
                itemBuilder: (BuildContext context, int index) {
                  /*Container(
                    child: Image.asset(imagelist[index]),
                  );*/
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 100.0,
                      child: CustomItem(
                        receivedText: skills[index],
                        imagelist: skillsimage[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: GestureDetector(
            onTap: () {
              Get.to(WelcomeScreen());
            },
            child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 5,
                  // ),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.black54],
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/logos/Quiz.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Center(
                    child: Text(
                  "Take a Quiz",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))),
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              // border: Border.all(
              //   color: Colors.black,
              //   width: 5,
              // ),
              gradient: LinearGradient(
                colors: [Colors.white, Colors.black54],
              ),
              image: const DecorationImage(
                image: AssetImage('assets/logos/braingame.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}

//class Courses {}
