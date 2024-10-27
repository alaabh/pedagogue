import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CaloriesCalculatorView extends StatefulWidget {
  const CaloriesCalculatorView({super.key});

  @override
  State<CaloriesCalculatorView> createState() => _CaloriesCalculatorViewState();
}

class _CaloriesCalculatorViewState extends State<CaloriesCalculatorView> {
  TextEditingController goalController = TextEditingController();
  TextEditingController activityController = TextEditingController();
  int goalControllerValue = 0;
  double activityControllerValue = 0;
  double bmr = 0;
  double calories = 0;

  double _volumeValue1 = 50;
  double _volumeValue2 = 50;
  double _volumeValue3 = 18;
  double heigthMinMetric = 50;
  double heigthMaxMetric = 220;
  double heigthMinImperial = 1.7;
  double heigthMaxImperial = 7.2;
  double weightMinMetric = 0;
  double weightMaxMetric = 300;
  double weightMinImperial = 0;
  double weightMaxImperial = 600;

  String? _character = "Metric";
  String? sex = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.calorieCalculator),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(intl.calorieCalculatorinfo),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio<String?>(
                          value: "Imperial",
                          groupValue: _character,
                          onChanged: (String? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        Text(intl.imperial)
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String?>(
                          value: "Metric",
                          groupValue: _character,
                          onChanged: (String? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        Text(intl.metric)
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio<String?>(
                          value: "Male",
                          groupValue: sex,
                          onChanged: (String? value) {
                            setState(() {
                              sex = value;
                            });
                          },
                        ),
                        Text(intl.male)
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String?>(
                          value: "Female",
                          groupValue: sex,
                          onChanged: (String? value) {
                            setState(() {
                              sex = value;
                            });
                          },
                        ),
                        Text(intl.female)
                      ],
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                        minimum: _character == "Metric"
                            ? heigthMinMetric
                            : heigthMinImperial,
                        maximum: _character == "Metric"
                            ? heigthMaxMetric
                            : heigthMaxImperial,
                        startAngle: 180,
                        endAngle: 360,
                        showLabels: false,
                        showTicks: false,
                        radiusFactor: 0.9,
                        axisLineStyle: AxisLineStyle(
                            cornerStyle: CornerStyle.bothFlat,
                            color: Colors.black12,
                            thickness: 12),
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: _volumeValue1,
                              cornerStyle: CornerStyle.bothFlat,
                              width: 12,
                              sizeUnit: GaugeSizeUnit.logicalPixel,
                              color: Colors.orangeAccent,
                              gradient: const SweepGradient(colors: <Color>[
                                Color(0XFFFFD180),
                                Color(0XFFFFAB40)
                              ], stops: <double>[
                                0.25,
                                0.75
                              ])),
                          MarkerPointer(
                              value: _volumeValue1,
                              enableDragging: true,
                              onValueChanged: (double newValue) {
                                setState(() {
                                  _volumeValue1 = newValue;
                                });
                              },
                              markerHeight: 20,
                              markerWidth: 20,
                              markerType: MarkerType.circle,
                              color: Color(0XFFFFAB40),
                              borderWidth: 2,
                              borderColor: Colors.white54)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              angle: 90,
                              axisValue: 5,
                              positionFactor: 0.1,
                              widget: _character == "Metric"
                                  ? Text(
                                      "${intl.height}\n${_volumeValue1.ceil()}\n${intl.centimeters}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFFFFAB40)))
                                  : Text(
                                      "${intl.height}\n${_volumeValue1.toPrecision(1)}\n${intl.feet}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFFFFAB40))))
                        ])
                  ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                        minimum: _character == "Metric"
                            ? weightMinMetric
                            : weightMinImperial,
                        maximum: _character == "Metric"
                            ? weightMaxMetric
                            : weightMaxImperial,
                        startAngle: 180,
                        endAngle: 360,
                        showLabels: false,
                        showTicks: false,
                        radiusFactor: 0.9,
                        axisLineStyle: AxisLineStyle(
                            cornerStyle: CornerStyle.bothFlat,
                            color: Colors.black12,
                            thickness: 12),
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: _volumeValue2,
                              cornerStyle: CornerStyle.bothFlat,
                              width: 12,
                              sizeUnit: GaugeSizeUnit.logicalPixel,
                              color: Colors.orangeAccent,
                              gradient: const SweepGradient(colors: <Color>[
                                Color(0XFFFFD180),
                                Color(0XFFFFAB40)
                              ], stops: <double>[
                                0.25,
                                0.75
                              ])),
                          MarkerPointer(
                              value: _volumeValue2,
                              enableDragging: true,
                              onValueChanged: (double newValue) {
                                setState(() {
                                  _volumeValue2 = newValue;
                                });
                              },
                              markerHeight: 20,
                              markerWidth: 20,
                              markerType: MarkerType.circle,
                              color: Color(0XFFFFAB40),
                              borderWidth: 2,
                              borderColor: Colors.white54)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              angle: 90,
                              axisValue: 5,
                              positionFactor: 0.1,
                              widget: _character == "Metric"
                                  ? Text(
                                      "${intl.weigth}\n${_volumeValue2.ceil()}\n${intl.kilogram}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFFFFAB40)))
                                  : Text(
                                      "${intl.weigth}\n${_volumeValue2.ceil()}\n${intl.pounds}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFFFFAB40))))
                        ])
                  ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        startAngle: 180,
                        endAngle: 360,
                        showLabels: false,
                        showTicks: false,
                        radiusFactor: 0.9,
                        axisLineStyle: AxisLineStyle(
                            cornerStyle: CornerStyle.bothFlat,
                            color: Colors.black12,
                            thickness: 12),
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: _volumeValue3,
                              cornerStyle: CornerStyle.bothFlat,
                              width: 12,
                              sizeUnit: GaugeSizeUnit.logicalPixel,
                              color: Colors.orangeAccent,
                              gradient: const SweepGradient(colors: <Color>[
                                Color(0XFFFFD180),
                                Color(0XFFFFAB40)
                              ], stops: <double>[
                                0.25,
                                0.75
                              ])),
                          MarkerPointer(
                              value: _volumeValue3,
                              enableDragging: true,
                              onValueChanged: (double newValue) {
                                setState(() {
                                  _volumeValue3 = newValue;
                                });
                              },
                              markerHeight: 20,
                              markerWidth: 20,
                              markerType: MarkerType.circle,
                              color: Color(0XFFFFAB40),
                              borderWidth: 2,
                              borderColor: Colors.white54)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              angle: 90,
                              axisValue: 5,
                              positionFactor: 0.1,
                              widget: Text(
                                  "${intl.age}\n${_volumeValue3.ceil()}\n${intl.years}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFFFFAB40))))
                        ])
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CustomInput(
                        controller: goalController,
                        hint: intl.weightgoal,
                        title: intl.weightgoal,
                        inputType: InputType.dropdown,
                        dropdownItems: [
                          intl.goalCalorie1,
                          intl.goalCalorie2,
                          intl.goalCalorie3,
                          intl.goalCalorie4,
                          intl.goalCalorie5,
                          intl.goalCalorie6,
                          intl.goalCalorie7,
                          intl.goalCalorie8,
                          intl.goalCalorie9,
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CustomInput(
                        controller: activityController,
                        hint: intl.activityLevel,
                        title: intl.activityLevel,
                        inputType: InputType.dropdown,
                        dropdownItems: [
                          intl.activityCalories1,
                          intl.activityCalories2,
                          intl.activityCalories3,
                          intl.activityCalories4,
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    FilledButton(
                        onPressed: () {
                          setState(() {
                            switch (goalController.text) {
                              case 'Lose 2 Pounds per Week':
                                goalControllerValue = -1000;
                              case 'Lose 1.5 Pounds per Week':
                                goalControllerValue = -750;
                              case 'Lose 1 Pounds per Week':
                                goalControllerValue = -500;
                              case 'Lose 0.5 Pounds per Week':
                                goalControllerValue = -250;
                              case 'Stay the Same Weight':
                                goalControllerValue = 0;
                              case 'Gain 0.5 Pound per Week':
                                goalControllerValue = 250;
                              case 'Gain 1 Pound per Week':
                                goalControllerValue = 500;
                              case 'Gain 1.5 Pounds per Week':
                                goalControllerValue = 750;
                              case 'Gain 2 Pounds per Week':
                                goalControllerValue = 1000;
                            }
                            switch (activityController.text) {
                              case 'Little to no exercise':
                                activityControllerValue = 1.2;
                              case 'Light exercise (1-3 days per week)':
                                activityControllerValue = 1.375;
                              case 'Moderate exercise (3-5 days per week)':
                                activityControllerValue = 1.55;
                              case 'Heavy exercise (6-7 days per week)':
                                activityControllerValue = 1.725;
                              case 'Very heavy exercise (twice per day, extra heavy workouts)':
                                activityControllerValue = 1.9;
                            }
                            if (sex == 'male') {
                              bmr = 10 * _volumeValue2 +
                                  6.25 * _volumeValue1 -
                                  5 * _volumeValue3 +
                                  5;
                            } else {
                              bmr = 10 * _volumeValue2 +
                                  6.25 * _volumeValue1 -
                                  5 * _volumeValue3 -
                                  161;
                            }
                            calories = bmr * activityControllerValue +
                                bmr +
                                goalControllerValue;
                            print(calories.ceil());
                          });
                        },
                        child: Text(intl.calculate)),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFFFAB40)),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Center(
                            child: Text(
                                "${intl.resultCalories} : ${calories.ceil()} ${intl.calories}"))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
