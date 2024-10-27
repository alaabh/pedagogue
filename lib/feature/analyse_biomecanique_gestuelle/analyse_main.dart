import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../l10n/localization.dart';
import 'pull_up.dart';

class AnalyseMain extends StatefulWidget {
  const AnalyseMain({super.key});

  @override
  State<AnalyseMain> createState() => _AnalyseMainState();
}

class _AnalyseMainState extends State<AnalyseMain> {
  int colorIndex = 1;
  List choices = [
    {
      "title": intl.pullUp,
      "demo": "assets/pull-up.mp4",
      "path": PullUp(
          url: "pull-up",
          demo: "assets/pull-up.mp4",
          title: intl.pullUp,
          description: intl.pullUpDescription),
      "index": 1,
    },
    {
      "title": intl.pushup,
      "demo": "assets/push-up.mp4",
      "path": PullUp(
        url: "push-up",
        demo: "assets/push-up.mp4",
        title: intl.pushup,
        description: intl.pushupDescription,
      ),
      "index": 2
    },
    {
      "title": intl.sitUp,
      "demo": "assets/sit-up.mp4",
      "path": PullUp(
        url: "sit-up",
        demo: "assets/sit-up.mp4",
        title: intl.sitUp,
        description: intl.sitUpDescription,
      ),
      "index": 3
    },
    {
      "title": intl.squat,
      "demo": "assets/squat.mp4",
      "path": PullUp(
          url: "squat",
          demo: "assets/squat.mp4",
          title: intl.squat,
          description: intl.squatDescription),
      "index": 4
    },
    {
      "title": intl.walk,
      "demo": "assets/walk.mp4",
      "path": PullUp(
          url: "walk",
          demo: "assets/walk.mp4",
          title: intl.walk,
          description: intl.walkDescription),
      "index": 5
    },
  ];

  String? langue = "";
  @override
  void initState() {
    ln();
    // TODO: implement initState

    super.initState();
  }

  Future<void> ln() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    langue = prefs.getString('SAVED_LOCALIZATION');
  }

/* langue == "ar" ? titleSize = 18 : titleSize = 10;
    langue == "ar" ? dataSize = 15 : dataSize = 10;
  double titleSize = 18;
  double dataSize = 15; */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.gestureanalysis}"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.01,
                ),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: MediaQuery.sizeOf(context).width * 0.01,
                      children: List.generate(
                        choices.length,
                        (index) => SizedBox(
                          child: OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor: colorIndex ==
                                        choices[index]['index']
                                    ? MaterialStatePropertyAll(Colors.yellow)
                                    : MaterialStatePropertyAll(
                                        Colors.transparent)),
                            onPressed: () {
                              setState(() {
                                colorIndex = choices[index]['index'];
                                print(colorIndex);
                              });
                            },
                            child: Text(
                              choices[index]["title"],
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: choices[colorIndex - 1]["path"],
              )
            ],
          ),
        ),
      ),
    );
  }
}
