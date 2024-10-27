import 'dart:io';

import '../base_model.dart';

class TeamManagementModel {
  final File? image1;
  final File? image2;
  final String? image111;
  final String? image222;
  final dynamic comment;

  TeamManagementModel({
    this.image1,
    this.image2,
    this.comment,
    this.image111,
    this.image222,
  });

  factory TeamManagementModel.fromJson(Map<String, dynamic> json) {
    return TeamManagementModel(
      image111: json['image1'],
      comment: json['comment'],
      image222: json['image2'],
    );
  }
 

  Map<String, dynamic> toJson() {
    return {
      'image1': image1,
      'image2': image2,
      'comment': comment,
    };
  }
}
