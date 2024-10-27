import 'package:flutter/material.dart';
import 'package:pedagogue/feature/nutri_sport/calories/calories_view.dart';
import 'package:pedagogue/feature/nutri_sport/recipies/all_recipies.dart';
import 'package:pedagogue/l10n/localization.dart';

import '../../shared/style/dimensions.dart';

class NutriSportMain extends StatefulWidget {
  const NutriSportMain({super.key});

  @override
  State<NutriSportMain> createState() => _NutriSportMainState();
}

class _NutriSportMainState extends State<NutriSportMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.nutriSport)),
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
                      builder: (context) => const AllRecipes(),
                    ),
                  );
                },
                child: Text(intl.recipes),
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
                      builder: (context) => const CaloriesView(),
                    ),
                  );
                },
                child: Text(intl.calories),
              ),
            ),
            Dimensions.verticalSpacingSmall,
          ],
        ),
      ),
    );
  }
}
