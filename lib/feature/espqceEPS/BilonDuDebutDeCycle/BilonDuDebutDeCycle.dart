import 'package:flutter/material.dart';
import 'package:pedagogue/model/bilanDebutCycleModel.dart';
import '../../../controller/bilanDebutCycle_controller.dart';
import '../../../l10n/localization.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class BilanDebutDeCycleScreen extends StatefulWidget {
  final BilanDebutCycle? bilanDebutCycle;
  BilanDebutDeCycleScreen({Key? key, this.bilanDebutCycle}) : super(key: key);

  @override
  _BilanDebutDeCycleScreenState createState() =>
      _BilanDebutDeCycleScreenState();
}

class _BilanDebutDeCycleScreenState extends State<BilanDebutDeCycleScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController studentAssessmentController = TextEditingController();
  TextEditingController studentBehaviorsController = TextEditingController();
  TextEditingController difficultiesController = TextEditingController();
  TextEditingController conclusionController = TextEditingController();
  final BilanDebutCycleController bilanDebutCycleController = BilanDebutCycleController();

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    BilanDebutCycle bilanDebutCycleToUpdate = BilanDebutCycle(
      value1: studentAssessmentController.text,
      value2: studentBehaviorsController.text,
      value3: difficultiesController.text,
      value4: conclusionController.text,
    );
    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.bilanDebutCycle != null
          ? bilanDebutCycleController.update(bilanDebutCycleToUpdate)
          : bilanDebutCycleController.add(bilanDebutCycleToUpdate),
      successFunction: () => Navigator.pop(context),
    );
  }

  @override
  void initState() {
    super.initState();


    if (widget.bilanDebutCycle != null) {
      studentAssessmentController.text = widget.bilanDebutCycle!.value1  ?? '';
      studentBehaviorsController.text = widget.bilanDebutCycle!.value2  ?? '';
      difficultiesController.text = widget.bilanDebutCycle!.value3  ?? '';
      conclusionController.text = widget.bilanDebutCycle!.value4 ?? '';
    
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.bilanDebutDeCycle),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(intl.evaluationEleves),
                TextField(
                  controller: studentAssessmentController,
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
                Text(intl.comportementseleves),
                TextField(
                  controller: studentBehaviorsController,
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
                Text(intl.difficultes),
                TextField(
                  controller: difficultiesController,
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
                Text(intl.conclusion),
                TextField(
                  controller: conclusionController,
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(child: _buildSubmitButton()),
                )
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

