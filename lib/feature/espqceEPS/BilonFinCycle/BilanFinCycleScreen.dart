import 'package:flutter/material.dart';
import '../../../controller/bilan_fin_decycle_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/bilan_fin_decycle_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class BilanFinCycleScreen extends StatefulWidget {
  final BilanFinCycle? bilanFinCycle;
  const BilanFinCycleScreen({super.key, this.bilanFinCycle});

  @override
  State<BilanFinCycleScreen> createState() => _BilanFinCycleScreenState();
}

class _BilanFinCycleScreenState extends State<BilanFinCycleScreen> {
  TextEditingController valueController = TextEditingController();
  final BilanFinCycleController bilanFinCycleController =
      BilanFinCycleController();
  @override
  void initState() {

    super.initState();
  }

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    BilanFinCycle bilanFinCycleToUpdate = BilanFinCycle(
      userId: widget.bilanFinCycle!.id,
      value1: valueController.text,
    );
    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.bilanFinCycle != null
          ? bilanFinCycleController.update(bilanFinCycleToUpdate)
          : bilanFinCycleController.add(bilanFinCycleToUpdate),
      successFunction: () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( intl.listedesbilansdufindecycle),
      ),      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: valueController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0), // Adjust padding as needed
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust border radius as needed
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildSubmitButton()
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
