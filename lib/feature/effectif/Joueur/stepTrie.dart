import 'package:flutter/material.dart';

import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/Joueur_model.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_input.dart';

class stepTrie extends StatefulWidget {
  final Player? player;
  TextEditingController? SituationFamillyController;
  TextEditingController? NameFatherController;
  TextEditingController? NameeMotherController;
  TextEditingController? situationProfessionelController;
  TextEditingController? FirstNameFadherController;
  TextEditingController? FirstNameMotherController;

  stepTrie({
    super.key,
    this.player,
    this.SituationFamillyController,
    this.NameFatherController,
    this.NameeMotherController,
    this.situationProfessionelController,
    this.FirstNameFadherController,
    this.FirstNameMotherController,
  });

  @override
  State<stepTrie> createState() => _stepTrieState();
}

class _stepTrieState extends State<stepTrie> {
  final _formKey = GlobalKey<FormState>();
  final JoueurController joueurController = JoueurController();

  /*  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    Player player = Player(
      id: widget.player?.id,
      situationFamily: _SituationFamillyController.text,
      fadherFirstName: _FirstNameFadherController.text,
      fadherLastName: _NameFatherController.text,
      situationProfessionel: _situationProfessionelController.text,
      motherFirstName: _FirstNameMotherController.toString(),
      motherLastName: _NameeMotherController.toString(),
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.player != null
          ? joueurController.update(player)
          : joueurController.add(player),
      successFunction: () => Navigator.pop(context),
    );
  }
 */
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimensions.verticalSpacingSmall,
              Text(
                intl.situationFamilly,
                /* style: GoogleFonts.lato(
                  // Replace with your desired Google Font
                  fontSize: 16.0, // Replace with your desired font size
                  color:
                      AppColors.accentColor, // Replace with your desired color
                  // You can add more styling properties as needed
                ),*/
              ),
              CustomInput(
                inputType: InputType.dropdown,
                controller: widget.SituationFamillyController,
                dropdownItems: [
                  '${intl.situationFamily1}',
                  '${intl.situationFamily2}',
                  '${intl.situationFamily3}',
                ],
                title: '',
              ),
              Dimensions.verticalSpacingSmall,
              Text(
                intl.fadherName,
                /*style: GoogleFonts.lato(
                  // Replace with your desired Google Font
                  fontSize: 16.0,
                  // Replace with your desired font size
                  color: AppColors.accentColor,
                  // Replace with your desired color
                  letterSpacing: 1.2, // Optional: Adjust letter spacing
                ),*/
              ),
              CustomTextField(
                hintText: ' ',
                labelText: ' ',
                controller:
                    widget.NameFatherController, // Pass the controller here
              ),
              Dimensions.verticalSpacingSmall,
              Text(
                intl.momName,
                /* style: GoogleFonts.lato(
                  // Replace with your desired Google Font
                  fontSize: 16.0,
                  // Replace with your desired font size
                  color: AppColors.accentColor,
                  // Replace with your desired color
                  letterSpacing: 1.2, // Optional: Adjust letter spacing
                ),*/
              ),
              CustomTextField(
                hintText: ' ',
                labelText: ' ',
                controller:
                    widget.NameeMotherController, // Pass the controller here
              ),
              Dimensions.verticalSpacingSmall,
              Text(
                intl.situationProfessionel,
                /*style: GoogleFonts.lato(
                  // Replace with your desired Google Font
                  fontSize: 16.0,
                  // Replace with your desired font size
                  color: AppColors.accentColor,
                  // Replace with your desired color
                  letterSpacing: 1.2, // Optional: Adjust letter spacing
                ),*/
              ),
              CustomInput(
                inputType: InputType.dropdown,
                controller: widget.situationProfessionelController,
                dropdownItems: [
                  intl.situationProfessionel1,
                  intl.situationProfessionel2,
                  intl.situationProfessionel3,
                ],
                title: '',
              ),
              Dimensions.verticalSpacingSmall,
              Text(
                intl.firstNameFadher,
                /*style: GoogleFonts.lato(
                  // Replace with your desired Google Font
                  fontSize: 16.0, // Replace with your desired font size
                  color:
                      AppColors.accentColor, // Replace with your desired color
                ),*/
              ),
              CustomTextField(
                hintText: '',
                labelText: '',
                controller: widget
                    .FirstNameFadherController, // Pass the controller here
              ),
              Dimensions.verticalSpacingSmall,
              Text(
                intl.firstNameMother,
                /*style: GoogleFonts.lato(
                  // Replace with your desired Google Font
                  fontSize: 16.0, // Replace with your desired font size
                  color:
                      AppColors.accentColor, // Replace with your desired color
                ),*/
              ),
              Dimensions.verticalSpacingSmall,
              CustomTextField(
                hintText: '',
                labelText: '',
                controller: widget
                    .FirstNameMotherController, // Pass the controller here
              ),
              Dimensions.verticalSpacingSmall,
            ],
          ),
        ),
      ),
    );
  }
}
