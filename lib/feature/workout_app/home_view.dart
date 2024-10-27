import 'package:flutter/material.dart';
import 'package:pedagogue/feature/workout_app/create_workout.dart';
import 'package:pedagogue/feature/workout_app/my_workout.dart';
import 'package:pedagogue/feature/workout_app/workout_history.dart';
import 'package:pedagogue/shared/style/app_color.dart';

import '../../l10n/localization.dart';
import '../../shared/style/dimensions.dart';

class HomeViewWorkout extends StatefulWidget {
  const HomeViewWorkout({super.key});

  @override
  State<HomeViewWorkout> createState() => _HomeViewWorkoutState();
}

class _HomeViewWorkoutState extends State<HomeViewWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Dimensions.verticalSpacingExtraLarge,
              Image.asset(
                "assets/workoutapp.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 55,
                width: double.maxFinite,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    intl.startWorkout,
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.primaryColor),
                  ),
                ),
              ),
              Dimensions.verticalSpacingExtraLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => CreateWorkout()),
                        );
                      },
                      child: Text(intl.createworkout),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyWorkout()),
                        );
                      },
                      child: Text(intl.myWorkouts),
                    ),
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => WorkoutHistory()),
                        );
                      },
                      child: Text(intl.workoutHistory),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(intl.learnExercices),
                    ),
                  ),
                ],
              ),
              Dimensions.verticalSpacingExtraLarge,
              SizedBox(
                height: 55,
                width: double.maxFinite,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    intl.prossVideoAi,
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
