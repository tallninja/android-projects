// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kaizen_app/models/user.dart';
import 'package:kaizen_app/screens/NavigationPage.dart';
import 'package:kaizen_app/services/auth_provider.dart';
import 'package:kaizen_app/services/user_provider.dart';
import 'package:kaizen_app/widgets/social_button_row.dart';
import 'package:provider/provider.dart';

import 'SignUpScreen.dart';

final formKey = new GlobalKey<FormState>();
String _username, _password;
TextEditingController usernameController = TextEditingController();
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;

  /* Widget buildLogo() {
    body:
    Center(
        child:
            Column(children: <Widget>[Image.asset('assets/logos/logo.png')]));
  }*/
  /*Widget buildUserName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /* Text(
          "Username",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),*/
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: usernameController,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.perm_identity_rounded,
                  color: Colors.black26,
                ),
                hintText: "UserName ",
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.centerLeft,
        )
      ],
    );
  }*/

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /* Text(
          "Email",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),*/
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black26,
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /* Text(
          "Password",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),*/
        SizedBox(
          height: 1,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black26,
                ),
                hintText: "Enter Password",
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        ),
        SizedBox(
          height: 0.5,
        ),
        Container(
          alignment: Alignment.centerLeft,
        )
      ],
    );
  }

  Widget buildforgotPasswordbtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Forgot Password clicked"),
        padding: EdgeInsets.only(right: 20),
        child: Text("Forgot Password"),
      ),
    );
  }

  Widget buildrememberme() {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.blue,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value;
                });
              },
            ),
          ),
          Text(
            "Remember me ",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildSignUpbutton() {
    return GestureDetector(
      onTap: () => Get.to(SignUpScreen()),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Don't have an account?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )),
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    doLogin() async {
      print("Started Login");
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        _username = emailController.text;
        _password = passwordController.text;
        print("Form Validated");
        Future<Map<String, dynamic>> successfulMessage =
            auth.login(_username, _password);
        //Get.off(NavigationPage());

        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Get.off(NavigationPage());
          } else {}
        });
      } else {
        print("Form not valid");
      }
    }

    Widget buildLoginButton(Function action) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 0),
        width: double.infinity,
        child: RaisedButton(
          elevation: 0,
          onPressed: () {
            doLogin();
            // Get.off(NavigationPage());
          },
          padding: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: (BorderRadius.circular(50))),
          child: Text(
            "Log in",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Form(
                key: formKey,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0xF26F52BA),
                        Color(0xB80F52BA),
                        Color(0xD60F52BA),
                        Color(0xF30F52BA),
                      ])),
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset(
                            "assets/logos/R63936791e5028e895017440ed0c26072.png"),
                        SizedBox(
                          height: 2.5,
                        ),
                        /* Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),*/
                        SizedBox(height: 1),
                        // buildLogo(),
                        // buildUserName(),
                        buildEmail(),
                        buildPassword(),
                        buildforgotPasswordbtn(),
                        buildrememberme(),
                        SocialButtonRow(),
                        buildLoginButton(doLogin),
                        buildSignUpbutton(),

                        //buildSocialBtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
