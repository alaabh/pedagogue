import 'dart:convert';

import 'base_model.dart';

class JoueurDessai extends BaseModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? post;
  final String? email;
  final String? image;
  String? numberGarment;
  final String? sex;
  final String? birthdate;
  final String? birthplace;
  final String? mobile;
  final String? address;
  final String? country;
  final String? zipCode;
  final String? city;
  final String? size;
  final String? weight;
  final String? mutation;
  final String? situationFamily;
  final String? situationProfessionel;
  final String? bestFoot;
  final String? fadherFirstName;
  final String? motherFirstName;
  final String? fadherLastName;
  final String? motherLastName;
  final int? userId;
  final String? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  JoueurDessai({
     this.id,
     this.firstName,
     this.lastName,
     this.post,
     this.email,
     this.image,
     this.numberGarment,
     this.sex,
     this.birthdate,
    this.birthplace,
    this.mobile,
    this.address,
    this.country,
    this.zipCode,
    this.city,
    this.size,
    this.weight,
    this.mutation,
    this.situationFamily,
    this.situationProfessionel,
    this.bestFoot,
    this.fadherFirstName,
    this.motherFirstName,
    this.fadherLastName,
    this.motherLastName,
    this.userId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory JoueurDessai.fromJson(Map<String, dynamic> json) {
    return JoueurDessai(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      post: json['post'],
      email: json['email'],
      image: json['image'],
      sex: json['sex'],
      birthdate: json['birthdate'],
      birthplace: json['birthplace'],
      mobile: json['mobile'],
      address: json['address'],
      country: json['country'],
      numberGarment: json['number_garment'] as String?,
      zipCode: json['zip_code'],
      city: json['city'],
      size: json['size'],
      weight: json['weight'],
      mutation: json['mutation'],
      situationFamily: json['situation_family'],
      situationProfessionel: json['situation_professionel'],
      bestFoot: json['best_foot'],
      fadherFirstName: json['fadher_firstName'],
      motherFirstName: json['mother_firstName'],
      fadherLastName: json['fadher_lastName'],
      motherLastName: json['mother_lastName'],
      userId: json['user_id'],
      deletedAt: json['deleted_at'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'post': post,
      'email': email,
      'image': image,
      'sex': sex,
      'birthdate': birthdate,
      'birthplace': birthplace,
      'mobile': mobile,
      'address': address,
      'country': country,
      'zip_code': zipCode,
      'city': city,
      'size': size,
      'weight': weight,
      'number_garment': numberGarment,
      'mutation': mutation,
      'situation_family': situationFamily,
      'situation_professionel': situationProfessionel,
      'best_foot': bestFoot,
      'fadher_firstName': fadherFirstName,
      'mother_firstName': motherFirstName,
      'fadher_lastName': fadherLastName,
      'mother_lastName': motherLastName,
      'user_id': userId,
      'deleted_at': deletedAt,
      'created_at': createdAt?.toIso8601String(), // Corrected assignment
      'updated_at': updatedAt?.toIso8601String(), // Corrected assignment
    };
  }
}
