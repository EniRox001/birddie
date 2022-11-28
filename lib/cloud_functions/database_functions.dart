import 'package:birddie/models/events.dart';
import 'package:birddie/models/russian_roulette.dart';
import 'package:birddie/models/user_model.dart';
import 'package:birddie/providers/event_provider.dart';
import 'package:birddie/providers/russian_roulette_provider.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/screens/dashboard.dart';
import 'package:birddie/utils/functions.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//User ID to reference collections across database
ObjectId uniqueId = ObjectId();

//Initialize late collections
late DbCollection userCollection;
late DbCollection eventsCollection;
late DbCollection russianRouletteCollection;
late DbCollection matchedCollection;

late dynamic event;
var russianRoulette = {};
late dynamic selectedEvent;
late dynamic loggedInUser;
late dynamic matchedPerson;

connectDB() async {
  var db = await Db.create(
      "mongodb+srv://enirox:Pwafukadi@cluster0.4iczrsa.mongodb.net/?retryWrites=true&w=m.0 k20   ajority");
  await db.open();

  DbCollection userDatabase = db.collection('users');
  DbCollection eventDatabase = db.collection('events');
  DbCollection russianRouletteDatabase = db.collection('russianRoulette');
  DbCollection matchedDatabase = db.collection('matched');

  //Add reference to the intialized database collections
  userCollection = userDatabase;
  eventsCollection = eventDatabase;
  russianRouletteCollection = russianRouletteDatabase;
  matchedCollection = matchedDatabase;
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

      context.read<RussianRouletteProvider>().getRussianRoulettes(context);

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

addRussianRoulette(BuildContext context) async {
  await russianRouletteCollection.insert(
    RussianRoullete(
      context.read<UserProvider>().id,
      context.read<UserProvider>().phoneNumber,
      context.read<RussianRouletteProvider>().minAge,
      context.read<RussianRouletteProvider>().maxAge,
      context.read<RussianRouletteProvider>().location,
      context.read<RussianRouletteProvider>().dateSetup,
      context.read<RussianRouletteProvider>().date,
      context.read<RussianRouletteProvider>().time,
      context.read<RussianRouletteProvider>().spendingGauge,
      context.read<RussianRouletteProvider>().whoPays,
      context.read<RussianRouletteProvider>().matchState,
    ).toMap(),
  );
}

russianRoulleteAutoMatch(BuildContext context) async {
  await russianRouletteCollection
      .find(
        {
          'min_age': context.read<RussianRouletteProvider>().minAge,
          'max_age': context.read<RussianRouletteProvider>().maxAge,
          // 'date_setup': context.read<RussianRouletteProvider>().dateSetup,
          'matchState': false,
        },
      )
      .toList()
      .then((value) {
        // Check if another person in the database has such criterias
        if (value.isNotEmpty) {
          for (int i = 0; i < value.length; i++) {
            if (value[i]['phone_number'] ==
                context.read<UserProvider>().phoneNumber) {
            } else if (value[i]['phone_number'] !=
                context.read<UserProvider>().phoneNumber) {
              matchedPerson = value[i];
              addMatchedCollection(context);
              checkMatchedOneCollection(context);
              checkMatchedTwoCollection(context);
              setRussianRouletteMatchState(context, true);
            }
          }
        }
      }
          // if (value.isEmpty ||
          //     value[1]['phone_number'] ==
          //         context.read<UserProvider>().phoneNumber) {
          // } else {

          );
}

addMatchedCollection(BuildContext context) async {
  await matchedCollection.insert(
    {
      'id': uniqueId,
      'matchedOne': context.read<UserProvider>().phoneNumber,
      'matchedTwo': matchedPerson['phone_number'],
    },
  );
}

checkMatchedOneCollection(BuildContext context) async {
  await matchedCollection
      .find(where.eq('matchedOne', context.read<UserProvider>().phoneNumber))
      .toList()
      .then(
    (value) {
      if (value.isEmpty) {
        print('not in matched, error somewhere');
      } else {
        print(value[0]);
        context.read<RussianRouletteProvider>().setInMatchedOne(
              context,
              value[0]['matchedOne'],
            );
      }
    },
  );
}

checkMatchedTwoCollection(BuildContext context) async {
  await matchedCollection
      .find(where.eq('matchedTwo', context.read<UserProvider>().phoneNumber))
      .toList()
      .then(
    (value) {
      if (value.isEmpty) {
        print('not in matched, error somewhere');
      } else {
        print(value[0]);
        context.read<RussianRouletteProvider>().setInMatchedTwo(
              context,
              value[0]['matchedTwo'],
            );
      }
    },
  );
}

//Function to set the match state based on String input
setRussianRouletteMatchState(BuildContext context, bool matchState) async {
  await russianRouletteCollection.update(
    where.eq('id', context.read<RussianRouletteProvider>().id),
    {
      'id': context.read<RussianRouletteProvider>().id,
      'phone_number': context.read<UserProvider>().phoneNumber,
      //TODO: This should change automatically or dynamically to matched user
      'min_age': context.read<RussianRouletteProvider>().minAge,
      'max_age': context.read<RussianRouletteProvider>().maxAge,
      'location': context.read<RussianRouletteProvider>().location,
      'date_setup': context.read<RussianRouletteProvider>().dateSetup,
      'date': context.read<RussianRouletteProvider>().date,
      'time': context.read<RussianRouletteProvider>().time,
      'spending_gauge': context.read<RussianRouletteProvider>().spendingGauge,
      'who_pays': context.read<RussianRouletteProvider>().whoPays,
      'matchState': matchState,
    },
  );

  await russianRouletteCollection.update(
    where.eq('id', matchedPerson['id']),
    {
      'id': matchedPerson['id'],
      'phone_number': matchedPerson['phone_number'],
      //TODO: This should change automatically or dynamically to matched user
      'min_age': matchedPerson['min_age'],
      'max_age': matchedPerson['max_age'],
      'location': matchedPerson['location'],
      'date_setup': matchedPerson['date_setup'],
      'date': matchedPerson['date'],
      'time': matchedPerson['time'],
      'spending_gauge': matchedPerson['spending_gauge'],
      'who_pays': matchedPerson['who_pays'],
      'matchState': matchState,
    },
  );
}

Future getRussianRoulette(BuildContext context) async {
  try {
    await russianRouletteCollection
        .find(where.eq('id', context.read<UserProvider>().id))
        .toList()
        .then(
      (value) {
        print(value);
        if (value.isNotEmpty) {
          russianRoulette = value[0];
          context.read<RussianRouletteProvider>().setLoggedRussianRoulette();
          context.read<RussianRouletteProvider>().autoMatchRoulette(context);
        } else {}
      },
    );
  } catch (e) {
    context.read<RussianRouletteProvider>().setNullRussianRoulette();
    navigate(context, const Dashboard());
  }
}
