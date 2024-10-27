import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../shared/style/dimensions.dart';

class MacroCalculatorView extends StatefulWidget {
  const MacroCalculatorView({super.key});

  @override
  State<MacroCalculatorView> createState() => _MacroCalculatorViewState();
}

class _MacroCalculatorViewState extends State<MacroCalculatorView> {
  @override
  void initState() {
    super.initState();
  }

  String? _character = "";
  double _volumeValue1 = 50;
  double _volumeValue2 = 50;
  double _volumeValue3 = 50;
  double carbsday = 0;
  double carbsmeal = 0;
  double proteinday = 0;
  double proteinmeal = 0;
  double fatday = 0;
  double fatmeal = 0;

  final TextEditingController mealsPerDay = TextEditingController(text: '1');
  final TextEditingController calories = TextEditingController(text: '1200');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.macro),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(intl.macroDescription),
                ),
                Dimensions.verticalSpacingHuge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio<String?>(
                          value: "60/25/15(High carb)",
                          groupValue: _character,
                          onChanged: (String? value) {
                            setState(() {
                              _character = value;
                              _volumeValue1 = 60;
                              _volumeValue2 = 25;
                              _volumeValue3 = 15;
                              carbsday = (double.parse(calories.text) *
                                      _volumeValue1 /
                                      100) /
                                  4;

                              carbsmeal =
                                  carbsday / double.parse(mealsPerDay.text);
                              proteinday = (double.parse(calories.text) *
                                      _volumeValue2 /
                                      100) /
                                  4;
                              proteinmeal =
                                  proteinday / double.parse(mealsPerDay.text);
                              fatday = (double.parse(calories.text) *
                                      _volumeValue3 /
                                      100) /
                                  9;
                              fatmeal = fatday / double.parse(mealsPerDay.text);
                              /*  carbsday = 0;
                              carbsmeal = 0;
                              proteinday = 0;
                              proteinmeal = 0;
                              fatday = 0;
                              fatmeal = 0; */

                              print(_character);
                            });
                          },
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(intl.units1))
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String?>(
                          value: "50/30/20(Moderate)",
                          groupValue: _character,
                          onChanged: (String? value) {
                            setState(() {
                              _character = value;
                              _volumeValue1 = 50;
                              _volumeValue2 = 30;
                              _volumeValue3 = 20;
                              carbsday = (double.parse(calories.text) *
                                      _volumeValue1 /
                                      100) /
                                  4;

                              carbsmeal =
                                  carbsday / double.parse(mealsPerDay.text);
                              proteinday = (double.parse(calories.text) *
                                      _volumeValue2 /
                                      100) /
                                  4;
                              proteinmeal =
                                  proteinday / double.parse(mealsPerDay.text);
                              fatday = (double.parse(calories.text) *
                                      _volumeValue3 /
                                      100) /
                                  9;
                              fatmeal = fatday / double.parse(mealsPerDay.text);

                              print(_character);
                            });
                          },
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(intl.units2))
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
                          value: "40/30/30(Zone diet)",
                          groupValue: _character,
                          onChanged: (String? value) {
                            setState(() {
                              _character = value;
                              _volumeValue1 = 40;
                              _volumeValue2 = 30;
                              _volumeValue3 = 30;
                              carbsday = (double.parse(calories.text) *
                                      _volumeValue1 /
                                      100) /
                                  4;

                              carbsmeal =
                                  carbsday / double.parse(mealsPerDay.text);
                              proteinday = (double.parse(calories.text) *
                                      _volumeValue2 /
                                      100) /
                                  4;
                              proteinmeal =
                                  proteinday / double.parse(mealsPerDay.text);
                              fatday = (double.parse(calories.text) *
                                      _volumeValue3 /
                                      100) /
                                  9;
                              fatmeal = fatday / double.parse(mealsPerDay.text);

                              print(_character);
                            });
                          },
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(intl.units3))
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String?>(
                          value: "25/45/30(Low carb)",
                          groupValue: _character,
                          onChanged: (String? value) {
                            setState(() {
                              _character = value;
                              _volumeValue1 = 25;
                              _volumeValue2 = 45;
                              _volumeValue3 = 30;
                              carbsday = (double.parse(calories.text) *
                                      _volumeValue1 /
                                      100) /
                                  4;

                              carbsmeal =
                                  carbsday / double.parse(mealsPerDay.text);
                              proteinday = (double.parse(calories.text) *
                                      _volumeValue2 /
                                      100) /
                                  4;
                              proteinmeal =
                                  proteinday / double.parse(mealsPerDay.text);
                              fatday = (double.parse(calories.text) *
                                      _volumeValue3 /
                                      100) /
                                  9;
                              fatmeal = fatday / double.parse(mealsPerDay.text);

                              print(_character);
                            });
                          },
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(intl.units4))
                      ],
                    ),
                  ],
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
                                  carbsday = (double.parse(calories.text) *
                                          _volumeValue1 /
                                          100) /
                                      4;
                                  print(carbsday);

                                  carbsmeal =
                                      carbsday / double.parse(mealsPerDay.text);
                                  proteinday = (double.parse(calories.text) *
                                          _volumeValue2 /
                                          100) /
                                      4;
                                  proteinmeal = proteinday /
                                      double.parse(mealsPerDay.text);
                                  fatday = (double.parse(calories.text) *
                                          _volumeValue3 /
                                          100) /
                                      9;
                                  fatmeal =
                                      fatday / double.parse(mealsPerDay.text);
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
                                  "${intl.carbohydrates}\n${_volumeValue1.ceil().toString()} %\n${intl.grams}/${intl.day}\n${carbsday.ceil().toString()}\n${intl.grams}/${intl.meal}\n${carbsmeal.ceil().toString()}",
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
                                  carbsday = (double.parse(calories.text) *
                                          _volumeValue1 /
                                          100) /
                                      4;

                                  carbsmeal =
                                      carbsday / double.parse(mealsPerDay.text);
                                  proteinday = (double.parse(calories.text) *
                                          _volumeValue2 /
                                          100) /
                                      4;
                                  proteinmeal = proteinday /
                                      double.parse(mealsPerDay.text);
                                  fatday = (double.parse(calories.text) *
                                          _volumeValue3 /
                                          100) /
                                      9;
                                  fatmeal =
                                      fatday / double.parse(mealsPerDay.text);
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
                                  "${intl.protein}\n${_volumeValue2.ceil().toString()} %\n${intl.grams}/${intl.day}\n${proteinday.ceil().toString()}\n${intl.grams}/${intl.meal}\n${proteinday.ceil().toString()}",
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
                                  print(_volumeValue3);
                                  _volumeValue3 = newValue;
                                  carbsday = (double.parse(calories.text) *
                                          _volumeValue1 /
                                          100) /
                                      4;

                                  carbsmeal =
                                      carbsday / double.parse(mealsPerDay.text);
                                  proteinday = (double.parse(calories.text) *
                                          _volumeValue2 /
                                          100) /
                                      4;
                                  proteinmeal = proteinday /
                                      double.parse(mealsPerDay.text);
                                  fatday = (double.parse(calories.text) *
                                          _volumeValue3 /
                                          100) /
                                      9;
                                  fatmeal =
                                      fatday / double.parse(mealsPerDay.text);
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
                                  "${intl.fat} \n${_volumeValue3.ceil().toString()} %\n${intl.grams}/${intl.day}\n${fatday.ceil().toString()}\n${intl.grams}/${intl.meal}\n${fatmeal.ceil().toString()}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFFFFAB40))))
                        ])
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${intl.mealsperday}:",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12),
                      ),
                      TextField(
                        controller: mealsPerDay,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            value == ""
                                ? mealsPerDay.text = "0"
                                : mealsPerDay.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                var x = int.parse(mealsPerDay.text);
                                if (x > 0) {
                                  x--;
                                  mealsPerDay.text = x.toString();
                                }
                              });
                            },
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                var x = int.parse(mealsPerDay.text);

                                x++;
                                mealsPerDay.text = x.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${intl.calories}:",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12),
                      ),
                      TextField(
                        controller: calories,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            value == ""
                                ? calories.text = "0"
                                : calories.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                var x = int.parse(calories.text);
                                if (x > 0) {
                                  x--;
                                  calories.text = x.toString();
                                }
                              });
                            },
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                var x = int.parse(calories.text);

                                x++;
                                calories.text = x.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Dimensions.verticalSpacingSmall,
                FilledButton(
                    child: Text(intl.calculate),
                    onPressed: () {
                      setState(() {
                        carbsday = (double.parse(calories.text) *
                                _volumeValue1 /
                                100) /
                            4;

                        carbsmeal = carbsday / double.parse(mealsPerDay.text);
                        proteinday = (double.parse(calories.text) *
                                _volumeValue2 /
                                100) /
                            4;
                        proteinmeal =
                            proteinday / double.parse(mealsPerDay.text);
                        fatday = (double.parse(calories.text) *
                                _volumeValue3 /
                                100) /
                            9;
                        fatmeal = fatday / double.parse(mealsPerDay.text);
                      });
                    }),
                Dimensions.verticalSpacingMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
