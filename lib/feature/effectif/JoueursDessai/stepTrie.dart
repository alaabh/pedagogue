import 'package:flutter/material.dart';

import '../../../controller/JoueurDessai_controller.dart';
import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_input.dart';

class stepTrieDessai extends StatefulWidget {
 TextEditingController? SituationFamillyController;
  TextEditingController? NameFatherController;
  TextEditingController? NameeMotherController;
  TextEditingController? situationProfessionelController;
  TextEditingController? FirstNameFadherController;
  TextEditingController? FirstNameMotherController;

  stepTrieDessai({
    super.key,
   
    this.SituationFamillyController,
    this.NameFatherController,
    this.NameeMotherController,
    this.situationProfessionelController,
    this.FirstNameFadherController,
    this.FirstNameMotherController,
  });

  @override
  State<stepTrieDessai> createState() => _stepTrieDessaiState();
}

class _stepTrieDessaiState extends State<stepTrieDessai> {
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
                style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
              ),
              CustomInput(
                inputType: InputType.dropdown,
                controller: widget.SituationFamillyController,
                 dropdownItems:  [
                 intl.situationFamily1,
                 intl.situationFamily2,
                 intl.situationFamily3,
                ],
                title: '',
              ),
              Dimensions.verticalSpacingSmall,
              Text(
                intl.fadherName,
                style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
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
                style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
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
              style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
              ),
              CustomInput(
                inputType: InputType.dropdown,
                controller: widget.situationProfessionelController,
                dropdownItems:  [
                  
                 
                 intl.situationProfessionel1,
                 intl.situationProfessionel2,
                 intl.situationProfessionel3,
                ],
                title: '',
              ),
              Dimensions.verticalSpacingSmall,
              Text(
                intl.firstNameFadher,
               style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
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
               style: TextStyle( fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor,)
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
