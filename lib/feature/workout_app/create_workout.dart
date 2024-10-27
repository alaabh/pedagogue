import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';

import '../../l10n/localization.dart';
import '../../shared/style/app_color.dart';
import '../../shared/style/dimensions.dart';
import '../../utils/resources/api/token_manager.dart';

class CreateWorkout extends StatefulWidget {
  const CreateWorkout({super.key});

  @override
  State<CreateWorkout> createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  Future<void> addResult(
      dynamic push_set,
      dynamic push_rep,
      dynamic pull_set,
      dynamic pull_rep,
      dynamic sit_set,
      dynamic sit_rep,
      dynamic walk_set,
      dynamic walk_rep,
      dynamic squat_set,
      dynamic squat_rep,
      dynamic date,
      BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url =
        Uri.parse('https://www.mobile.sportspedagogue.com/api/workout_create');
    final response = await http.post(url, headers: headers, body: {
      'push_set': push_set,
      'push_rep': push_rep,
      'pull_set': pull_set,
      'pull_rep': pull_rep,
      'sit_set': sit_set,
      'sit_rep': sit_rep,
      'walk_set': walk_set,
      'walk_rep': walk_rep,
      'squat_set': squat_set,
      'squat_rep': squat_rep,
      'date': date,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      Navigator.pop(context);
      Navigator.pop(context);

      setState(() {
        loader = false;
      });

      print(data);
    } else {
      print(response.body);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with success message
          return AlertDialog(
            title: Text('failed'),
            content: Text('Check your internet connection or your input'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(intl.ok),
              ),
            ],
          );
        },
      );
    }
  }

  bool loader = false;
  String convertDateFormat(String originalDateString) {
    // Parse the original string to a DateTime object
    DateTime dateTime = DateFormat('dd/MM/yyyy').parse(originalDateString);

    // Format the DateTime object to the desired string format
    String formattedDateString = DateFormat('yyyy-MM-dd').format(dateTime);

    return formattedDateString;
  }

  Map<String, dynamic> list = {
    "pushup": {
      "title": intl.pushup,
      "img": "assets/pushupback1.png",
      "controller1": TextEditingController(),
      "controller2": TextEditingController(),
    },
    "pullup": {
      "title": intl.pullUp,
      "img": "assets/pullupback1.png",
      "controller1": TextEditingController(),
      "controller2": TextEditingController(),
    },
    "situp": {
      "title": intl.sitUp,
      "img": "assets/situpback1.png",
      "controller1": TextEditingController(),
      "controller2": TextEditingController(),
    },
    "squat": {
      "title": intl.squat,
      "img": "assets/squatback1.png",
      "controller1": TextEditingController(),
      "controller2": TextEditingController(),
    },
    "walk": {
      "title": intl.walk,
      "img": "assets/walkback1.png",
      "controller1": TextEditingController(),
      "controller2": TextEditingController(),
    },
  };
  TextEditingController dateController = TextEditingController();
  List<dynamic> workoutsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.createworkout),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: list.entries
                    .map(
                      (item) => Column(
                        children: [
                          Dimensions.verticalSpacingExtraLarge,
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      item.value['img'],
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.19,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Column(
                                        children: [
                                          Text(
                                            item.value['title'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Dimensions.verticalSpacingExtraLarge,
                                          CustomInput(
                                              controller:
                                                  item.value['controller1'],
                                              hint: intl.repCount,
                                              inputType: InputType.text),
                                          Dimensions.verticalSpacingExtraLarge,
                                          CustomInput(
                                              controller:
                                                  item.value['controller2'],
                                              hint: intl.setCount,
                                              inputType: InputType.text),
                                          Dimensions.verticalSpacingExtraLarge,
                                          CustomButton(
                                              text: intl.add,
                                              onPressed: () {
                                                setState(() {
                                                  workoutsList.add(item.value);
                                                  list.remove(item.key);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Added Succesfully"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ));
                                                });
                                              })
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              Dimensions.verticalSpacingExtraLarge,
              CustomButton(
                  text: intl.save,
                  onPressed: () {
                    print(workoutsList.firstWhere(
                        (exercise) => exercise['title'] == intl.pushup,
                        orElse: () => null)['controller1']);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // Return an AlertDialog with success message

                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text('Workouts Selected'),
                              content: Column(
                                children: [
                                  CustomInput(
                                      controller: dateController,
                                      hint: intl.date,
                                      inputType: InputType.date),
                                  loader
                                      ? LoadingWidget()
                                      : Column(
                                          children: workoutsList
                                              .map(
                                                (item) => Column(
                                                  children: [
                                                    Dimensions
                                                        .verticalSpacingExtraLarge,
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.08,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .primaryColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                item['title'],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "${intl.repCount}: ${item['controller1'].text}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "${intl.setCount}: ${item['controller2'].text}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      workoutsList
                                                                          .removeAt(
                                                                              workoutsList.indexOf(item));
                                                                    });
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .delete))
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        loader = true;
                                      },
                                    );
                                    print(
                                        convertDateFormat(dateController.text));
                                    print(dateController.text);
                                    var pushUp = workoutsList.firstWhere(
                                        (exercise) =>
                                            exercise['title'] == intl.pushup,
                                        orElse: () => null);
                                    var pullUp = workoutsList.firstWhere(
                                        (exercise) =>
                                            exercise['title'] == intl.pullUp,
                                        orElse: () => null);
                                    var sitUp = workoutsList.firstWhere(
                                        (exercise) =>
                                            exercise['title'] == intl.sitUp,
                                        orElse: () => null);
                                    var walk = workoutsList.firstWhere(
                                        (exercise) =>
                                            exercise['title'] == intl.walk,
                                        orElse: () => null);
                                    var squat = workoutsList.firstWhere(
                                        (exercise) =>
                                            exercise['title'] == intl.squat,
                                        orElse: () => null);
                                    addResult(
                                        pushUp != null
                                            ? pushUp['controller1'].text
                                            : "",
                                        pushUp != null
                                            ? pushUp['controller2'].text
                                            : "",
                                        pullUp != null
                                            ? pullUp['controller1'].text
                                            : "",
                                        pullUp != null
                                            ? pullUp['controller2'].text
                                            : "",
                                        sitUp != null
                                            ? sitUp['controller1'].text
                                            : "",
                                        sitUp != null
                                            ? sitUp['controller2'].text
                                            : "",
                                        walk != null
                                            ? walk['controller1'].text
                                            : "",
                                        walk != null
                                            ? walk['controller2'].text
                                            : "",
                                        squat != null
                                            ? squat['controller1'].text
                                            : "",
                                        squat != null
                                            ? squat['controller2'].text
                                            : "",
                                        convertDateFormat(dateController.text),
                                        context);
                                  },
                                  child: Text(intl.ok),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  }),
              Dimensions.verticalSpacingExtraLarge,
            ],
          ),
        ),
      ),
    );
  }
}
