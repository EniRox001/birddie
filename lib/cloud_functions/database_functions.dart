import 'package:birddie/models/events.dart';
import 'package:birddie/models/user_model.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//User ID to reference collections across database
ObjectId uniqueId = ObjectId();

//Initialize late collections
late DbCollection userCollection;
late DbCollection eventsCollection;

late dynamic event;
late int eventsLength;

connectDB() async {
  var db = await Db.create(
      "mongodb+srv://enirox:Pwafukadi@cluster0.4iczrsa.mongodb.net/?retryWrites=true&w=majority");
  await db.open();

  DbCollection userDatabase = db.collection('users');
  DbCollection eventDatabase = db.collection('events');

  //Add reference to the intialized database collections
  userCollection = userDatabase;
  eventsCollection = eventDatabase;
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

Future createEvent(BuildContext context) async {
  await eventsCollection.insert(Events(
    uniqueId,
    'Black Panther 2',
    'Come and watch the premiere of the most anticipated marvel movie of the century, only at fastnet cinema',
    '3',
    [],
    2,
    '20/12/2022',
    '16:00:00',
    false,
  ).toMap());
}

getEvents() async {
  await eventsCollection.find().toList().then(
    (value) {
      eventsLength = value.length;
      event = value;
      print(event);
    },
  );
}
