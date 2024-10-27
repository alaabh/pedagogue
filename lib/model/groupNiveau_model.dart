class Group {
  String name;
  List<Student> students;
  String? imageUrl; // Optional image URL for the group

  Group({required this.name, this.students = const [], this.imageUrl});
}

class Student {
  String name;
  String? imageUrl; // Optional image URL for the student

  Student({required this.name, this.imageUrl});
}
