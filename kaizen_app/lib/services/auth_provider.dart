import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kaizen_app/config/urls.dart';
import 'package:kaizen_app/models/user.dart';
import 'package:kaizen_app/services/user_preference.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    print("Response Initiated");

    Response response = await post(
      LOGIN,
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    print(email);
    print(response.statusCode);
    print("Response Received");

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      User authUser = User.fromJson(responseData);
      UserPreferences().saveUser(authUser);
      _loggedInStatus = Status.LoggedIn;
      print(responseData);
      notifyListeners();
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };

      print(response.statusCode);
    }

    return result;
  }

  Future<Map<String, dynamic>> register(
      {String userName,
      String email,
      String password,
      String firstName,
      String phoneNumber,
      region}) async {
    final Map<String, dynamic> registrationData = {
      "userName": userName,
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": firstName,
      "role": firstName,
      "phoneNumber": phoneNumber,
    };

    _registeredInStatus = Status.Registering;
    notifyListeners();
    return await post(SIGN_UP,
            body: json.encode(registrationData),
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    print(response.statusCode);
    if (response.statusCode == 200) {
      User authUser = User.fromJson(responseData);
      UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> verifyPass(String email, String password) async {
    var result;
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };

    Response response = await post(
      LOGIN,
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    print(email);
    print(response);
    print("Response Received");

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      //var userData = responseData['data'];
      User authUser = User.fromJson(responseData);
      UserPreferences().saveUser(authUser);
      _loggedInStatus = Status.LoggedIn;
      print(responseData);
      notifyListeners();
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
