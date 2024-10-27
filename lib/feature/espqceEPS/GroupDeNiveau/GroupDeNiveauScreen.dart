import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';

// Model for a student
class Student {
  String? name;
  Student({this.name});
}

// Model for a group
class Group {
  String name;
  List<Student> students;
  Group({required this.name, required this.students});
}

class GroupNiveauScreen extends StatefulWidget {
  @override
  _GroupNiveauScreenState createState() => _GroupNiveauScreenState();
}

class _GroupNiveauScreenState extends State<GroupNiveauScreen> {
  late List<Group> groups;

  @override
  void initState() {
    super.initState();
    // Initialize with six groups, each potentially containing some students
    groups = List.generate(
        6, (index) => Group(name: '${intl.group} ${index + 1}', students: []));
  }

  void addStudentToGroup(Group group) {
    TextEditingController studentNameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(intl.addStudent),
        content: TextField(
          controller: studentNameController,
          decoration: InputDecoration(hintText: intl.enterstudentname),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(intl.cancel),
          ),
          TextButton(
            onPressed: () {
              if (studentNameController.text.isNotEmpty) {
                setState(() {
                  group.students.add(Student(name: studentNameController.text));
                });
                Navigator.of(context).pop();
              }
            },
            child: Text(intl.add),
          ),
        ],
      ),
    ).then((_) => studentNameController
        .dispose()); // Dispose controller after dialog is closed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.groupedeniveaux),
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: groups[index].name,
                  onFieldSubmitted: (val) {
                    setState(() {
                      groups[index].name = val;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: intl.groupName,
                    border: OutlineInputBorder(),
                  ),
                ),
                ...groups[index].students.map((student) => ListTile(
                      title: Text(student.name ??
                          intl.unnamedStudent), // Handle null names
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    child: Text(intl.addStudent),
                    onPressed: () => addStudentToGroup(groups[index]),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
