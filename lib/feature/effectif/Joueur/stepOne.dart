import 'package:flutter/material.dart';

import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/Joueur_model.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_input.dart';

class StepOne extends StatefulWidget {
  final Player? player;
  TextEditingController? weightController;
  TextEditingController? tailleController;
  TextEditingController? prenomController;
  TextEditingController? nomController;
  TextEditingController? dateNaissanceController;
  TextEditingController? LieuNaissanceController;
  TextEditingController? postController;
  TextEditingController? mutationController;
  TextEditingController? umeroMailltController;
  String? sex;
  TextEditingController? numeroMailltController;
  TextEditingController? rightFootController;
  TextEditingController? selectedBirthDate;
  StepOne({
    Key? key,
    this.player,
    this.weightController,
    this.tailleController,
    this.prenomController,
    this.nomController,
    this.dateNaissanceController,
    this.LieuNaissanceController,
    this.postController,
    this.mutationController,
    this.umeroMailltController,
    this.sex,
    this.numeroMailltController,
    this.rightFootController,
    this.selectedBirthDate,
  }) : super(key: key);

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final JoueurController joueurController = JoueurController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio<String?>(
                        value: "mr",
                        groupValue: widget.sex,
                        onChanged: (String? value) {
                          setState(() {
                            widget.sex = value;
                          });
                        },
                      ),
                      Text(intl.male)
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String?>(
                        value: "mme",
                        groupValue: widget.sex,
                        onChanged: (String? value) {
                          setState(() {
                            widget.sex = value;
                          });
                        },
                      ),
                      Text(intl.female)
                    ],
                  ),
                ],
              ),
              Text(
                intl.poste,
                /*style: GoogleFonts.lato(
                  // Replace with your desired Google Font
                  fontSize: 16.0, // Replace with your desired font size
                  color:
                      AppColors.accentColor, // Replace with your desired color
                  // You can add more styling properties as needed
                ),*/
              ),
              CustomInput(
                inputType: InputType.dropdown,
                controller: widget.postController,
                dropdownItems: [
                  "${intl.matchFormAttacker}",
                  "${intl.leftstriker}",
                  "${intl.rightstriker}",
                  "${intl.centralstriker}",
                  "${intl.matchFormMiddle}",
                  "${intl.rightmidfielder}",
                  "${intl.defensivemidfielder}",
                  "${intl.attackingmidfielder}",
                  "${intl.leftmidfielder}",
                  "${intl.matchFormDefender}",
                  "${intl.rightcentreback}",
                  "${intl.leftcentreback}",
                  "${intl.leftside}",
                  "${intl.rightSide}",
                  "${intl.matchFormGuardian}",
                  "${intl.matchFormGuardian1}",
                ],
                dropdownTitleItems: [
                  "${intl.matchFormAttacker}",
                  "${intl.matchFormMiddle}",
                  "${intl.matchFormDefender}",
                  "${intl.matchFormGuardian}",
                ],
              ),
              Text(
                intl.mutation,
                /*style: GoogleFonts.lato(
                  // Replace with your desired Google Font
                  fontSize: 16.0, // Replace with your desired font size
                  color:
                      AppColors.accentColor, // Replace with your desired color
                  // You can add more styling properties as needed
                ),*/
              ),
              CustomInput(
                inputType: InputType.dropdown,
                controller: widget.mutationController,
                dropdownItems: [
                  '${intl.mutation1}',
                  '${intl.mutation2}',
                  '${intl.mutation3}'
                ],
              ),
              Text(
                intl.meilleurPied,
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
                controller: widget.rightFootController,
                dropdownItems: [
                  '${intl.foot1}',
                  '${intl.foot2}',
                  '${intl.foot3}',
                ],
              ),
              Text(
                intl.numeroMaillot,
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
                labelText: intl.numeroMaillot,
                controller:
                    widget.numeroMailltController, // Pass the controller here
              ),
              Text(
                intl.birthPlace,
                /*style: GoogleFonts.lato(
                  // Replace with your desired Google Font
                  fontSize: 16.0, // Replace with your desired font size
                  color:
                      AppColors.accentColor, // Replace with your desired color
                  // Optional: Adjust letter spacing
                ),*/
              ),
              CustomTextField(
                hintText: '',
                labelText: '',
                controller:
                    widget.LieuNaissanceController, // Pass the controller here
              ),

              Text(
                intl.firstName,
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
                controller: widget.prenomController, // Pass the controller here
              ),
              Text(
                intl.lastName,
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
                controller: widget.nomController, // Pass the controller here
              ),
              Text(
                '${intl.birthdate}*',
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
                inputType: InputType.date,
                controller:
                    widget.selectedBirthDate, // Pass the controller here
              ),
              Text(
                intl.poid,
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
                hintText: '',
                labelText: '',
                controller: widget.weightController, // Pass the controller here
              ),

              Text(
                '${intl.taille}',
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
                hintText: '',
                labelText: '',
                controller: widget.tailleController, // Pass the controller here
              ),

              Dimensions.verticalSpacingHuge,

              //  _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}