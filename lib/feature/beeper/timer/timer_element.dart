import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'timer_widget.dart';

class TimerElement extends StatefulWidget {
  final String title;
  const TimerElement({super.key, required this.title});

  @override
  State<TimerElement> createState() => _TimerElementState();
}

class _TimerElementState extends State<TimerElement> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
  );
  final StopWatchTimer _stopWatchTimer1 = StopWatchTimer(
    mode: StopWatchMode.countDown,
  );
  final StopWatchTimer _stopWatchTimer2 = StopWatchTimer(
    mode: StopWatchMode.countDown,
  );
  final StopWatchTimer _stopWatchTimer3 = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.57,
      child: Column(
        children: [
          Text(widget.title),
          TimerWidget(
            stopWatchTimer: _stopWatchTimer,
            stopWatchTimer1: _stopWatchTimer1,
            stopWatchTimer2: _stopWatchTimer2,
            stopWatchTimer3: _stopWatchTimer3,
          ),
        ],
      ),
    );
  }
}
