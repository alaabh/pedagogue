import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../../shared/style/app_color.dart';
import 'step3_view.dart';

class Step3Main extends StatefulWidget {
  const Step3Main({super.key});

  @override
  State<Step3Main> createState() => _Step3MainState();
}

class _Step3MainState extends State<Step3Main> {
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
                intl.step3Title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 35,
                    fontWeight: FontWeight.w200,
                    color: AppColors.primaryColor),
              ),
              Text(
                intl.step3Description,
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
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: FilledButton(
                        onPressed: () => Navigator.of(context)..pop(),
                        child: isRtl
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.keyboard_arrow_right),
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
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: FilledButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Step3View(),
                          ),
                        ),
                        child: isRtl
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.keyboard_arrow_left),
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
