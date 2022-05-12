import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kaizen_app/config/urls.dart';
import 'package:kaizen_app/models/Class.dart';
import 'package:kaizen_app/models/content.dart';

class BackendHelper with ChangeNotifier {
  Future<Content> getContent() async {
    Content content;
    Response response = await get(
      GET_CONTENT,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      content = Content.fromJson(responseData);
    } else {}

    print(response.statusCode);
    return content;
  }

  Future<ClassListN> getClass() async {
    ClassListN classList;
    Response response = await get(
      GET_CLASS,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      classList = ClassListN.fromJson(responseData);
    } else {}

    print(response.statusCode);
    return classList;
  }

  static Future<String> submitCulture(
      {String incident,
      String region,
      String desc,
      String town,
      String occurrenceTimes,
      String gender}) async {
    Response response = await post(
      GET_CULTURE,
      //headers: {'Content-Type': 'application/json'},
      body: {
        "incident": incident,
        "region": region,
        "description": desc,
        "town": town,
        "occurrenceTimes": occurrenceTimes,
        "genderAffected": gender
      },
    );
    print(response);
    if (response.statusCode == 200) {
    } else {}

    print(response.statusCode);
    return response.statusCode.toString();
  }
}
