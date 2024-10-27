import 'package:flutter/material.dart';
import 'package:pedagogue/feature/calculator/biological_age/biological_age_view.dart';
import 'package:pedagogue/feature/calculator/calories/calories_view.dart';
import 'package:pedagogue/feature/calculator/ideal_measurements_rth/ideal_measurment_view.dart';
import 'package:pedagogue/feature/calculator/index_mass_corporal/index_mass_corporal_view.dart';
import 'package:pedagogue/feature/calculator/macro_calculator/macro_calculator_view.dart';
import 'package:pedagogue/feature/calculator/microcycles/microcycle_view.dart';
import 'package:pedagogue/feature/calculator/one_rep_mac_tool/one_rep_max_tool_view.dart';
import 'package:pedagogue/feature/calculator/trainnig/trainnig_view.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../shared/style/dimensions.dart';
import 'Img_calculation/img_clacuator.dart';
import 'atheletic_preparation.dart/athleticPreparation_view.dart';
import 'basal_metabolism/basal_metabolism_view.dart';
import 'ideal_weight_bornhardt/ideal_weight_bornhardt.dart';
import 'ideal_weight_lorentz/ideal_weigth_lorentz.dart';
import 'ideal_weigth_broca/ideal_weigth_broca.dart';
import 'ideal_weigth_creff/ideal_weight_creff.dart';
import 'ideal_weigth_devine/ideal_weigth_devine.dart';
import 'ideal_weigth_monerot/ideal_weigth_monerot.dart';
import 'ideal_weigth_peck/ideal_weigth_peck.dart';
import 'imc_child/imc_child_view.dart';
import 'index_mass_adipose/index_mass_adipose_view.dart';
import 'nick_trefethen_imc/nick_trefethen_imc.dart';

class CalculatorMAin extends StatefulWidget {
  const CalculatorMAin({super.key});

  @override
  State<CalculatorMAin> createState() => _CalculatorMAinState();
}

class _CalculatorMAinState extends State<CalculatorMAin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.calculator),
      ),
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
                      builder: (context) => const AthleticPreparation(),
                    ),
                  );
                },
                child: Text(intl.athleticPreparation),
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
                      builder: (context) => const TrainingView(),
                    ),
                  );
                },
                child: Text(intl.training),
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
                      builder: (context) => const MicrocycleView(),
                    ),
                  );
                },
                child: Text(intl.microcycles),
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
                      builder: (context) => const CaloriesCalculatorView(),
                    ),
                  );
                },
                child: Text(intl.calories),
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
                      builder: (context) => const MacroCalculatorView(),
                    ),
                  );
                },
                child: Text(intl.macro),
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
                      builder: (context) => const OneRepMAxToolView(),
                    ),
                  );
                },
                child: Text(intl.oneRepMaxTool),
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
                      builder: (context) => const ImcCalculator(),
                    ),
                  );
                },
                child: Text(intl.indexMassCorporal),
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
                      builder: (context) => const CalculatingIMG(),
                    ),
                  );
                },
                child: Text(intl.indexMassGreasy),
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
                      builder: (context) => const IdealMeasurementsView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle9}"),
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
                      builder: (context) => const BasalMetabolismView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle10}"),
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
                      builder: (context) => const IndexMassAdiposeView(),
                    ),
                  );
                },
                child: Text("${intl.imaTitle1}"),
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
                      builder: (context) => const IdealWeigthLorentzView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle12}"),
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
                      builder: (context) => const IdealWeigthMonnerotView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle13}"),
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
                      builder: (context) => const IdealWeigthCreffView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle14}"),
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
                      builder: (context) => const IdealWeigthBrocaView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle15}"),
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
                      builder: (context) => const IdealWeigthDevineView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle16}"),
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
                      builder: (context) => const IdealWeigthPeckView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle17}"),
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
                      builder: (context) => const IdealWeightBornhardtView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle18}"),
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
                      builder: (context) => const NickTrefethenImcView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle19}"),
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
                      builder: (context) => const ImcChildView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle20}"),
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
                      builder: (context) => const BiologicalAgeView(),
                    ),
                  );
                },
                child: Text("${intl.calculatorTitle21}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
