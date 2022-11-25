import 'package:birddie/models/events.dart';
import 'package:birddie/models/user_model.dart';
import 'package:birddie/providers/event_provider.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/utils/functions.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//User ID to reference collections across database
ObjectId uniqueId = ObjectId();

//Initialize late collections
late DbCollection userCollection;
late DbCollection eventsCollection;

late dynamic event;
late dynamic selectedEvent;
late dynamic loggedInUser;

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

Future getUser(
  BuildContext context,
  Widget onNoUser,
  Widget onUser,
) async {
  userCollection
      .find(
        where.eq("phone_number", context.read<UserProvider>().phoneNumber),
      )
      .toList()
      .then((value) {
    if (value.isEmpty) {
      navigate(context, onNoUser);
    } else {
      loggedInUser = value;
      context.read<UserProvider>().setUser();
      navigate(context, onUser);
    }
  });
}

Future createEvent(BuildContext context) async {
  await eventsCollection.insert(Events(
    uniqueId,
    'Black Panther 2',
    'Come and watch the premiere of the most anticipated marvel movie of the century, only at fastnet cinema',
    'Ikeja',
    '3',
    [],
    2,
    '20/12/2022',
    '16:00:00',
  ).toMap());
}

getEvents() async {
  await eventsCollection.find().toList().then(
    (value) {
      event = value;
    },
  );
}

addAttending(BuildContext context, List list) {
  list.add(context.read<UserProvider>().phoneNumber);
  return list;
}

Future reserveSlot(BuildContext context) async {
  await eventsCollection.update(
    where.eq(
      'id',
      context.read<EventProviders>().id,
    ),
    {
      "id": context.read<EventProviders>().id,
      "title": context.read<EventProviders>().title,
      "description": context.read<EventProviders>().description,
      "location": context.read<EventProviders>().location,
      "price": context.read<EventProviders>().price,
      "attending":
          addAttending(context, context.read<EventProviders>().attending),
      "slot_left": context.read<EventProviders>().slotsLeft - 1,
      "date": context.read<EventProviders>().date,
      "time": context.read<EventProviders>().time,
    },
  );
}
