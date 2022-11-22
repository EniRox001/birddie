import 'package:birddie/screens/gender_dob.dart';
import 'package:birddie/utils/colors.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/w_appbar.dart';
import 'package:birddie/widgets/w_elevated_button.dart';
import 'package:birddie/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RussianRoullete extends StatefulWidget {
  const RussianRoullete({super.key});

  @override
  State<RussianRoullete> createState() => _RussianRoulleteState();
}

class _RussianRoulleteState extends State<RussianRoullete> {
  TextEditingController minAgeController = TextEditingController();
  TextEditingController maxAgeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateSetupController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController spendingGaugeController = TextEditingController();
  TextEditingController payBillController = TextEditingController();
  bool termsAndConditionsRoulette = false;

  @override
  void dispose() {
    minAgeController;
    maxAgeController;
    locationController;
    dateSetupController;
    dateController;
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
                          Flexible(
                            child: WTextField(
                              controller: dateController,
                              hintText: 'Date',
                              inputType: TextInputType.datetime,
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
                      onPressed: () => navigateBack(context),
                      text: 'MATCH ME',
                    )
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
