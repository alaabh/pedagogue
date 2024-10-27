import 'package:flutter/material.dart';

import '../../../controller/joueurSuspended_controller.dart';
import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/JoueurSuspendu_model.dart';
import '../../../shared/Widget/custom_button.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/DropdownTextField.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class CreatesusponduJoueur extends StatefulWidget {
  final PlayerSuspended? playerSuspended;

  const CreatesusponduJoueur({super.key, this.playerSuspended});

  @override
  State<CreatesusponduJoueur> createState() => _CreatesusponduJoueurState();
}

class _CreatesusponduJoueurState extends State<CreatesusponduJoueur> {
  final _formKey = GlobalKey<FormState>();
  final JoueurSuspendedController joueurSuspendedController =
      JoueurSuspendedController();

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    PlayerSuspended playerSuspended = PlayerSuspended(
      id: widget.playerSuspended!.id,
      suspension_en: _susponsionController.text,
      startDateSuspension: DateTime.parse(_dateDebutController.text),
      endDateSuspension: DateTime.parse(_dateFinController.text),
      comment: _commentController.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.playerSuspended != null
          ? joueurSuspendedController.update(playerSuspended)
          : joueurSuspendedController.add(playerSuspended),
      successFunction: () => Navigator.pop(context),
    );
  }

  late TextEditingController _joueurController;
  late TextEditingController _susponsionController;
  late TextEditingController _dateDebutController;
  late TextEditingController _dateFinController;
  late TextEditingController _commentController;

  @override
  void initState() {
    loadData();
    _joueurController = TextEditingController();
    _susponsionController = TextEditingController(); // Corrected variable name
    _dateDebutController = TextEditingController(); // Corrected variable name
    _dateFinController = TextEditingController(); // Corrected variable name
    _commentController = TextEditingController(); // Corrected variable name
    super.initState();
  }

  @override
  void dispose() {
    _joueurController.dispose();
    _susponsionController.dispose(); // Corrected variable name
    _dateDebutController.dispose(); // Corrected variable name
    _dateFinController.dispose(); // Corrected variable name
    _commentController.dispose(); // Corrected variable name
    super.dispose();
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
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimensions.verticalSpacingExtraLarge,
                playerLoader != true
                    ? Center(child: LoadingWidget())
                    : CustomInput(
                        inputType: InputType.dropdown,
                        controller: _ListePlayersController,
                        dropdownItems: exerciceList,
                        title: intl.player,
                      ),
                Dimensions.verticalSpacingSmall,
                Text('${intl.suspension}',
                    style: TextStyle(
                      fontSize: 16.0, // Replace with your desired font size
                      color: AppColors.accentColor,
                    )),
                Dimensions.verticalSpacingSmall,
                DropdownTextField(
                  options: [
                    '${intl.suspension1}',
                    '${intl.suspension2}',
                    '${intl.suspension3}',
                  ],
                  hintText: '${intl.suspension}',
                  labelText: '${intl.suspension}',
                ),
                Dimensions.verticalSpacingSmall,
                CustomInput(
                    hint: '${intl.dateDebut} ',
                    title: '${intl.dateDebut} ',
                    controller: _dateDebutController,
                    inputType: InputType.date),
                Dimensions.verticalSpacingSmall,
                CustomInput(
                    hint: '${intl.dateFin} ',
                    title: '${intl.dateFin} ',
                    controller: _dateFinController,
                    inputType: InputType.date),
                Dimensions.verticalSpacingSmall,
                Text('${intl.comments}',
                    style: TextStyle(
                      fontSize: 16.0, // Replace with your desired font size
                      color: AppColors.accentColor,
                    )),
                Dimensions.verticalSpacingSmall,
                CustomTextField(
                  hintText: '${intl.comments}',
                  labelText: '${intl.comments}*',
                  controller: _commentController, // Pass the controller here
                ),
                Dimensions.verticalSpacingSmall,
                _buildSubmitButton(),
                Dimensions.verticalSpacingSmall,
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
