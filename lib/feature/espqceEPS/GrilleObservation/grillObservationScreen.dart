import 'package:flutter/material.dart';

import '../../../controller/observation_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/observation_model.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class GrillObservationScreen extends StatefulWidget {
  final Observation? observation;

  const GrillObservationScreen({Key? key, this.observation}) : super(key: key);

  @override
  _GrillObservationScreenState createState() => _GrillObservationScreenState();
}

class _GrillObservationScreenState extends State<GrillObservationScreen> {
  ObservationController observationController = ObservationController();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    Observation observation = Observation(
      id: widget.observation!.id,
      value1: _textController.text,
      // Example user ID, replace with actual user ID
    );

    ApiViewHandler.withAlert(
      context: context,
      apiCall: widget.observation != null
          ? observationController.update(observation)
          : observationController.add(observation),
      successFunction: () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.griDobservation)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text(intl.submit),
            ),
          ],
        ),
      ),
    );
  }
}
