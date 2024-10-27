import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import 'training_calcul.dart';

class TrainingInformations extends StatefulWidget {
  const TrainingInformations({super.key});

  @override
  State<TrainingInformations> createState() => _TrainingInformationsState();
}

class _TrainingInformationsState extends State<TrainingInformations> {
  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${intl.forInformation}",
                style: TextStyle(fontSize: 15),
              ),
              Text("${intl.forInformation1}"),
              Text("${intl.forInformation2}"),
              Text("${intl.forInformation3}"),
              Text("${intl.forInformation4}"),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 55,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: FilledButton(
                        onPressed: () => Navigator.of(context)..pop(),
                        child: isRtl
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.keyboard_arrow_right),
                                  SizedBox(
                                      width:
                                          8), // Add space between icon and text
                                  Text(intl.back),
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Add space between icon and text
                                  Icon(Icons.keyboard_arrow_left),
                                  SizedBox(width: 8),
                                  Text(intl.back),
                                ],
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: MediaQuery.sizeOf(context).width * 0.32,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TrainingCalcul(),
                            ),
                          );
                        },
                        child: isRtl
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.keyboard_arrow_left),
                                  SizedBox(
                                      width:
                                          8), // Add space between icon and text
                                  Text(intl.next),
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Add space between icon and text
                                  Icon(Icons.keyboard_arrow_right),
                                  SizedBox(width: 8),
                                  Text(intl.next),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
