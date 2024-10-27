import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerWidget extends StatefulWidget {
  final StopWatchTimer stopWatchTimer;
  final StopWatchTimer stopWatchTimer1;
  final StopWatchTimer stopWatchTimer2;
  final StopWatchTimer stopWatchTimer3;
  const TimerWidget(
      {super.key,
      required this.stopWatchTimer,
      required this.stopWatchTimer1,
      required this.stopWatchTimer2,
      required this.stopWatchTimer3});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final _scrollController = ScrollController();
  TextEditingController secondsController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  TextEditingController secondsController1 = TextEditingController();
  TextEditingController minutesController1 = TextEditingController();
  TextEditingController roundsController = TextEditingController(text: "1");
  bool resetwork = true;
  int roundCompleted = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await widget.stopWatchTimer.dispose();
    await widget.stopWatchTimer1.dispose();
    await widget.stopWatchTimer2.dispose();
    await widget.stopWatchTimer3.dispose();
  }

  Future<void> start() async {
    int rounds = int.parse(roundsController.text);
    widget.stopWatchTimer3.onStartTimer();
    widget.stopWatchTimer2.onStartTimer();
    widget.stopWatchTimer2.setPresetTime(
      add: false,
      mSec: StopWatchTimer.getMilliSecFromSecond(
        (((int.tryParse(secondsController.text) ?? 0) +
                    (int.tryParse(minutesController.text) ?? 0) * 60) +
                ((int.tryParse(secondsController.text) ?? 0) +
                    (int.tryParse(minutesController.text) ?? 0) * 60)) *
            rounds,
      ),
    );
    for (int i = 0; i < rounds; i++) {
      // Start widget.stopWatchTimer
      setState(() {
        resetwork = true;
      });

      widget.stopWatchTimer.onStartTimer();
      widget.stopWatchTimer.setPresetTime(
        add: false,
        mSec: StopWatchTimer.getMilliSecFromSecond(
          (int.tryParse(secondsController.text) ?? 0) +
              (int.tryParse(minutesController.text) ?? 0) * 60,
        ),
      );

      // Wait for widget.stopWatchTimer to end
      await widget.stopWatchTimer.fetchEnded.first;
      setState(() {
        resetwork = false;
      });

      // Start widget.stopWatchTimer1
      widget.stopWatchTimer1.onStartTimer();
      widget.stopWatchTimer1.setPresetTime(
        add: false,
        mSec: StopWatchTimer.getMilliSecFromSecond(
          (int.tryParse(secondsController1.text) ?? 0) +
              (int.tryParse(minutesController1.text) ?? 0) * 60,
        ),
      );

      // Wait for widget.stopWatchTimer1 to end
      await widget.stopWatchTimer1.fetchEnded.first;

      // Reset both timers
      widget.stopWatchTimer.onResetTimer();
      widget.stopWatchTimer1.onResetTimer();
      setState(() {
        roundCompleted = i + 1;
      });
      print("Round ${i + 1} completed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        /// Display stop watch time
        resetwork == true
            ? StreamBuilder<int>(
                stream: widget.stopWatchTimer.rawTime,
                initialData: widget.stopWatchTimer.rawTime.value,
                builder: (context, snap) {
                  final value = snap.data!;
                  final displayTime = StopWatchTimer.getDisplayTime(value,
                      hours: false, milliSecond: false);

                  return Column(
                    children: <Widget>[
                      Text(
                        intl.timerWork,
                        style: const TextStyle(
                            fontSize: 30,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        displayTime,
                        style: const TextStyle(
                            fontSize: 40,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                },
              )
            : StreamBuilder<int>(
                stream: widget.stopWatchTimer1.rawTime,
                initialData: widget.stopWatchTimer1.rawTime.value,
                builder: (context, snap) {
                  final value = snap.data!;
                  final displayTime = StopWatchTimer.getDisplayTime(value,
                      hours: false, milliSecond: false);
                  return Column(
                    children: <Widget>[
                      Text(
                        "REPOS",
                        style: const TextStyle(
                            fontSize: 30,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        displayTime,
                        style: const TextStyle(
                            fontSize: 40,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                },
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  intl.intervals,
                  style: const TextStyle(
                      fontFamily: 'Helvetica', fontWeight: FontWeight.bold),
                ),
                Text(
                  "$roundCompleted/${roundsController.text}",
                  style: const TextStyle(
                      fontFamily: 'Helvetica', fontWeight: FontWeight.bold),
                ),
              ],
            ),
            StreamBuilder<int>(
              stream: widget.stopWatchTimer2.rawTime,
              initialData: widget.stopWatchTimer2.rawTime.value,
              builder: (context, snap) {
                final value = snap.data!;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value, milliSecond: false);
                return Column(
                  children: [
                    Text(
                      intl.remainingTime,
                      style: const TextStyle(
                          fontFamily: 'Helvetica', fontWeight: FontWeight.bold),
                    ),
                    Text(
                      displayTime,
                      style: const TextStyle(
                          fontFamily: 'Helvetica', fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
            StreamBuilder<int>(
              stream: widget.stopWatchTimer3.rawTime,
              initialData: widget.stopWatchTimer3.rawTime.value,
              builder: (context, snap) {
                final value = snap.data!;

                final displayTime =
                    StopWatchTimer.getDisplayTime(value, milliSecond: false);

                return Column(
                  children: [
                    Text(
                      intl.time,
                      style: const TextStyle(
                          fontFamily: 'Helvetica', fontWeight: FontWeight.bold),
                    ),
                    Text(
                      displayTime,
                      style: const TextStyle(
                          fontFamily: 'Helvetica', fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ],
        ),

        /// Button
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilledButton(
                    onPressed: () {
                      start();
                    },
                    child: Text(
                      '${intl.start}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilledButton(
                    onPressed: () {
                      widget.stopWatchTimer.onStopTimer();
                      widget.stopWatchTimer1.onStopTimer();
                      widget.stopWatchTimer2.onStopTimer();
                      widget.stopWatchTimer3.onStopTimer();
                    },
                    child: Text(
                      '${intl.stop}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilledButton(
                    onPressed: () {
                      widget.stopWatchTimer.onResetTimer();
                      widget.stopWatchTimer1.onResetTimer();
                      widget.stopWatchTimer2.onResetTimer();
                      widget.stopWatchTimer3.onResetTimer();
                      setState(() {
                        roundCompleted = 0;
                      });
                    },
                    child: Text(
                      '${intl.clear}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  intl.workPeriod,
                  style: const TextStyle(
                      fontFamily: 'Helvetica', fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextField(
                          decoration:
                              InputDecoration(label: Text("${intl.seconds1}")),
                          keyboardType: TextInputType.number,
                          controller: secondsController,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextField(
                          decoration:
                              InputDecoration(label: Text("${intl.minutes1}")),
                          keyboardType: TextInputType.number,
                          controller: minutesController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  intl.restperiod,
                  style: const TextStyle(
                      fontFamily: 'Helvetica', fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextField(
                          decoration:
                              InputDecoration(label: Text("${intl.seconds1}")),
                          keyboardType: TextInputType.number,
                          controller: secondsController1,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextField(
                          decoration:
                              InputDecoration(label: Text("${intl.minutes1}")),
                          keyboardType: TextInputType.number,
                          controller: minutesController1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.07,
          child: TextField(
            decoration: InputDecoration(label: Text(intl.rounds)),
            keyboardType: TextInputType.number,
            controller: roundsController,
          ),
        ),
      ],
    );
  }
}
