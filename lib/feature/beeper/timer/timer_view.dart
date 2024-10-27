import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';

import 'timer_element.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${intl.onesessiontimer}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: TimerElement(
                    title: intl.timerTitle1,
                  )),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: TimerElement(
                    title: intl.timerTitle2,
                  )),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: TimerElement(
                    title: intl.timerTitle3,
                  )),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: TimerElement(
                    title: intl.timerTitle4,
                  )),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: TimerElement(
                    title: '',
                  )),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: TimerElement(
                    title: '',
                  )),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: TimerElement(
                    title: intl.timerTitle4,
                  )),

              /*  SizedBox(
            height: MediaQuery.of(context).size.height * 0.57,
            child: Column(
              children: [
                Text("General warm-up"),
                TimerWidget(),
              ],
            ),
          ), */
            ],
          ),
        ));
  }
}
