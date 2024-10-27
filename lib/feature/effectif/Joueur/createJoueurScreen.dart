import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';
import 'package:pedagogue/feature/effectif/Joueur/ListJoueurScreen.dart';
import 'package:pedagogue/feature/effectif/Joueur/stepTrie.dart';
import 'package:pedagogue/feature/effectif/Joueur/stepTwo.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/Joueur_model.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'stepOne.dart';

class CreateJoueur extends StatefulWidget {
  final Player? player;

  const CreateJoueur({super.key, this.player});

  @override
  _CreateJoueurState createState() => _CreateJoueurState();
}

class _CreateJoueurState extends State<CreateJoueur> {
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
  final JoueurController joueurController = JoueurController();
  String? sex = "mr";
  String convertDateFormat(String originalDateString) {
    // Parse the original string to a DateTime object
    DateTime dateTime = DateFormat('dd/MM/yyyy').parse(originalDateString);

    // Format the DateTime object to the desired string format
    String formattedDateString = DateFormat('yyyy-MM-dd').format(dateTime);

    return formattedDateString;
  }

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    Player player = Player(
        id: widget.player?.id,
        firstName: prenomController.text,
        post_en: postController.text,
        post_fr: postController.text,
        post_ar: postController.text,
        mutation_en: mutationController.text,
        mutation_fr: mutationController.text,
        mutation_ar: mutationController.text,
        sex: sex,
        birthdate: selectedBirthDate.text,
        birthplace: LieuNaissanceController.text,
        best_foot_en: rightFootController.text,
        best_foot_fr: rightFootController.text,
        best_foot_ar: rightFootController.text,
        numberGarment: numeroMailltController.text,
        lastName: nomController.text,
        weight: weightController.text,
        size: tailleController.text,
        address: addressController.text,
        city: cityController.text,
        email: emailController.text,
        zipCode: ZipCodeController.text,
        mobile: phoneController.text,
        situation_family_en: SituationFamillyController.text,
        situation_family_fr: SituationFamillyController.text,
        situation_family_ar: SituationFamillyController.text,
        fadherFirstName: FirstNameFadherController.text,
        fadherLastName: NameFatherController.text,
        situation_professionel_en: situationProfessionelController.text,
        situation_professionel_fr: situationProfessionelController.text,
        situation_professionel_ar: situationProfessionelController.text,
        motherFirstName: FirstNameMotherController.text,
        motherLastName: NameeMotherController.text,
        country: countryController.text);
    print(player.situation_family_en);

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.player != null
          ? joueurController.update(player)
          : joueurController.add(player),
      successFunction: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => JoueurListView(),
        ),
      ),
    );
  }

  String? langue = "";
  Future<void> language() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      langue = prefs.getString('SAVED_LOCALIZATION');
    });
    print(langue);
  }

  @override
  void initState() {
    print("sssssssssssssssssss");
    if (widget.player != null) {
      language();
      weightController = TextEditingController(text: widget.player!.weight);
      tailleController = TextEditingController(
          text: widget.player!.size); // Corrected variable name
      prenomController = TextEditingController(
          text: widget.player!.lastName); // Corrected variable name
      nomController = TextEditingController(
          text: widget.player!.firstName); // Corrected variable name
      dateNaissanceController =
          TextEditingController(text: widget.player!.birthdate);

      LieuNaissanceController = TextEditingController(
          text: widget.player!.birthplace); // Corrected variable name
      sexController = TextEditingController();
      numeroMailltController =
          TextEditingController(text: widget.player!.numberGarment);
      selectedBirthDate = TextEditingController(text: widget.player!.birthdate);
      countryController = TextEditingController(text: widget.player!.country);

      addressController = TextEditingController(text: widget.player!.address);
      cityController = TextEditingController(text: widget.player!.city);
      emailController = TextEditingController(text: widget.player!.email);
      ZipCodeController = TextEditingController(text: widget.player!.zipCode);
      phoneController = TextEditingController(text: widget.player!.mobile);

      NameFatherController =
          TextEditingController(text: widget.player!.fadherLastName);
      NameeMotherController =
          TextEditingController(text: widget.player!.motherLastName);

      FirstNameFadherController =
          TextEditingController(text: widget.player!.fadherFirstName);
      FirstNameMotherController =
          TextEditingController(text: widget.player!.motherFirstName);
      sex = "mr";
      if (langue == "ar") {
        postController = TextEditingController(text: widget.player!.post_ar);
        mutationController =
            TextEditingController(text: widget.player!.mutation_ar);
        rightFootController =
            TextEditingController(text: widget.player!.best_foot_ar);
        SituationFamillyController =
            TextEditingController(text: widget.player!.situation_family_ar);
        situationProfessionelController =
            TextEditingController(text: widget.player!.situation_family_ar);
      } else if (langue == "fr") {
        postController = TextEditingController(text: widget.player!.post_fr);
        mutationController =
            TextEditingController(text: widget.player!.mutation_fr);
        rightFootController =
            TextEditingController(text: widget.player!.best_foot_fr);
        SituationFamillyController =
            TextEditingController(text: widget.player!.situation_family_fr);
        situationProfessionelController =
            TextEditingController(text: widget.player!.situation_family_fr);
      } else {
        postController = TextEditingController(text: widget.player!.post_en);
        mutationController =
            TextEditingController(text: widget.player!.mutation_en);
        rightFootController =
            TextEditingController(text: widget.player!.best_foot_en);
        SituationFamillyController =
            TextEditingController(text: widget.player!.situation_family_en);
        situationProfessionelController =
            TextEditingController(text: widget.player!.situation_family_en);
      }
    }
    super.initState();
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
                          print(countryController.text);
                          print("rrrrrrrrrrrrrrrrrrrrrrr");
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
        return StepOne(
          weightController: weightController,
          tailleController: tailleController,
          prenomController: prenomController,
          nomController: nomController,
          dateNaissanceController: dateNaissanceController,
          LieuNaissanceController: LieuNaissanceController,
          postController: postController,
          mutationController: mutationController,
          umeroMailltController: umeroMailltController,
          sex: sex,
          numeroMailltController: numeroMailltController,
          rightFootController: rightFootController,
          selectedBirthDate: selectedBirthDate,
        );
      case 1:
        return stepTwo(
          addressController: addressController,
          cityController: cityController,
          emailController: emailController,
          ZipCodeController: ZipCodeController,
          phoneController: phoneController,
          countryController: countryController,
        );
      case 2:
        return stepTrie(
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
