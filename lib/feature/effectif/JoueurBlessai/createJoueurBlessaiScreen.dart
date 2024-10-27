import 'package:flutter/material.dart';
import 'package:pedagogue/shared/style/app_color.dart';

import '../../../controller/joueurInjured_controller.dart';
import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/Joueur_model.dart';
import '../../../model/injuredPlayer_model.dart';
import '../../../shared/Widget/custom_button.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class CreateJoueurBlessai extends StatefulWidget {
  final PlayerInjured? playerInjured;

  const CreateJoueurBlessai({
    super.key,
    this.playerInjured,
  });

  @override
  _CreateJoueurBlessai createState() => _CreateJoueurBlessai();
}

class _CreateJoueurBlessai extends State<CreateJoueurBlessai> {
  final _formKey = GlobalKey<FormState>();

  JoueurInjuredController joueurInjuredController = JoueurInjuredController();
  final JoueurController joueurController = JoueurController();

  List<Player> players = [];

  TextEditingController injuredController = TextEditingController();
  TextEditingController dateDebutController = TextEditingController();
  TextEditingController dateFinController = TextEditingController();
  Player? selectedPlayer;

  @override
  void initState() {
    super.initState();
    loadData();

    joueurController.getAll().then((players) {
      setState(() {
        players = players;
      });
    });
    if (widget.playerInjured != null) {
      injuredController.text = widget.playerInjured!.injury_en ?? '';
      dateDebutController.text =
          widget.playerInjured!.startDateInjury?.toIso8601String() ?? '';
      dateFinController.text =
          widget.playerInjured!.endDateInjury?.toIso8601String() ?? '';
      if (widget.playerInjured?.playerId != null) {
        joueurController
            .getById(widget.playerInjured!.playerId!)
            .then((apiResponse) => selectedPlayer = apiResponse.item);
      }
    }
  }

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    PlayerInjured playerInjured = PlayerInjured(
      id: widget.playerInjured?.id,
      injury_en: injuredController.text,
      // Assuming Player has a 'name' field
      startDateInjury: DateTime.parse(dateDebutController.text),
      // Parse text to DateTime
      endDateInjury:
          DateTime.parse(dateFinController.text), // Parse text to DateTime
      playerId: selectedPlayer?.id,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.playerInjured != null
          ? joueurInjuredController.update(playerInjured)
          : joueurInjuredController.add(playerInjured),
      successFunction: () => Navigator.pop(context),
    );
  }

  TextEditingController _ListePlayersController = TextEditingController();
  final JoueurController joueur1Controller = JoueurController();
  List<String>? exerciceList = [];
  List<String>? exerciceIdList = [];
  bool playerLoader = false;

  Future<void> loadData() async {
    await joueur1Controller.getAll();

    setState(() {
      for (var element in joueur1Controller.apiResponse.value.itemList) {
        print(element.firstName);
        exerciceList!.add(
            element.firstName.toString() + " " + element.lastName.toString());
        exerciceIdList!.add(element.id.toString());
      }

      print(exerciceList);
      print(exerciceIdList);
      _ListePlayersController = TextEditingController(
          /*  text: widget.sessions == null
              ? null
              : exerciceList![exerciceIdList!
                  .indexOf(widget.sessions!.exercice_id.toString())] */
          );
      playerLoader = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.createPlayer}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimensions.verticalSpacingSmall,
                Text(
                  intl.joueurs,
                  /* style: GoogleFonts.lato(
                    // Replace with your desired Google Font
                    fontSize: 16.0, // Replace with your desired font size
                    color: AppColors
                        .accentColor, // Replace with your desired color
                    // You can add more styling properties as needed
                  ),*/
                ),
                playerLoader != true
                    ? Center(child: LoadingWidget())
                    : CustomInput(
                        inputType: InputType.dropdown,
                        controller: _ListePlayersController,
                        dropdownItems: exerciceList,
                      ),
                Text(
                  intl.injured,
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
                  controller: injuredController,
                  dropdownItems: [
                    "${intl.injury1}",
                    "${intl.injury2}",
                    "${intl.injury3}",
                    "${intl.injury4}",
                    "${intl.injury5}",
                    "${intl.injury6}",
                    "${intl.injury7}",
                    "${intl.injury8}",
                    "${intl.injury9}",
                    "${intl.injury10}",
                    "${intl.injury11}",
                    "${intl.injury12}",
                    "${intl.injury13}",
                    "${intl.injury14}",
                    "${intl.injury15}",
                  ],
                  title: '',
                ),
                Dimensions.verticalSpacingSmall,
                Text(
                  intl.dateDebut,
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
                  inputType: InputType.date,
                  hint: '',
                  title: '',
                  controller: dateDebutController, // Pass the controller here
                ),
                Dimensions.verticalSpacingSmall,
                Text(
                  intl.dateFin,
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
                  inputType: InputType.date,
                  hint: '',
                  title: '',
                  controller: dateFinController, // Pass the controller here
                ),
                Dimensions.verticalSpacingLarge,
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      padding: Dimensions.paddingExtraLarge,
      decoration: BoxDecoration(
        color: AppColors.secondaryBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -3),
          )
        ],
      ),
      child: CustomButton(
        text: intl.save,
        width: MediaQuery.of(context).size.width * 0.18,
        onPressed: submit,
      ),
    );
  }
}
