import 'package:birddie/cloud_functions/cloudinary_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:birddie/cloud_functions/database_functions.dart';

class UserProvider extends ChangeNotifier {
  late ObjectId _id;
  late String _phoneNumber;
  late String _firstName;
  late String _lastName;
  late String _occupation;
  String _gender = "male";
  String _dateOfBirth = 'Date of Birth';
  String _profilePicture = profilePictureUrl;
  String _profileVideo = profileVideoUrl;
  late String _location;
  late String _lookingFor;
  String _drinkAlcohol = 'no';
  String _smoke = 'no';

  ObjectId get id => _id;
  String get phoneNumber => _phoneNumber;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get occupation => _occupation;
  String get gender => _gender;
  String get dateOfBirth => _dateOfBirth;
  String get profilePicture => _profilePicture;
  String get profileVideo => _profileVideo;
  String get location => _location;
  String get lookingFor => _lookingFor;
  String get drinkAlcohol => _drinkAlcohol;
  String get smoke => _smoke;

  //Function to be called if user exists in the database;
  void setUser() async {
    _id = loggedInUser[0]['id'];
    _phoneNumber = loggedInUser[0]['phone_number'];
    _firstName = loggedInUser[0]['first_name'];
    _lastName = loggedInUser[0]['last_name'];
    _occupation = loggedInUser[0]['occupation'];
    _gender = loggedInUser[0]['gender'];
    _dateOfBirth = loggedInUser[0]['date_of_birth'];
    _profilePicture = loggedInUser[0]['profile_picture'];
    _profileVideo = loggedInUser[0]['profileVideo'];
    _location = loggedInUser[0]['location'];
    _lookingFor = loggedInUser[0]['looking_for'];
    _drinkAlcohol = loggedInUser[0]['drink_alcohol'];
    _smoke = loggedInUser = loggedInUser[0]['smoke'];
  }

//Set of functions to be called if user does not exist (during registration)
  void setPhoneNumber(String number) {
    _phoneNumber = "+234$number";
    notifyListeners();
  }

  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void setOccupation(String occupation) {
    _occupation = occupation;
    notifyListeners();
  }

  void setGender(int gender) {
    if (gender == 1) {
      _gender = "male";
    } else {
      _gender = "female";
    }
    notifyListeners();
  }

  void setDateOfBirth(String dateOfBirth) {
    _dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  void setProfilePicture(String profilePicture) {
    _profilePicture = profilePicture;
    notifyListeners();
  }

  void setProfileVideo(String profileVideo) {
    _profileVideo = profileVideo;
    notifyListeners();
  }

  void setLocation(String location) {
    _location = location;
    notifyListeners();
  }

  void setLookingFor(String lookingFor) {
    _lookingFor = lookingFor;
    notifyListeners();
  }

  void setDrinkAlcohol(String drinkAlcohol) {
    _drinkAlcohol = drinkAlcohol;
    notifyListeners();
  }

  void setSmoke(String smoke) {
    _smoke = smoke;
    notifyListeners();
  }
}
