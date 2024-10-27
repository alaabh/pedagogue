import 'package:flutter/material.dart';

import '../../../controller/joueurPresence_controller.dart';
import '../../../controller/joueur_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/JoueurPresence_model.dart';
import '../../../shared/Widget/custom_button.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../shared/widget/loading_widget.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class createPresencePlyer extends StatefulWidget {
  final JoueurPresence? joueurPresence;

  const createPresencePlyer({super.key, this.joueurPresence});

  @override
  State<createPresencePlyer> createState() => _createPresencePlyerState();
}

class _createPresencePlyerState extends State<createPresencePlyer> {
  final _formKey = GlobalKey<FormState>();
  final JoueurPresenceController joueurPresenceController =
      JoueurPresenceController();

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    JoueurPresence joueurPresence = JoueurPresence(
      id: widget.joueurPresence!.id,
      type_ar: _joueurController.text,
      startDatePresence: DateTime.parse(_dateDebutController.text),
      endDatePresence: DateTime.parse(_dateFinController.text),
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.joueurPresence != null
          ? joueurPresenceController.update(joueurPresence)
          : joueurPresenceController.add(joueurPresence),
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
      appBar: AppBar(title: Text('${intl.createPlayer}')),
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
                CustomInput(
                  controller: _susponsionController,
                  title: "${intl.typePresence} *",
                  hint: "${intl.typePresence} *",
                  inputType: InputType.dropdown,
                  dropdownItems: [
                    "${intl.typePresence1}",
                    "${intl.typePresence2}",
                    "${intl.typePresence3}",
                    "${intl.typePresence4}",
                  ],
                ),
                Dimensions.verticalSpacingSmall,
                CustomInput(
                    hint: '${intl.dateDebut} *',
                    title: '${intl.dateDebut} *',
                    controller: _dateDebutController,
                    inputType: InputType.date),
                Dimensions.verticalSpacingSmall,
                Dimensions.verticalSpacingSmall,
                CustomInput(
                    hint: '${intl.dateFin} *',
                    title: '${intl.dateFin} *',
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
