// ignore_for_file: use_build_context_synchronously

import 'package:birddie/controllers/russian_roulette_controllers.dart';
import 'package:birddie/providers/russian_roulette_provider.dart';
import 'package:birddie/providers/user_provider.dart';
import 'package:birddie/utils/colors.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/w_appbar.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RussianRoullete extends StatefulWidget {
  const RussianRoullete({super.key});

  @override
  State<RussianRoullete> createState() => _RussianRoulleteState();
}

class _RussianRoulleteState extends State<RussianRoullete> {
  @override
  void dispose() {
    minAgeController;
    maxAgeController;
    locationController;
    dateSetupController;
    timeController;
    spendingGaugeController;
    payBillController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: WAppBar(
            onBackPressed: () => navigateBack(context),
            title: 'Match Filter: Russian Roulette',
            subData: false,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Please, complete all fields for a more acurate matching',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColors.mainRedColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: <Widget>[
                    WLabelTextField(
                      text: 'Age Range',
                      widget: Row(
                        children: [
                          Flexible(
                            child: WTextField(
                              controller: minAgeController,
                              hintText: 'Min',
                              inputType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                          Flexible(
                            child: WTextField(
                              controller: maxAgeController,
                              hintText: 'Max',
                              inputType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    WLabelTextField(
                      text: 'Select Location',
                      widget: WTextField(
                        controller: locationController,
                        hintText: 'Select Location',
                      ),
                    ),
                    WLabelTextField(
                      text: 'Select Date Setup',
                      widget: WTextField(
                        controller: dateSetupController,
                        hintText: 'Select Date Setup',
                      ),
                    ),
                    WLabelTextField(
                      text: 'Select Date & Time',
                      widget: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await selectRussianRoulleteDate(context);
                                context
                                    .read<RussianRouletteProvider>()
                                    .setDate(russianRouletteDate);
                                print(context
                                    .read<RussianRouletteProvider>()
                                    .date);
                              },
                              child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Center(
                                  child: context
                                              .watch<RussianRouletteProvider>()
                                              .date ==
                                          ""
                                      ? const Text(
                                          "Date",
                                        )
                                      : Text(
                                          context
                                              .watch<RussianRouletteProvider>()
                                              .date,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: WTextField(
                              controller: timeController,
                              hintText: 'Time',
                              inputType: TextInputType.datetime,
                            ),
                          ),
                        ],
                      ),
                    ),
                    WLabelTextField(
                      text: 'Spending Gauge',
                      widget: WTextField(
                        controller: spendingGaugeController,
                        hintText: 'Spending Gauge',
                        inputType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    WLabelTextField(
                      text: 'Who Pays The Bill?',
                      widget: WTextField(
                        controller: payBillController,
                        hintText: 'Who pays the bill?',
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    WElevatedButton(
                      onPressed: () {
                        context
                            .read<RussianRouletteProvider>()
                            .setMinAge(int.parse(minAgeController.text));

                        context
                            .read<RussianRouletteProvider>()
                            .setMaxAge(int.parse(maxAgeController.text));

                        context
                            .read<RussianRouletteProvider>()
                            .setLocation(locationController.text);

                        context
                            .read<RussianRouletteProvider>()
                            .setDateSetup(dateSetupController.text);

                        context.read<RussianRouletteProvider>().setDate(
                            context.read<RussianRouletteProvider>().date);

                        context
                            .read<RussianRouletteProvider>()
                            .setTime(timeController.text);

                        context
                            .read<RussianRouletteProvider>()
                            .setSpendingGauge(
                                int.parse(spendingGaugeController.text));

                        context
                            .read<RussianRouletteProvider>()
                            .setWhoPays(payBillController.text);

                        context
                            .read<RussianRouletteProvider>()
                            .setMatchState(false);

                        Provider.of<RussianRouletteProvider>(context,
                                listen: false)
                            .setRussianRoulette(context);
                        Provider.of<RussianRouletteProvider>(context,
                                listen: false)
                            .autoMatchRoulette(context);
                        navigateBack(context);
                      },
                      text: 'MATCH ME',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WLabelTextField extends StatelessWidget {
  const WLabelTextField({
    Key? key,
    required this.text,
    required this.widget,
  }) : super(key: key);

  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        widget,
      ],
    );
  }
}
