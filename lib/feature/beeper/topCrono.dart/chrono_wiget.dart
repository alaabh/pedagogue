import 'package:flutter/material.dart';

import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../l10n/localization.dart';

class ChronoWidget extends StatefulWidget {
  final String title;
  const ChronoWidget({super.key, required this.title});

  @override
  State<ChronoWidget> createState() => _ChronoWidgetState();
}

class _ChronoWidgetState extends State<ChronoWidget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  final _scrollController = ScrollController();

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
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.bold),
          ),
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
          StreamBuilder<List<StopWatchRecord>>(
            stream: _stopWatchTimer.records,
            initialData: _stopWatchTimer.records.value,
            builder: (context, snap) {
              final value = snap.data!;
              if (value.isEmpty) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: 100,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final data = value[index];
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '${index + 1} ${data.displayTime}',
                            style: const TextStyle(
                                fontSize: 17,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(
                          height: 1,
                        )
                      ],
                    );
                  },
                  itemCount: value.length,
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilledButton(
                onPressed: _stopWatchTimer.onStartTimer,
                child:  Text(
                  intl.start,
                ),
              ),
              FilledButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 236, 140, 133))),
                onPressed: _stopWatchTimer.onStopTimer,
                child:  Text(
                  intl.stop,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilledButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.greenAccent)),
                onPressed: _stopWatchTimer.onAddLap,
                child:  Text(
                  intl.tour,
                ),
              ),
              FilledButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.orangeAccent)),
                onPressed: _stopWatchTimer.onResetTimer,
                child:  Text(
                  intl.clear,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
