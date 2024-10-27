import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';

import '../../../shared/style/dimensions.dart';

class MicrocycleView extends StatefulWidget {
  const MicrocycleView({super.key});

  @override
  State<MicrocycleView> createState() => _MicrocycleViewState();
}

class _MicrocycleViewState extends State<MicrocycleView> {
  final TextEditingController _Tg1 = TextEditingController(text: '0');
  final TextEditingController _Tg2 = TextEditingController(text: '0');
  int _Tg3 = 0;
  final TextEditingController _g1 = TextEditingController(text: '0');
  final TextEditingController _g2 = TextEditingController(text: '0');
  int _g3 = 0;
  final TextEditingController _m1 = TextEditingController(text: '0');
  final TextEditingController _m2 = TextEditingController(text: '0');
  int _m3 = 0;
  final TextEditingController _f1 = TextEditingController(text: '0');
  final TextEditingController _f2 = TextEditingController(text: '0');
  int _f3 = 0;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.microcycles}"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(intl.microcyclesTitle1)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(intl.low1),
                          Text(intl.average1),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(intl.large1),
                          Text(intl.veryLarge1),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(intl.microcyclesTitle2)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(intl.low2),
                          Text(intl.average2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(intl.large2),
                          Text(intl.veryLarge2),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(intl.information)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(intl.informationBody)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("TG"),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _Tg1,
                                onChanged: (value) {
                                  setState(() {
                                    _Tg3 = int.parse(_Tg1.text) *
                                        int.parse(_Tg2.text);
                                  });
                                },
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _Tg2,
                                onChanged: (value) {
                                  setState(() {
                                    _Tg3 = int.parse(_Tg1.text) *
                                        int.parse(_Tg2.text);
                                  });
                                },
                              )),
                          Text(_Tg3.toString()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("G"),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _g1,
                                onChanged: (value) {
                                  setState(() {
                                    _g3 = int.parse(_g1.text) *
                                        int.parse(_g2.text);
                                  });
                                },
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _g2,
                                onChanged: (value) {
                                  setState(() {
                                    _g3 = int.parse(_g1.text) *
                                        int.parse(_g2.text);
                                  });
                                },
                              )),
                          Text(_g3.toString()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("M"),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _m1,
                                onChanged: (value) {
                                  setState(() {
                                    _m3 = int.parse(_m1.text) *
                                        int.parse(_m2.text);
                                  });
                                },
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _m2,
                                onChanged: (value) {
                                  setState(() {
                                    _m3 = int.parse(_m1.text) *
                                        int.parse(_m2.text);
                                  });
                                },
                              )),
                          Text(_m3.toString()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("F"),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _f1,
                                onChanged: (value) {
                                  setState(() {
                                    _f3 = int.parse(_f1.text) *
                                        int.parse(_f1.text);
                                  });
                                },
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _f2,
                                onChanged: (value) {
                                  setState(() {
                                    _f3 = int.parse(_f1.text) *
                                        int.parse(_f1.text);
                                  });
                                },
                              )),
                          Text(_f3.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                        text: intl.calculate,
                        onPressed: () {
                          setState(() {
                            result = _Tg3 + _g3 + _m3 + _f3;
                          });
                        }),
                    Text(result.toString()),
                  ],
                ),
                Dimensions.verticalSpacingSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
