import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/Widget/custom_button.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';

class RapportStageScreen extends StatefulWidget {
  const RapportStageScreen({Key? key}) : super(key: key);

  @override
  State<RapportStageScreen> createState() => _RapportStageScreenState();
}

class _RapportStageScreenState extends State<RapportStageScreen> {

  final _formKey = GlobalKey<FormState>();
  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(title: Text(intl.rapportdustage),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Adds padding around the column
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle(intl.introduction),
              buildTextField(),
              const SizedBox(height: 10),
              buildSectionTitle(intl.lespremierscontact),
              buildSubsectionTitle(intl.lecontact),
              buildTextField(),
              const SizedBox(height: 10),
              buildSubsectionTitle(intl.conseiller),
              buildTextField(),
              const SizedBox(height: 10),
              buildSubsectionTitle(intl.lecontactavec),
              buildTextField(),
              const SizedBox(height: 10),
              buildSectionTitle(intl.lescomportements),
              buildSubsectionTitle(intl.lespointstravail),
              buildSubsectionTitle(intl.lesdifficultesrencontrees),
              buildTextField(),
              buildSubsectionTitle(intl.lessolutionsproposes),
              buildTextField(),
              buildSectionTitle(intl.rapportDe),
              buildTextField(),
              buildSubsectionTitle(intl.planAffecti),
              buildTextField(),
              buildSubsectionTitle(intl.planSensorimoteur),
              buildTextField(),
              buildSubsectionTitle(intl.problmeorganisation),
              buildTextField(),
              Dimensions.verticalSpacingHuge,
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildSectionTitle(String title) => Text(title, style: Theme.of(context).textTheme.headline6);

  Widget buildSubsectionTitle(String title) => Text(title, style: Theme.of(context).textTheme.subtitle1);



  Widget buildTextField() {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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

