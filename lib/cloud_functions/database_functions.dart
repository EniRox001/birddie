import 'package:birddie/cloud_functions/shared_prefernces.dart';
import 'package:birddie/models/events.dart';
import 'package:birddie/models/russian_roulette.dart';
import 'package:birddie/models/user_model.dart';
import 'package:birddie/providers/event_provider.dart';
import 'package:birddie/providers/russian_roulette_provider.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/views/dashboard/dashboard.dart';
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
late DbCollection locationCollection;

late dynamic event;
var russianRoulette = {};
late dynamic selectedEvent;
late dynamic loggedInUser;
late dynamic matchedPerson;
late dynamic chatMessage;
List chatCollection = [];
late dynamic selectedMatchedCollection;

List stateLists = [];
List regionLists = [];
List areaLists = [];

connectDB() async {
  var db = await Db.create(
      "mongodb+srv://enirox:Pwafukadi@cluster0.4iczrsa.mongodb.net/?retryWrites=true&w=m.0 k20   ajority");
  await db.open();

  DbCollection userDatabase = db.collection('users');
  DbCollection eventDatabase = db.collection('events');
  DbCollection russianRouletteDatabase = db.collection('russianRoulette');
  DbCollection matchedDatabase = db.collection('matched');
  DbCollection locationDatabase = db.collection('location');

  //Add reference to the intialized database collections
  userCollection = userDatabase;
  eventsCollection = eventDatabase;
  russianRouletteCollection = russianRouletteDatabase;
  matchedCollection = matchedDatabase;
  locationCollection = locationDatabase;
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

Future<Widget> autoLogin(BuildContext context, String? phoneNumber) async {
  userCollection
      .find(
        where.eq("phone_number", phoneNumber),
      )
      .toList()
      .then((value) {
    loggedInUser = value;

    context.read<UserProvider>().setUser();

    context.read<RussianRouletteProvider>().getRussianRoulettes(context);
  });
  return const Dashboard();
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
      setFirstTime(false, context.read<UserProvider>().phoneNumber);
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

addMessage(List list, message) {
  list.insert(0, message);
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
      });
}

addMatchedCollection(BuildContext context) async {
  await matchedCollection.insert(
    {
      'id': uniqueId,
      'matchedOne': context.read<UserProvider>().phoneNumber,
      'matchedTwo': matchedPerson['phone_number'],
      'chats': []
    },
  );
}

chatAddMessage(BuildContext context) async {
  matchedCollection.update(
      where.eq('matchedOne', context.read<UserProvider>().phoneNumber), {
    'id': selectedMatchedCollection['id'],
    'matchedOne': context.read<UserProvider>().phoneNumber,
    'matchedTwo': selectedMatchedCollection['matchedTwo'],
    'chat_collection': addMessage(
        context.read<RussianRouletteProvider>().chatList, chatMessage),
  });
}

// chatAddMessageAlt(BuildContext context) async {
//   matchedCollection.update(
//       where.eq('matchedTwo', context.read<UserProvider>().phoneNumber), {
//     'id': selectedMatchedCollection['id'],
//     'matchedOne': ,
//     'matchedTwo': selectedMatchedCollection['matchedTwo'],
//     'chat_collection': addMessage(
//         context.read<RussianRouletteProvider>().chatList, chatMessage),
//   });
// }

checkMatchedOneCollection(BuildContext context) async {
  await matchedCollection
      .find(where.eq('matchedOne', context.read<UserProvider>().phoneNumber))
      .toList()
      .then(
    (value) {
      if (value.isEmpty) {
      } else {
        selectedMatchedCollection = value[0];
        chatCollection = value[0]['chat_collection'];
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
      } else {
        selectedMatchedCollection = value[0];
        chatCollection = value[0]['chat_collection'];
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
        if (value.isNotEmpty) {
          russianRoulette = value[0];
          context.read<RussianRouletteProvider>().setLoggedRussianRoulette();
          context.read<RussianRouletteProvider>().autoMatchRoulette(context);
          checkMatchedOneCollection(context);
          checkMatchedTwoCollection(context);
        } else {}
      },
    );
  } catch (e) {
    context.read<RussianRouletteProvider>().setNullRussianRoulette();
    navigate(context, const Dashboard());
  }
}

Future setStateList() async {
  await locationCollection
      .find(
        where.eq(
          'name',
          'state',
        ),
      )
      .toList()
      .then(
    (value) {
      if (value.isNotEmpty) {
        stateLists = value[0]['states'];
      } else {}
    },
  );
}

Future setRegionList(BuildContext context) async {
  await locationCollection
      .find(
        where.eq(
          'name',
          context.read<RussianRouletteProvider>().state,
        ),
      )
      .toList()
      .then((value) {
    if (value.isNotEmpty) {
      regionLists = value[0]['region'];
    } else {}
  });
}

Future setAreaList(BuildContext context) async {
  await locationCollection
      .find(
        where.eq(
          'name',
          context.read<RussianRouletteProvider>().region,
        ),
      )
      .toList()
      .then((value) {
    if (value.isNotEmpty) {
      areaLists = value[0]['areas'];
      print(areaLists);
    } else {}
  });
}
