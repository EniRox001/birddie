import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:birddie/cloud_functions/database_functions.dart';

class CreateUserProvider extends ChangeNotifier {
  late String _phoneNumber;
  late String _firstName;
  late String _lastName;
  late String _occupation;
  late String _gender;
  late String _dateOfBirth;
  late String _profilePicture;
  late String _profileVideo;
  late String _location;
  late String _lookingFor;
  late String _drinkAlcohol;
  late String _smoke;

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
}

class UserProvider extends ChangeNotifier {
  late String _phoneNumber;
  late String _firstName;
  late String _lastName;
  late String _occupation;
  late String _gender;
  late String _dateOfBirth;
  late String _profilePicture;
  late String _profileVideo;
  late String _location;
  late String _lookingFor;
  late String _drinkAlcohol;
  late String _smoke;

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

  void setDrinkAlcohol(bool drinkAlcohol) {
    if (drinkAlcohol == true) {
      _drinkAlcohol = 'yes';
    } else {
      _drinkAlcohol = 'no';
    }
    notifyListeners();
  }

  void setSmoke(bool smoke) {
    if (smoke == true) {
      _smoke = 'yes';
    } else {
      _smoke = 'no';
    }
    notifyListeners();
  }
}
