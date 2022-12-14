// ignore_for_file: use_build_context_synchronously
import 'package:birddie/controllers/russianRoulette/russian_roulette_controllers.dart';
import 'package:birddie/providers/russian_roulette_provider.dart';
import 'package:birddie/utils/colors.dart';
import 'package:birddie/utils/functions.dart';
import 'package:birddie/widgets/common/w_textfield.dart';
import 'package:birddie/widgets/dashboard/w_appbar.dart';
import 'package:birddie/widgets/common/w_elevated_button.dart';
import 'package:birddie/widgets/dashboard/w_dropdown.dart';
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
    int selectedMinAge = 18;
    int selectedMaxAge = 50;
    String selectedPay = 'Me';

    List<String> ageList = [for (var i = 18; i <= 50; i += 1) i.toString()];
    List<String> whoPaysList = ['Me', 'Them', 'Split the bill'];
    List<String> dateList = ['FRI, 15th, APR', 'SAT, 16th APR', 'SUN, 17 APR'];
    List<String> timeList = ['00:00', '01:00', '02:00', '03:00'];

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
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Please, complete all fields for a more acurate matching',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.mainRedColor,
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
                            child: WDropDownWidget(
                              labelText: 'Min',
                              selectedValue: selectedMinAge.toString(),
                              items: ageList,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedMinAge = int.parse(value!);
                                });
                              },
                            ),
                          ),
                          Flexible(
                            child: WDropDownWidget(
                              labelText: 'Min',
                              selectedValue: selectedMaxAge.toString(),
                              items: ageList,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedMaxAge = int.parse(value!);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Column(
                      children: [
                        Text(
                          'Select Location',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<RussianRouletteProvider>()
                                .setNullLocation();
                            context
                                .read<RussianRouletteProvider>()
                                .toggleStateDropDown(false);
                            context
                                .read<RussianRouletteProvider>()
                                .toggleRegionDropdown(false);

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    Text(
                                      'Select Location',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        navigateBack(context);
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    WDropDownWidget(
                                      ignore: context
                                          .watch<RussianRouletteProvider>()
                                          .stateEnabled,
                                      labelText: 'State',
                                      selectedValue: context
                                          .watch<RussianRouletteProvider>()
                                          .stateList[0],
                                      items: context
                                          .watch<RussianRouletteProvider>()
                                          .stateList,
                                      onChanged: (String? value) {
                                        context
                                            .read<RussianRouletteProvider>()
                                            .setState(value!);

                                        context
                                            .read<RussianRouletteProvider>()
                                            .toggleStateDropDown(true);
                                        context
                                            .read<RussianRouletteProvider>()
                                            .setRegionLists(context);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    WDropDownWidget(
                                      ignore: context
                                          .watch<RussianRouletteProvider>()
                                          .regionEnabled,
                                      labelText: 'Region',
                                      selectedValue: context
                                          .read<RussianRouletteProvider>()
                                          .regionList[0],
                                      items: context
                                          .watch<RussianRouletteProvider>()
                                          .regionList,
                                      onChanged: (String? value) {
                                        context
                                            .read<RussianRouletteProvider>()
                                            .setRegion(value!);
                                        context
                                            .read<RussianRouletteProvider>()
                                            .toggleRegionDropdown(true);
                                        context
                                            .read<RussianRouletteProvider>()
                                            .setAreaLists(context);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    WDropDownWidget(
                                      labelText: 'Area',
                                      selectedValue: context
                                          .watch<RussianRouletteProvider>()
                                          .areasList[0],
                                      items: context
                                          .watch<RussianRouletteProvider>()
                                          .areasList,
                                      onChanged: (String? value) {
                                        context
                                            .read<RussianRouletteProvider>()
                                            .setArea(value!);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    WElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<RussianRouletteProvider>()
                                            .setLocation(
                                                '${context.read<RussianRouletteProvider>().area}, ${context.read<RussianRouletteProvider>().region}, ${context.read<RussianRouletteProvider>().state}');
                                        navigateBack(context);
                                      },
                                      text: 'Save Location',
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.mainDarkColor,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  context
                                      .read<RussianRouletteProvider>()
                                      .location,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                            child: WDropDownWidget(
                              labelText: 'Date',
                              selectedValue: context
                                  .watch<RussianRouletteProvider>()
                                  .dateList[0],
                              items: context
                                  .watch<RussianRouletteProvider>()
                                  .dateList,
                              onChanged: (String? value) {
                                context
                                    .read<RussianRouletteProvider>()
                                    .setDate(value!);
                              },
                            ),
                          ),
                          Expanded(
                            child: WDropDownWidget(
                              labelText: 'Time',
                              selectedValue: context
                                  .watch<RussianRouletteProvider>()
                                  .timeList[0],
                              items: context
                                  .watch<RussianRouletteProvider>()
                                  .timeList,
                              onChanged: (String? value) {
                                context
                                    .read<RussianRouletteProvider>()
                                    .setTime(value!);
                              },
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
                      widget: WDropDownWidget(
                        labelText: 'Who pays the bill?',
                        selectedValue: selectedPay,
                        items: whoPaysList,
                        onChanged: (String? value) {
                          selectedPay = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    WElevatedButton(
                      onPressed: () {
                        context
                            .read<RussianRouletteProvider>()
                            .setMinAge(selectedMinAge);

                        context
                            .read<RussianRouletteProvider>()
                            .setMaxAge(selectedMaxAge);

                        context
                            .read<RussianRouletteProvider>()
                            .setSpendingGauge(
                                int.parse(spendingGaugeController.text));

                        context
                            .read<RussianRouletteProvider>()
                            .setWhoPays(selectedPay);

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
              const SizedBox(
                height: 100.0,
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
