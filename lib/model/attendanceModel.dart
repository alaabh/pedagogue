// attendanceModel.dart
class StudentAttendance {
  final String studentName;
  final List<String> sessions; // Change List<bool> to List<String>

  StudentAttendance(this.studentName, this.sessions);
}

class Session {
  final String sessionName;
  final List<StudentAttendance> studentAttendances;

  Session(this.sessionName, this.studentAttendances);
}

class Attendance {
  final String month;
  final int semester;
  final List<Session> sessions;

  Attendance(this.month, this.semester, this.sessions);
}
