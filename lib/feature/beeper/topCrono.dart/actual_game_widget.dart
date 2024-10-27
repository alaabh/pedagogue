import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class ActualGameTimeWidget extends StatefulWidget {
  const ActualGameTimeWidget({super.key});

  @override
  State<ActualGameTimeWidget> createState() => _ActualGameTimeWidgetState();
}

class _ActualGameTimeWidgetState extends State<ActualGameTimeWidget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );
  TextEditingController gameTimeController = TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: _stopWatchTimer.rawTime.value,
            builder: (context, snap) {
              final value = snap.data!;
              final displayTime = StopWatchTimer.getDisplayTime(value,
                  minute: true, hours: false);
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      intl.topChronoTitle1,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      displayTime,
                      style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
          StreamBuilder<int>(
            stream: _stopWatchTimer.minuteTime,
            initialData: 0,
            builder: (context, snap) {
              final value = snap.data;

              return SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 15),
                              controller: gameTimeController,
                              onChanged: (value) {
                                setState(() {
                                  value == ""
                                      ? gameTimeController.text = "0"
                                      : gameTimeController.text = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              intl.actualGameTime,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Helvetica',
                              ),
                            ),
                            Text(
                              value.toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          intl.gameDownTime,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (int.parse(gameTimeController.text) - value!)
                              .toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilledButton(
                  onPressed: () {
                    int.parse(gameTimeController.value.text) > 0
                        ? _stopWatchTimer.onStartTimer()
                        : null;
                  },
                  child: Text(
                    intl.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilledButton(
                  onPressed: _stopWatchTimer.onStopTimer,
                  child: Text(
                    '${intl.stop}',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                  onPressed: _stopWatchTimer.onResetTimer,
                  child: Text(
                    intl.clear,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
