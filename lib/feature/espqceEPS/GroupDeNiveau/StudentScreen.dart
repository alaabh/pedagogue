import 'package:flutter/material.dart';
import 'package:pedagogue/model/groupNiveau_model.dart';

import '../../../l10n/localization.dart';  // Adjust the import to ensure it's correct

class StudentScreen extends StatefulWidget {
  final Group group;

  StudentScreen({required this.group});

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  TextEditingController studentNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  void addStudent() {
    if (studentNameController.text.isNotEmpty && imageUrlController.text.isNotEmpty) {
      setState(() {
        widget.group.students.add(Student(name: studentNameController.text, imageUrl: imageUrlController.text));
        studentNameController.clear();
        imageUrlController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.groupedeniveaux),
      ),
      body: Column(
        children: [
          // TextField for student name
          TextField(
            controller: studentNameController,
            decoration: InputDecoration(
              labelText: 'Student Name',
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: addStudent,
              ),
            ),
          ),
          // TextField for image URL
          TextField(
            controller: imageUrlController,
            decoration: InputDecoration(
              labelText: 'Image URL',
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: addStudent,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.group.students.length,
              itemBuilder: (context, index) {
                var student = widget.group.students[index];
                return ListTile(
               //   leading: student.imageUrl.isNotEmpty ? Image.network(student.imageUrl, width: 50, height: 50) : null,
                  title: Text(student.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
