import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Uninitialized variables to be used for setting preferences;
late SharedPreferences prefs;
late String loggedInUser;

//Initialized variables to be used as conditionals for widgets;
final bool? firstTime = prefs.getBool('firstTime');
final String? loggedInNum = prefs.getString('loggedInNum');

initSharedPref() async {
  prefs = await SharedPreferences.getInstance();
}

void setFirstTime(bool firstTime, String phoneNum) async {
  prefs.setBool('firstTime', firstTime);
  prefs.setString('loggedInNum', phoneNum);
}
