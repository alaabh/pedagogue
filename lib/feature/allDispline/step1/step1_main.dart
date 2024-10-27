import 'package:flutter/material.dart';
import 'package:pedagogue/feature/allDispline/allDisplineMain.dart';
import 'package:pedagogue/feature/allDispline/step1/preparationPhysique.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/style/app_color.dart';

class Step1View extends StatefulWidget {
  const Step1View({super.key});

  @override
  State<Step1View> createState() => _Step1ViewState();
}

class _Step1ViewState extends State<Step1View> {
  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                intl.step1Title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 35,
                    fontWeight: FontWeight.w200,
                    color: AppColors.primaryColor),
              ),
              Text(
                intl.step1Description,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      child: FilledButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AllDisplineMain(),
                          ),
                        ),
                        child: isRtl
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.keyboard_arrow_right),
                                  // Add space between icon and text
                                  Text(intl.back),
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Add space between icon and text
                                  Icon(Icons.keyboard_arrow_left),

                                  Text(intl.back),
                                ],
                              ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      child: FilledButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const PreparationPhysiqueStep1(),
                          ),
                        ),
                        child: isRtl
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.keyboard_arrow_left),
                                  // Add space between icon and text
                                  Text(intl.next),
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Add space between icon and text
                                  Icon(Icons.keyboard_arrow_right),

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
