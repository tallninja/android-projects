// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen_app/config/palette.dart';

import '../services/backend_helper.dart';

class CulturalPractises extends StatefulWidget {
  @override
  _CulturalPractisesState createState() => _CulturalPractisesState();
}

class _CulturalPractisesState extends State<CulturalPractises> {
  TextEditingController _incidentController = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _townController = TextEditingController();
  TextEditingController _occurrenceTimesController = TextEditingController();
  TextEditingController _genderAffectedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF5880ff),
        title: Text(
          'Report any Cultural Incidences ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Container(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _incidentController,
                  decoration: InputDecoration(
                    hintText: 'Incident Type',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _regionController,
                  decoration: InputDecoration(
                    hintText: 'Region',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Description ',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _townController,
                  decoration: InputDecoration(
                    hintText: 'Town',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _occurrenceTimesController,
                  decoration: InputDecoration(
                    hintText: 'Occurrence Time',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _genderAffectedController,
                  decoration: InputDecoration(
                    hintText: 'Gender Affected',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: RaisedButton(
                      color: Palette.primaryColorLight,
                      elevation: 0,
                      onPressed: () async {
                        final String incident = _incidentController.text;
                        final String region = _regionController.text;
                        final String description = _descriptionController.text;
                        final String town = _townController.text;
                        final String occurrenceTimes =
                            _occurrenceTimesController.text;
                        final String genderAffected =
                            _genderAffectedController.text;

                        await BackendHelper.submitCulture(
                          incident: incident,
                          region: region,
                          desc: description,
                          town: town,
                          occurrenceTimes: occurrenceTimes,
                          gender: genderAffected,
                        );
                        Get.back();
                      },
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: (BorderRadius.circular(50))),
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
