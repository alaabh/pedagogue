import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:pedagogue/controller/season_controller.dart';
import 'package:pedagogue/controller/team_controller.dart';

import '../../../controller/joueurStarting_controller.dart';
import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/PlayerStarting_model.dart';
import '../../../shared/Widget/custom_button.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class CreatingStartingPlayer extends StatefulWidget {
  final PlayerStarting? playerStarting;

  const CreatingStartingPlayer({super.key, this.playerStarting});

  @override
  State<CreatingStartingPlayer> createState() => _CreatingStartingPlayerState();
}

class _CreatingStartingPlayerState extends State<CreatingStartingPlayer> {
  final _formKey = GlobalKey<FormState>();
  final JoueurStartingController joueurStartingController =
      JoueurStartingController();

  late TextEditingController _ListePLayerController;
  late TextEditingController _FirsetTeamontroller;
  late TextEditingController _SecondTeamController;
  late TextEditingController _dateFinController;
  late TextEditingController _SeasonsController;

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    PlayerStarting playerStarting = PlayerStarting(
      id: widget.playerStarting?.id,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.playerStarting != null
          ? joueurStartingController.update(playerStarting)
          : joueurStartingController.add(playerStarting),
      successFunction: () => Navigator.pop(context),
    );
  }

  @override
  void initState() {
    _ListePLayerController = TextEditingController();
    _FirsetTeamontroller = TextEditingController(); // Corrected variable name
    _SecondTeamController = TextEditingController(); // Corrected variable name
    _dateFinController = TextEditingController(); // Corrected variable name
    _SeasonsController = TextEditingController(); // Corrected variable name
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    _ListePLayerController.dispose();
    _FirsetTeamontroller.dispose(); // Corrected variable name
    _SecondTeamController.dispose(); // Corrected variable name
    _dateFinController.dispose(); // Corrected variable name
    _SeasonsController.dispose(); // Corrected variable name
    super.dispose();
  }

  TextEditingController _ListePlayersController = TextEditingController();
  final JoueurController joueur1Controller = JoueurController();
  final SeasonController seasonController = SeasonController();
  final TeamController teamController = TeamController();
  List<String>? seasonList = [];
  List<String>? seasonIdList = [];
  List<String>? teamList = [];
  List<String>? teamIdList = [];
  List<ValueItem> playersList = [];
  bool playerLoader = false;
  Future<void> loadData() async {
    await joueur1Controller.getAll();
    await seasonController.getAll();
    await teamController.getAll();

    setState(() {
      for (var element in joueur1Controller.apiResponse.value.itemList) {
        playersList.add(ValueItem(
            label: element.firstName.toString() +
                " " +
                element.lastName.toString(),
            value: element.id));

        print(element.id);
        print(playersList);
        _ListPlayer1controller.setOptions(playersList);
        _ListPlayer2controller.setOptions(playersList);
      }
    });
    setState(() {
      for (var element in seasonController.apiResponse.value.itemList) {
        seasonList!.add(element.name.toString());
        seasonIdList!.add(element.id.toString());
      }
      print(seasonList);
      print(seasonIdList);
    });
    setState(() {
      for (var element in teamController.apiResponse.value.itemList) {
        teamList!.add(element.name.toString());
        teamIdList!.add(element.id.toString());
      }
      print(teamList);
      print(teamIdList);
    });
    playerLoader = true;
  }

  final MultiSelectController<dynamic> _ListPlayer1controller =
      MultiSelectController();
  final MultiSelectController<dynamic> _ListPlayer2controller =
      MultiSelectController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.createPlayer}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimensions.verticalSpacingSmall,
                Text(intl.season,
                    style: TextStyle(
                      fontSize: 16.0, // Replace with your desired font size
                      color: AppColors.accentColor,
                    )),
                playerLoader != true
                    ? Center(child: LoadingWidget())
                    : CustomInput(
                        inputType: InputType.dropdown,
                        controller: _SeasonsController,
                        dropdownItems: seasonList,
                      ),
                Dimensions.verticalSpacingSmall,
                Text(intl.firstTeam,
                    style: TextStyle(
                      fontSize: 16.0, // Replace with your desired font size
                      color: AppColors.accentColor,
                    )),
                Dimensions.verticalSpacingSmall,
                playerLoader != true
                    ? Center(child: LoadingWidget())
                    : CustomInput(
                        inputType: InputType.dropdown,
                        controller: _FirsetTeamontroller,
                        dropdownItems: teamList,
                      ),
                Dimensions.verticalSpacingSmall,
                Text(intl.player,
                    style: TextStyle(
                      fontSize: 16.0, // Replace with your desired font size
                      color: AppColors.accentColor,
                    )),
                Dimensions.verticalSpacingSmall,
                MultiSelectDropDown(
                  hint: intl.player,
                  controller: _ListPlayer1controller,
                  onOptionSelected: (options) {
                    debugPrint(options.toString());
                  },
                  options: playersList,
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  dropdownHeight: 300,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
                Dimensions.verticalSpacingSmall,
                Text(intl.secondTeam,
                    style: TextStyle(
                      fontSize: 16.0, // Replace with your desired font size
                      color: AppColors.accentColor,
                    )),
                Dimensions.verticalSpacingSmall,
                playerLoader != true
                    ? Center(child: LoadingWidget())
                    : CustomInput(
                        inputType: InputType.dropdown,
                        controller: _SecondTeamController,
                        dropdownItems: teamList,
                      ),
                Dimensions.verticalSpacingSmall,
                Text(intl.player,
                    style: TextStyle(
                      fontSize: 16.0, // Replace with your desired font size
                      color: AppColors.accentColor,
                    )),
                Dimensions.verticalSpacingSmall,
                MultiSelectDropDown(
                  hint: intl.player,
                  controller: _ListPlayer2controller,
                  onOptionSelected: (options) {
                    debugPrint(options.toString());
                  },
                  options: playersList,
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  dropdownHeight: 300,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
                Dimensions.verticalSpacingSmall,
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
        onPressed: submit,
        width: MediaQuery.of(context).size.width * 0.18,
      ),
    );
  }
}
