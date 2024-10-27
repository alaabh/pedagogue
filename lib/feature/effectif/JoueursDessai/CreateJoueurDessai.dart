import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:pedagogue/feature/effectif/JoueursDessai/ListJoueursDessai.dart';
import 'package:pedagogue/feature/effectif/JoueursDessai/stepOne.dart';
import 'package:pedagogue/feature/effectif/JoueursDessai/stepTrie.dart';
import 'package:pedagogue/feature/effectif/JoueursDessai/stepTwo.dart';

import '../../../controller/JoueurDessai_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/joueurDessai.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class createJoueurDessai extends StatefulWidget {
  final JoueurDessai? joueurDessai;
  const createJoueurDessai({super.key, this.joueurDessai});

  @override
  State<createJoueurDessai> createState() => _createJoueurDessaiState();
}

class _createJoueurDessaiState extends State<createJoueurDessai> {
  int activeStep = 0;
  int upperBound = 2;
  TextEditingController weightController = TextEditingController();
  TextEditingController tailleController =
      TextEditingController(); // Corrected variable name
  TextEditingController prenomController =
      TextEditingController(); // Corrected variable name
  TextEditingController nomController =
      TextEditingController(); // Corrected variable name
  TextEditingController dateNaissanceController = TextEditingController();
  TextEditingController LieuNaissanceController =
      TextEditingController(); // Corrected variable name
  TextEditingController postController = TextEditingController();
  TextEditingController mutationController = TextEditingController();
  TextEditingController umeroMailltController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController numeroMailltController = TextEditingController();
  TextEditingController rightFootController = TextEditingController();
  TextEditingController selectedBirthDate = TextEditingController();
  TextEditingController countryController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ZipCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController SituationFamillyController = TextEditingController();
  TextEditingController NameFatherController = TextEditingController();
  TextEditingController NameeMotherController = TextEditingController();
  TextEditingController situationProfessionelController =
      TextEditingController();
  TextEditingController FirstNameFadherController = TextEditingController();
  TextEditingController FirstNameMotherController = TextEditingController();
  final JoueurDessaiController joueurController = JoueurDessaiController();
  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    JoueurDessai player = JoueurDessai(
        id: widget.joueurDessai?.id,
        firstName: prenomController.text,
        post: postController.text,
        mutation: mutationController.text,
        sex: sexController.text,
        birthdate: selectedBirthDate.text,
        birthplace: LieuNaissanceController.text,
        bestFoot: rightFootController.text,
        numberGarment: numeroMailltController.text,
        lastName: nomController.text,
        weight: weightController.text,
        size: tailleController.text,
        address: addressController.text,
        city: cityController.text,
        email: emailController.text,
        zipCode: ZipCodeController.text,
        mobile: phoneController.text,
        situationFamily: SituationFamillyController.text,
        fadherFirstName: FirstNameFadherController.text,
        fadherLastName: NameFatherController.text,
        situationProfessionel: situationProfessionelController.text,
        motherFirstName: FirstNameMotherController.text,
        motherLastName: NameeMotherController.text,
        country: countryController.text);
    print(player.situationFamily);

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.joueurDessai != null
          ? joueurController.update(player)
          : joueurController.add(player),
      successFunction: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ListJoueursDessai(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${intl.createPlayer}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconStepper(
              icons: [
                Icon(Icons.looks_one),
                Icon(Icons.looks_two_rounded),
                Icon(Icons.looks_3_rounded),
              ],
              activeStep: activeStep,
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            header(),
            Expanded(
              child: stepInterface(activeStep),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                activeStep == 2
                    ? CustomButton(
                        onPressed: () {
                          submit();
                        },
                        text: '${intl.save}',
                        width: MediaQuery.of(context).size.width * 0.3,
                      )
                    : SizedBox()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                previousButton(),
                nextButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('${intl.next}'),
    );
  }

  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('${intl.back}'),
    );
  }

  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget stepInterface(int step) {
    switch (step) {
      case 0:
        return StepOnedessai(
          weightController: weightController,
          tailleController: tailleController,
          prenomController: prenomController,
          nomController: nomController,
          dateNaissanceController: dateNaissanceController,
          LieuNaissanceController: LieuNaissanceController,
          postController: postController,
          mutationController: mutationController,
          umeroMailltController: umeroMailltController,
          sexController: sexController,
          numeroMailltController: numeroMailltController,
          rightFootController: rightFootController,
          selectedBirthDate: selectedBirthDate,
        );
      case 1:
        return stepTwodessai(
          addressController: addressController,
          cityController: cityController,
          emailController: emailController,
          ZipCodeController: ZipCodeController,
          phoneController: phoneController,
          countryController: countryController,
        );
      case 2:
        return stepTrieDessai(
          SituationFamillyController: SituationFamillyController,
          NameFatherController: NameFatherController,
          NameeMotherController: NameeMotherController,
          situationProfessionelController: situationProfessionelController,
          FirstNameFadherController: FirstNameFadherController,
          FirstNameMotherController: FirstNameMotherController,
        );
      default:
        return Container();
    }
  }

  String headerText() {
    switch (activeStep) {
      case 0:
        return '${intl.step1}';
      case 1:
        return '${intl.step2}';
      case 2:
        return '${intl.step3}';
      default:
        return 'Introduction';
    }
  }
}
