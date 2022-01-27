import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen_app/screens/LoginScreen.dart';
import 'package:kaizen_app/services/auth_provider.dart';
import 'package:kaizen_app/services/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: GetMaterialApp(
        title: "Login UI Application",
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        //home: NavigationPage(),
      ),
    );
  }
}
