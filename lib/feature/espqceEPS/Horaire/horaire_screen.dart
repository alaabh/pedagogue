import 'package:flutter/material.dart';
import 'package:pedagogue/controller/emploi_controller.dart';
import 'package:pedagogue/model/emploi.dart';

import '../../../l10n/localization.dart';
import '../../../shared/Widget/custom_button.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';

class HoraireScreen extends StatefulWidget {
  final Emploi? emploi;
  final Future<void> Function({int? param})? reloadDataFunction;

  HoraireScreen({
    Key? key,
    this.emploi,
    this.reloadDataFunction,
  }) : super(key: key);

  @override
  _HoraireScreenState createState() => _HoraireScreenState();
}

class _HoraireScreenState extends State<HoraireScreen> {
  late List<List<TextEditingController>> controllers;
  late List<List<FocusNode>> focusNodes;

  final List<String> hours = [
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17'
  ];
  final List<String> days = [
    intl.monday,
    intl.tuesday,
    intl.wednesday,
    intl.thursday,
    intl.friday,
    intl.saturday,
  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EmploiController emploiController = EmploiController();

  Emploi constructEmploiFromControllers() {
    return Emploi(
      id: widget.emploi?.id,
      userId: widget.emploi?.userId ?? 0,
      lundi1: controllers[0][0].text,
      lundi2: controllers[0][1].text,
      lundi3: controllers[0][2].text,
      lundi4: controllers[0][3].text,
      lundi5: controllers[0][4].text,
      lundi6: controllers[0][5].text,
      lundi7: controllers[0][6].text,
      lundi8: controllers[0][7].text,
      mardi1: controllers[1][0].text,
      mardi2: controllers[1][1].text,
      mardi3: controllers[1][2].text,
      mardi4: controllers[1][3].text,
      mardi5: controllers[1][4].text,
      mardi6: controllers[1][5].text,
      mardi7: controllers[1][6].text,
      mardi8: controllers[1][7].text,
      mercredi1: controllers[2][0].text,
      mercredi2: controllers[2][1].text,
      mercredi3: controllers[2][2].text,
      mercredi4: controllers[2][3].text,
      mercredi5: controllers[2][4].text,
      mercredi6: controllers[2][5].text,
      mercredi7: controllers[2][6].text,
      mercredi8: controllers[2][7].text,
      jeudi1: controllers[3][0].text,
      jeudi2: controllers[3][1].text,
      jeudi3: controllers[3][2].text,
      jeudi4: controllers[3][3].text,
      jeudi5: controllers[3][4].text,
      jeudi6: controllers[3][5].text,
      jeudi7: controllers[3][6].text,
      jeudi8: controllers[3][7].text,
      vendredi1: controllers[4][0].text,
      vendredi2: controllers[4][1].text,
      vendredi3: controllers[4][2].text,
      vendredi4: controllers[4][3].text,
      vendredi5: controllers[4][4].text,
      vendredi6: controllers[4][5].text,
      vendredi7: controllers[4][6].text,
      vendredi8: controllers[4][7].text,
      samedi1: controllers[5][0].text,
      samedi2: controllers[5][1].text,
      samedi3: controllers[5][2].text,
      samedi4: controllers[5][3].text,
      samedi5: controllers[5][4].text,
      samedi6: controllers[5][5].text,
      samedi7: controllers[5][6].text,
      samedi8: controllers[5][7].text,
    );
  }

  Future<void> submit() async {
    // Assuming validation and focus logic as before
    Emploi emploiToUpdate = constructEmploiFromControllers();

    print(
        "Submitting data: ${emploiToUpdate.toJson()}"); // Ensure toJson is properly implemented

    try {
      var response = await (widget.emploi != null
          ? emploiController.update(emploiToUpdate)
          : emploiController.add(emploiToUpdate));
      Navigator.pop(context);
      widget.reloadDataFunction!(param: 3);
      print(
          "API Response valide : $response"); // Print the response for debugging
    } catch (e) {
      print("Error during API call: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    initializeControllers();
    focusNodes = List.generate(
        days.length, (j) => List.generate(hours.length, (i) => FocusNode()));
  }

  void initializeControllers() {
    controllers = List.generate(
      days.length, // Number of rows
      (_) => List.generate(hours.length,
          (_) => TextEditingController()), // Number of columns per row
    );
  }

  @override
  void dispose() {
    for (var row in controllers) {
      for (var controller in row) {
        controller.dispose();
      }
    }
    super.dispose();
    for (var row in focusNodes) {
      for (var focusNode in row) {
        focusNode.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.emploiduTemps),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(3),
                4: FlexColumnWidth(2),
                5: FlexColumnWidth(2),
                6: FlexColumnWidth(2),
              },
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(child: Container()), // Empty corner cell
                    ...days
                        .map((day) => TableCell(
                              child: Center(
                                  child: Text(
                                day,
                                style: TextStyle(fontSize: 12),
                              )),
                            ))
                        .toList(),
                  ],
                ),
                ...List<TableRow>.generate(
                  hours.length,
                  (i) => TableRow(
                    children: [
                      TableCell(
                        child: Center(child: Text(hours[i])),
                      ),
                      ...List<Widget>.generate(
                        days.length,
                        (j) => TableCell(
                          child: TextFormField(
                            controller: controllers[j][i],
                            focusNode: focusNodes[j][i],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            minLines: 1,
                            maxLines: focusNodes[j][i].hasFocus ? 5 : 1,
                            onTap: () {
                              _showTextDialog(controllers[j][i].text, context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

void _showTextDialog(String text, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Text Content'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(text),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
