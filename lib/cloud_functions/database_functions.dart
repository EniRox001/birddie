import 'package:birddie/models/user_model.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ObjectId uniqueId = ObjectId();
late DbCollection userCollection;

connectDB() async {
  var db = await Db.create(
      "mongodb+srv://enirox:Pwafukadi@cluster0.4iczrsa.mongodb.net/?retryWrites=true&w=majority");
  await db.open();

  DbCollection userDatabase = db.collection('users');
  userCollection = userDatabase;
}

Future createUser(BuildContext context) async {
  await userCollection.insert(
    User(
      uniqueId,
      context.read<UserProvider>().phoneNumber,
      context.read<UserProvider>().firstName,
      context.read<UserProvider>().lastName,
      context.read<UserProvider>().occupation,
      context.read<UserProvider>().gender,
      context.read<UserProvider>().dateOfBirth,
      context.read<UserProvider>().profilePicture,
      context.read<UserProvider>().profileVideo,
      context.read<UserProvider>().location,
      context.read<UserProvider>().lookingFor,
      context.read<UserProvider>().drinkAlcohol,
      context.read<UserProvider>().smoke,
    ).toMap(),
  );
}
