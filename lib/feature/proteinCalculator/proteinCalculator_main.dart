import 'package:flutter/material.dart';
import 'package:pedagogue/feature/proteinCalculator/protein_calculator_view.dart';

import '../../l10n/localization.dart';

class ProteinCalculatorMAin extends StatefulWidget {
  const ProteinCalculatorMAin({super.key});

  @override
  State<ProteinCalculatorMAin> createState() => _ProteinCalculatorMAinState();
}

class _ProteinCalculatorMAinState extends State<ProteinCalculatorMAin> {
  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.proteinCalculator),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.9,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      intl.proteinCalculator1,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(intl.proteinCalculator2),
                    Text(
                      intl.proteinCalculator3,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "${intl.proteinCalculator4}\n\n${intl.proteinCalculator5} ",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                SizedBox(
                  height: 55,
                  width: MediaQuery.sizeOf(context).width * 0.32,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProteinCalculatorView()));
                    },
                    child: isRtl
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.keyboard_arrow_left),
                              SizedBox(
                                  width: 8), // Add space between icon and text
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
          ),
        ),
      ),
    );
  }
}
