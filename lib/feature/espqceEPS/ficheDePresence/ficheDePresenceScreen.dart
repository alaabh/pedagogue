import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';

class Attendance {
  String month;
  int index;
  List<Session> sessions;
  Attendance(this.month, this.index, this.sessions);
}

class Session {
  String sessionName;
  List<StudentAttendance> studentAttendances;
  Session(this.sessionName, this.studentAttendances);
}

class StudentAttendance {
  String studentName;
  List<String> sessions;
  StudentAttendance(this.studentName, this.sessions);
}

class FicheDePresenceScreen extends StatefulWidget {
  @override
  _FicheDePresenceScreenState createState() => _FicheDePresenceScreenState();
}

class _FicheDePresenceScreenState extends State<FicheDePresenceScreen> {
  final List<String> months = [
    intl.january,
    intl.february,
    intl.march,
    intl.april,
    intl.may,
    intl.june,
    intl.july,
    intl.august,
    intl.september,
    intl.october,
    intl.november,
    intl.december
  ];

  late List<Attendance> attendanceData;

  @override
  void initState() {
    super.initState();
    // Initialize attendance data with dummy sessions and student attendances
    attendanceData = List.generate(12, (index) {
      return Attendance(months[index], index + 1, [
        Session('Session Name', []),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.ficheDePresence),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int monthIndex = 0;
                monthIndex < attendanceData.length;
                monthIndex++)
              Card(
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${intl.month}: ${attendanceData[monthIndex].month}', // Corrected string interpolation
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      for (var session in attendanceData[monthIndex].sessions)
                        StudentAttendanceTable(
                            session: session,
                            onAddRow: () {
                              // This callback is now empty, as the state update logic is moved inside the widget
                            }),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget StudentAttendanceTable(
      {required Session session, required Function() onAddRow}) {
    TextEditingController newStudentController = TextEditingController();

    // Function to update a student's attendance status for a session
    void _updateStudentAttendance(StudentAttendance studentAttendance,
        String newValue, int sessionIndex) {
      setState(() {
        studentAttendance.sessions[sessionIndex] = newValue;
      });
    }

    return Table(
      border: TableBorder.all(),
      columnWidths: const {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
        4: FlexColumnWidth(),
        5: IntrinsicColumnWidth()
      },
      children: [
        TableRow(
          children: [
            TableCell(child: Center(child: Text(intl.student))),
            for (int i = 1; i <= 4; i++)
              TableCell(
                  child: Center(
                child: Text('${intl.session} $i'),
              )),
            TableCell(
                child:
                    SizedBox.shrink()), // Placeholder for the '+' button cell
          ],
        ),
        for (var studentAttendance in session.studentAttendances)
          TableRow(
            children: [
              TableCell(
                  child: Center(child: Text(studentAttendance.studentName))),
              for (int i = 0; i < 4; i++)
                TableCell(
                  child: Center(
                    child: DropdownButton<String>(
                      value: studentAttendance.sessions.length > i
                          ? studentAttendance.sessions[i]
                          : 'A',
                      onChanged: (newValue) {
                        _updateStudentAttendance(
                            studentAttendance, newValue!, i);
                      },
                      items: <String>['A', 'D', 'P']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              TableCell(child: SizedBox.shrink()),
            ],
          ),
        TableRow(
          children: [
            TableCell(
              child: Center(
                child: TextField(
                  controller: newStudentController,
                  decoration: InputDecoration(
                    hintText: intl.enterstudentname,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            for (int i = 1; i <= 4; i++) TableCell(child: SizedBox.shrink()),
            TableCell(
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    String newStudentName = newStudentController.text.trim();
                    if (newStudentName.isNotEmpty) {
                      setState(() {
                        session.studentAttendances.add(StudentAttendance(
                            newStudentName,
                            List.filled(4, 'A'))); // Initialize with 'A'
                        newStudentController.clear();
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
