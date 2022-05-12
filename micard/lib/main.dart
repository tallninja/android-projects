import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.amber,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
                const Text(
                  'Ernest Wambua',
                  style: TextStyle(
                    fontFamily: 'RockSalt',
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "SOFTWARE ENGINEER",
                  style: TextStyle(
                    fontFamily: 'ShareTechMono',
                    fontSize: 20.0,
                    color: Colors.white,
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.amber[100],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 0.0,
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.phone,
                          color: Colors.amber,
                        ),
                        title: Text(
                          "+254 719 286 396",
                          style: TextStyle(
                            fontFamily: 'SourceCodePro',
                            color: Colors.amber[400],
                          ),
                        ),
                      )),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 0.0,
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.mail,
                          color: Colors.amber,
                        ),
                        title: Text(
                          "enestwambua2@gmail.com",
                          style: TextStyle(
                            fontFamily: 'SourceCodePro',
                            color: Colors.amber[400],
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
