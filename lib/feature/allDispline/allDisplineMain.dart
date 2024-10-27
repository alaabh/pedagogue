import 'package:flutter/material.dart';
import 'package:pedagogue/feature/allDispline/step1/step1_main.dart';

import 'package:pedagogue/feature/allDispline/step3/step3_main.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../shared/style/dimensions.dart';
import 'step2/step2_main.dart';

class AllDisplineMain extends StatefulWidget {
  const AllDisplineMain({super.key});

  @override
  State<AllDisplineMain> createState() => _AllDisplineMainState();
}

class _AllDisplineMainState extends State<AllDisplineMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.allDispline)),
      body: SingleChildScrollView(
        padding: Dimensions.paddingMedium,
        child: Column(
          children: [
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Step1View(),
                    ),
                  );
                },
                child:  Text(intl.step1),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Step2View(),
                    ),
                  );
                },
                child:  Text(intl.step2),
              ),
            ),
            Dimensions.verticalSpacingSmall,
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Step3Main(),
                    ),
                  );
                },
                child:  Text(intl.step3),
              ),
            ),
            Dimensions.verticalSpacingSmall,
          ],
        ),
      ),
    );
  }
}
