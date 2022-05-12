import 'package:kaizen_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("displayName", user.email);
    prefs.setString("username", user.userName);
    prefs.setString("phoneNumber", user.phoneNumber);
    prefs.setString("firstName", user.firstName);
    prefs.setString("lastName", user.lastName);
    prefs.setString("role", user.role);
    prefs.setString("password", user.password);
    //prefs.setString("email", user.email);
    //prefs.setString("imei", user.imei);
    prefs.setString("token", user.token);
    //prefs.setString("renewalToken", user.renewalToken);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email");
    String username = prefs.getString("username");
    String token = prefs.getString("token");
    //String renewalToken = prefs.getString("renewalToken");
    return User(
        email: email,
        userName: username,
        //phoneNumber: phonenumber,

        //email: email,
        //imei: imei,
        token: token);
    //renewalToken: renewalToken);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    prefs.remove("email");
    //prefs.remove("imei");
    prefs.remove("token");
    prefs.remove('password');
    prefs.remove('firstName');
    prefs.remove('lastName');
    prefs.remove('phoneNumber');
    prefs.remove('role');
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
