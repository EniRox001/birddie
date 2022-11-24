import 'package:birddie/providers/event_provider.dart';
import 'package:birddie/utils/colors.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/w_appbar.dart';
import 'package:birddie/widgets/w_attendee_card.dart';
import 'package:birddie/widgets/w_divider.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: WAppBar(
            title: 'Event Details',
            subData: false,
            onBackPressed: () => navigateBack(
              context,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Event Details',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: CustomColors.mainRedColor,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      context.watch<EventProviders>().title,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      context.watch<EventProviders>().description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: const [
                        Chip(label: Text('Food')),
                        Chip(label: Text('Drinks')),
                        Chip(label: Text('Games')),
                        Chip(label: Text('Music')),
                        Chip(label: Text('Networking')),
                        Chip(label: Text('Talks')),
                      ],
                    ),
                    const WDivider(),
                    const SizedBox(height: 20.0),
                    Text(
                      'DATE: ${context.watch<EventProviders>().date}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'TIME: ${context.watch<EventProviders>().time}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.location_on,
                          color: CustomColors.mainRedColor,
                        ),
                        Text(
                          context.watch<EventProviders>().location,
                        ),
                      ],
                    ),
                    Text(
                      'Location and directions will be communicated upon payment',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    const WDivider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: <Widget>[
                            const Text('Attending'),
                            WAttendeeCard(
                              onAttendeePressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: <Widget>[
                            const Text('Slots Left'),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              context
                                  .watch<EventProviders>()
                                  .slotsLeft
                                  .toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'N${context.watch<EventProviders>().price}000',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: CustomColors.mainRedColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    context.watch<EventProviders>().reserved
                        ? Text(
                            'You Got A Slot',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    context.watch<EventProviders>().reserved
                        ? const SizedBox()
                        : WElevatedButton(
                            onPressed: () {
                              Provider.of<EventProviders>(
                                context,
                                listen: false,
                              ).setReservedSlot(context);
                            },
                            text: 'Reserve Slot',
                          ),
                  ],
                ),
              ),
              context.watch<EventProviders>().reserved
                  ? Container(
                      decoration: BoxDecoration(
                          color: CustomColors.fadedRedColor,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: CustomColors.mainRedColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Congratulations! You have successfully bought a ticket',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: CustomColors.mainWhiteColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
