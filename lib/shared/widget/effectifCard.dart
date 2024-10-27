import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import '../../feature/effectif/ListEffectif.dart';

class EffectifCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CardListScreen(), // Navigate to CardListScreen
            ),
          );
        },
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: AppColors.accentColor,
          child: Center(
            child: Text(
              'Effectif',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
