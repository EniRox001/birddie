import 'package:mongo_dart/mongo_dart.dart';

class User {
  ObjectId id;
  String phoneNumber;
  String firstName;
  String lastName;
  String occupation;
  String gender;
  String dateOfBirth;
  String profilePicture;
  String profileVideo;
  String location;
  String lookingFor;
  String drinkAlcohol;
  String smoke;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'occupation': occupation,
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'profile_picture': profilePicture,
      'profileVideo': profileVideo,
      'location': location,
      'looking_for': lookingFor,
      'drink_alcohol': drinkAlcohol,
      'smoke': smoke,
    };
  }

  User(
    this.id,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.occupation,
    this.gender,
    this.dateOfBirth,
    this.profilePicture,
    this.profileVideo,
    this.location,
    this.lookingFor,
    this.drinkAlcohol,
    this.smoke,
  );
}
