// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen_app/config/palette.dart';
import 'package:kaizen_app/services/auth_provider.dart';
import 'package:provider/provider.dart';

import 'NavigationPage.dart';

TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _userNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _regionController = TextEditingController();

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    login() async {
      auth
          .register(
        userName: _userNameController.text,
        password: _passwordController.text,
        firstName: _firstNameController.text,
        email: _emailController.text,
        phoneNumber: _phoneController.text,
        // role :_roleController.text,
        region: _regionController.text,
      )
          .then((response) {
        //Provider.of(UserProvider)(context, li)
        Get.off(NavigationPage());
        print(response['status']);
      });
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Palette.primaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Container(
                    width: 2000.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: new AssetImage(
                                'assets/logos/R63936791e5028e895017440ed0c26072.png'),
                            fit: BoxFit.fitHeight)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 18.0, color: Colors.white70),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_box_rounded),
                              hintText: 'firstName',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_box_rounded),
                              hintText: 'lastName',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _userNameController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_box_rounded),
                              hintText: 'userName',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.call),
                              hintText: 'phoneNumber',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _regionController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_pin),
                              hintText: ('Region'),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          //child: DropdownButton(),
                          child: DropdownButton(
                              value: _value,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Parent"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Teacher"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text("Student"),
                                  value: 3,
                                )
                              ],
                              onChanged: (int value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                              hint: Text("Select Role")),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          //child: DropdownButton(),
                          child: DropdownButton(
                              value: _value,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Nyeri Kimathi'),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Nyeri School"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text("Nyeri School"),
                                  value: 3,
                                )
                              ],
                              onChanged: (int value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                              hint: Text("Select SChool")),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText:
                                  ('Password should contain unique characters'),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          child: RaisedButton(
                              color: Palette.primaryColorLight,
                              elevation: 0,
                              onPressed: () {
                                //Get.to(NavigationPage());
                                login();
                              },
                              padding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: (BorderRadius.circular(50))),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        /* Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey),
                        ),
                       SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF1453D),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Center(
                                    child: Text('Google',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0))),
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Center(
                                    child: Text('Facebook',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0))),
                              ),
                            ),
                          ],
                        )*/
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
