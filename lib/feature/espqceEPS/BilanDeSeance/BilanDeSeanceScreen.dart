import 'package:flutter/material.dart';

import '../../../controller/bilanSeance_controlle.dart';
import '../../../l10n/localization.dart';
import '../../../model/BilanSeance_model.dart';
import '../../../shared/Widget/custom_button.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class BilanSeancescreen extends StatefulWidget {
  final BilanSeance? bilanSeance;
  const BilanSeancescreen({Key? key, this.bilanSeance}) : super(key: key);

  @override
  State<BilanSeancescreen> createState() => _BilanSeancescreenState();
}

class _BilanSeancescreenState extends State<BilanSeancescreen> {
  final BilanSeanceController bilanSeanceController = BilanSeanceController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController valeur1Controller = TextEditingController();
  TextEditingController valeur2Controller = TextEditingController();
  TextEditingController valeur3Controller = TextEditingController();
  TextEditingController valeur4Controller = TextEditingController();
  TextEditingController valeur5Controller = TextEditingController();

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    BilanSeance bilanSeance = BilanSeance(
      id: widget.bilanSeance!.id,
      value1: valeur1Controller.text,
      value2: valeur2Controller.text,
      value3: valeur3Controller.text,
      value4: valeur4Controller.text,
      value5: valeur5Controller.text,
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.bilanSeance != null
          ? bilanSeanceController.update(bilanSeance)
          : bilanSeanceController.add(bilanSeance),
      successFunction: () => Navigator.pop(context),
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.bilanSeance != null) {
      valeur1Controller.text = widget.bilanSeance!.value1 ?? '';
      valeur2Controller.text = widget.bilanSeance!.value2 ?? '';
      valeur3Controller.text = widget.bilanSeance!.value3 ??
          ''; // Assuming 'prenom' is a field in your 'Player' model
      valeur4Controller.text = widget.bilanSeance!.value4 ??
          ''; // Assuming 'nom' is a field in your 'Player' model
      valeur5Controller.text = widget.bilanSeance!.value5 ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.bilanDeSeance),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              intl.classe,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextField(
              hintText: ' ',
              labelText: intl.classe,
              controller: valeur1Controller, // Pass the controller here
            ),
            SizedBox(height: 20.0),
            Text(
              intl.cycle,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextField(
              hintText: ' ',
              labelText: intl.cycle,
              controller: valeur2Controller, // Pass the controller here
            ),
            SizedBox(height: 20.0),
            Text(
              intl.date,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextField(
              hintText: ' ',
              labelText: intl.date,
              controller: valeur3Controller, // Pass the controller here
            ),
            SizedBox(height: 20.0),
            Text(
              intl.session,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextField(
              hintText: ' ',
              labelText: intl.session,
              controller: valeur4Controller, // Pass the controller here
            ),
            SizedBox(height: 20.0),
            Dimensions.verticalSpacingHuge,
            _buildSubmitButton(),
          ],
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
