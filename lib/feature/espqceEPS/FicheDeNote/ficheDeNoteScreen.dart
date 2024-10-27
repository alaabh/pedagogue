import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';

class FicheDeNoteScreen extends StatefulWidget {
  @override
  _FicheDeNoteScreenState createState() => _FicheDeNoteScreenState();
}

class _FicheDeNoteScreenState extends State<FicheDeNoteScreen> {
  List<Trimester> trimesters = [
    Trimester('${intl.quarter} 1', []),
    Trimester('${intl.quarter} 2', []),
    Trimester('${intl.quarter} 3', []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.ficheDeNote),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: trimesters
              .map((trimester) => TrimesterTable(trimester: trimester))
              .toList(),
        ),
      ),
    );
  }
}

class TrimesterTable extends StatefulWidget {
  final Trimester trimester;

  TrimesterTable({required this.trimester});

  @override
  _TrimesterTableState createState() => _TrimesterTableState();
}

class _TrimesterTableState extends State<TrimesterTable> {
  final TextEditingController _newStudentController = TextEditingController();
  final TextEditingController _noteoneController = TextEditingController();
  final TextEditingController _notetwoController = TextEditingController();

  void _addStudent() {
    if (_newStudentController.text.isNotEmpty &&
        _noteoneController.text.isNotEmpty &&
        _notetwoController.text.isNotEmpty) {
      final double? note1 = double.tryParse(_noteoneController.text);
      final double? note2 = double.tryParse(_notetwoController.text);
      if (note1 != null && note2 != null) {
        setState(() {
          widget.trimester.studentGrades.add(StudentGrade(
            studentName: _newStudentController.text,
            note1: note1,
            note2: note2,
          ));
          _newStudentController.clear();
          _noteoneController.clear();
          _notetwoController.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.trimester.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
              },
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(
                        child: Text('${intl.studentName}',
                            textAlign: TextAlign.center)),
                    TableCell(
                        child: Text('${intl.gradeNote} 1',
                            textAlign: TextAlign.center)),
                    TableCell(
                        child: Text('${intl.gradeNote} 2',
                            textAlign: TextAlign.center)),
                    TableCell(
                        child: Text('${intl.moyenne}',
                            textAlign: TextAlign.center)),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 8.0), // Adjust padding as needed
                        decoration: BoxDecoration(),
                        child: TextField(
                          controller: _newStudentController,
                          decoration: InputDecoration(
                            labelText: ' ${intl.studentName}',
                            fillColor: Colors
                                .white, // You can also set fillColor for the TextField for certain themes
                            filled: true, // Enable fillColor to take effect
                            border: InputBorder
                                .none, // Remove underline border from TextField
                            suffixIcon: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: _addStudent,
                            ),
                          ),
                        ),
                      ),
                    ),

                    TableCell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Background color for the text field container
                        ),
                        child: TextField(
                          controller: _noteoneController,
                          decoration: InputDecoration(
                            border: InputBorder
                                .none, // Removes the default underline of the TextField
                          ),
                        ),
                      ),
                    ),

                    TableCell(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: TextField(
                          controller: _notetwoController,
                          decoration: InputDecoration(
                            border: InputBorder
                                .none, // Consistency in appearance by removing the underline
                          ),
                        ),
                      ),
                    ),

                    TableCell(
                        child:
                            Container()), // Moyenne will be calculated based on the grades
                  ],
                ),
                ...widget.trimester.studentGrades.map((studentGrade) {
                  return TableRow(
                    children: [
                      TableCell(child: Text(studentGrade.studentName)),
                      TableCell(
                          child: Text(studentGrade.note1.toString(),
                              textAlign: TextAlign.center)),
                      TableCell(
                          child: Text(studentGrade.note2.toString(),
                              textAlign: TextAlign.center)),
                      TableCell(
                          child: Text(
                              '${studentGrade.moyenne.toStringAsFixed(2)}',
                              textAlign: TextAlign.center)),
                    ],
                  );
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Trimester {
  String name;
  List<StudentGrade> studentGrades;

  Trimester(this.name, this.studentGrades);
}

class StudentGrade {
  String studentName;
  double note1;
  double note2;
  double get moyenne => (note1 + note2) / 2;

  StudentGrade({
    required this.studentName,
    required this.note1,
    required this.note2,
  });
}
