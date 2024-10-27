import 'dart:async';
import 'package:flutter/material.dart';
import '../../shared/style/assets.dart';
import '../change_language_app/change_language_app.dart';
import 'on_boarding_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ChangeLanguageApp(), 
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Transform.scale(
              scale: 0.75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    200), // Set the radius to 50.0 for a circular image
                child: Image.asset(
                  Assets.logoLight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
