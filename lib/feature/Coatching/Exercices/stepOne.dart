import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/CustomizedCounter.dart';
import '../../../shared/widget/customTextField.dart';

class StepOneExercice extends StatefulWidget {
  TextEditingController? nameController;
  TextEditingController? partController; // Corrected variable name
  TextEditingController? gameStageController; // Corrected variable name
  TextEditingController? themeController; // Corrected variable name
  TextEditingController? categoryController;
  TextEditingController? pedagoyController; // Corrected variable name
  TextEditingController? totalDuarationController;
  TextEditingController? numberrepetitionsController;
  TextEditingController? numberofseriesController;
  TextEditingController? worktimeController;
  TextEditingController? reposController;
  TextEditingController? intensityController;

  Function(double? rating)? onRatingChange;

  StepOneExercice(
      {super.key,
      this.nameController,
      this.partController,
      this.gameStageController,
      this.themeController,
      this.categoryController,
      this.pedagoyController,
      this.totalDuarationController,
      this.numberrepetitionsController,
      this.numberofseriesController,
      this.worktimeController,
      this.reposController,
      this.intensityController,
      this.onRatingChange});

  @override
  State<StepOneExercice> createState() => _StepOneExerciceState();
}

class _StepOneExerciceState extends State<StepOneExercice> {
  final JoueurController joueurController = JoueurController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dimensions.verticalSpacingSmall,
                  RatingBar.builder(
                    allowHalfRating: true,
                    initialRating: 0.0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 50,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        widget.onRatingChange!(rating);
                      });
                    },
                  ),
                  Dimensions.verticalSpacingSmall,
                  Text(
                    '${intl.name}',
                    /* style: GoogleFonts.lato(
                      // Replace with your desired Google Font
                      fontSize: 16.0,
                      // Replace with your desired font size
                      color: AppColors.accentColor,
                      // Replace with your desired color
                      letterSpacing: 1.2, // Optional: Adjust letter spacing
                    ),*/
                  ),
                  Dimensions.verticalSpacingSmall,
                  CustomTextField(
                    hintText: '${intl.name}',
                    labelText: '${intl.name}',
                    controller:
                        widget.nameController, // Pass the controller here
                  ),
                  Dimensions.verticalSpacingSmall,
                  Text(
                    '${intl.part}',
                    /*style: GoogleFonts.lato(
                      // Replace with your desired Google Font
                      fontSize: 16.0,
                      // Replace with your desired font size
                      color: AppColors.accentColor,
                      // Replace with your desired color
                      letterSpacing: 1.2, // Optional: Adjust letter spacing
                    ),*/
                  ),
                  Dimensions.verticalSpacingSmall,
                  CustomInput(
                    inputType: InputType.dropdown,
                    hint: '${intl.part}',

                    controller:
                        widget.partController, // Pass the controller here
                    dropdownItems: [
                      "${intl.partCoaching1}",
                      "${intl.partCoaching2}",
                      "${intl.partCoaching3}",
                      "${intl.partCoaching4}",
                      "${intl.partCoaching5}",
                    ],
                  ),
                  Dimensions.verticalSpacingSmall,
                  Text(
                    '${intl.gamestage}',
                    /*style: GoogleFonts.lato(
                      // Replace with your desired Google Font
                      fontSize: 16.0, // Replace with your desired font size
                      color: AppColors
                          .accentColor, // Replace with your desired color
                    ),*/
                  ),
                  Dimensions.verticalSpacingSmall,
                  CustomInput(
                    inputType: InputType.dropdown,
                    hint: '${intl.gamestage}',

                    controller:
                        widget.gameStageController, // Pass the controller here
                    dropdownItems: [
                      "${intl.gameStageCoaching1}",
                      "${intl.gameStageCoaching2}",
                      "${intl.gameStageCoaching3}",
                      "${intl.gameStageCoaching4}",
                      "${intl.gameStageCoaching5}",
                      "${intl.gameStageCoaching6}",
                    ],
                  ),
                  Dimensions.verticalSpacingSmall,
                  Dimensions.verticalSpacingSmall,
                  CustomInput(
                    inputType: InputType.dropdown,
                    hint: '${intl.pedagogy}',
                    title: '${intl.pedagogy}',
                    controller:
                        widget.pedagoyController, // Pass the controller here
                    dropdownItems: [
                      "${intl.pedagogyCoaching1}",
                      "${intl.pedagogyCoaching2}",
                    ],
                  ),
                  Dimensions.verticalSpacingSmall,
                  Dimensions.verticalSpacingSmall,
                  CustomInput(
                    inputType: InputType.dropdown,
                    hint: '${intl.theme}',
                    title: '${intl.theme}',
                    controller:
                        widget.themeController, // Pass the controller here
                    dropdownItems: [
                      "${intl.themeCoaching1}",
                      "${intl.themeCoaching2}",
                      "${intl.themeCoaching3}",
                      "${intl.themeCoaching4}",
                      "${intl.themeCoaching5}",
                      "${intl.themeCoaching6}",
                      "${intl.themeCoaching7}",
                      "${intl.themeCoaching8}",
                      "${intl.themeCoaching9}",
                      "${intl.themeCoaching10}",
                      "${intl.themeCoaching11}",
                      "${intl.themeCoaching12}",
                      "${intl.themeCoaching13}",
                      "${intl.themeCoaching14}",
                      "${intl.themeCoaching15}",
                      "${intl.themeCoaching16}",
                      "${intl.themeCoaching166}",
                      "${intl.themeCoaching17}",
                      "${intl.themeCoaching18}",
                      "${intl.themeCoaching19}",
                      "${intl.themeCoaching20}",
                      "${intl.themeCoaching21}",
                      "${intl.themeCoaching22}",
                      "${intl.themeCoaching23}",
                      "${intl.themeCoaching24}",
                    ],
                  ),
                  Dimensions.verticalSpacingSmall,
                  CustomInput(
                    inputType: InputType.dropdown,
                    controller: widget.categoryController,
                    title: "${intl.categories}",
                    dropdownItems: [
                        "${intl.u10}",
                        "${intl.u12}",
                        "${intl.u13}",
                        "${intl.u15}",
                        "${intl.u17}",
                        "${intl.u19}",
                        "${intl.u21}",
                        '${intl.categoriesCoaching1}',
                    ],
                  ),
                  Dimensions.verticalSpacingSmall,
                  CustomInput(
                    inputType: InputType.dropdown,
                    controller: widget.intensityController,
                    title: "${intl.intensity}",
                    dropdownItems: [
                      "${intl.intensityCoaching1}",
                      "${intl.intensityCoaching2}",
                      "${intl.intensityCoaching3}",
                    ],
                  ),
                ],
              ),
            ),
            Dimensions.verticalSpacingSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomizedCounter(
                  title: "${intl.totalduration}",
                  controller: widget.totalDuarationController,
                ),
                CustomizedCounter(
                  title: "${intl.numberrepetitions}",
                  controller: widget.numberrepetitionsController,
                ),
              ],
            ),
            Dimensions.verticalSpacingSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomizedCounter(
                  title: "${intl.numberofseries}",
                  controller: widget.numberofseriesController,
                ),
                CustomizedCounter(
                  title: "${intl.worktime}",
                  controller: widget.worktimeController,
                ),
              ],
            ),
            Dimensions.verticalSpacingSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomizedCounter(
                  title: "${intl.repos}",
                  controller: widget.reposController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
