import 'base_model.dart';

class Player extends BaseModel {
  int? id;
  String? firstName;
  String? lastName;
  String? post_en;
  String? post_ar;
  String? post_fr;
  String? numberGarment;
  String? email;
  String? image;
  String? sex;
  String? birthdate;
  String? birthplace;
  String? mobile;
  String? address;
  String? country;
  String? zipCode;
  String? city;
  String? size;
  String? weight;
  String? mutation_en;
  String? mutation_ar;
  String? mutation_fr;
  String? situation_family_en;
  String? situation_family_ar;
  String? situation_family_fr;
  String? situation_professionel_en;
  String? situation_professionel_ar;
  String? situation_professionel_fr;
  String? fadherFirstName;
  String? motherFirstName;
  String? fadherLastName;
  String? motherLastName;
  String? best_foot_en;
  String? best_foot_ar;
  String? best_foot_fr;
  int? userId;
  String? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Player({
    this.id,
    this.firstName,
    this.lastName,
    this.post_en,
    this.post_ar,
    this.post_fr,
    this.numberGarment,
    this.email,
    this.image,
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
    this.mutation_en,
    this.mutation_ar,
    this.mutation_fr,
    this.situation_family_en,
    this.situation_family_ar,
    this.situation_family_fr,
    this.situation_professionel_en,
    this.situation_professionel_ar,
    this.situation_professionel_fr,
    this.fadherFirstName,
    this.motherFirstName,
    this.fadherLastName,
    this.motherLastName,
    this.userId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.best_foot_en,
    this.best_foot_ar,
    this.best_foot_fr,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      post_en: json['post_en'] as String?,
      post_ar: json['post_ar'] as String?,
      post_fr: json['post_fr'] as String?,
      numberGarment: json['number_garment'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      sex: json['sex'] as String?,
      birthdate: json['birthdate'] as String?,
      birthplace: json['birthplace'] as String?,
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      zipCode: json['zip_code'] as String?,
      city: json['city'] as String?,
      size: json['size'] as String?,
      weight: json['weight'] as String?,
      mutation_en: json['mutation_en'] as String?,
      mutation_ar: json['mutation_ar'] as String?,
      mutation_fr: json['mutation_fr'] as String?,
      situation_family_en: json['situation_family_en'] as String?,
      situation_family_ar: json['situation_family_ar'] as String?,
      situation_family_fr: json['situation_family_fr'] as String?,
      situation_professionel_en: json['situation_professionel_en'] as String?,
      situation_professionel_ar: json['situation_professionel_ar'] as String?,
      situation_professionel_fr: json['situation_professionel_fr'] as String?,
      fadherFirstName: json['fadher_firstName'] as String?,
      motherFirstName: json['mother_firstName'] as String?,
      fadherLastName: json['fadher_lastName'] as String?,
      motherLastName: json['mother_lastName'] as String?,
      best_foot_en: json['mother_lastName'] as String?,
      best_foot_ar: json['mother_lastName'] as String?,
      best_foot_fr: json['mother_lastName'] as String?,
      userId: json['user_id'] as int?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'post_en': post_en,
      'post_ar': post_ar,
      'post_fr': post_fr,
      'number_garment': numberGarment,
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
      'mutation_en': mutation_en,
      'mutation_ar': mutation_ar,
      'mutation_fr': mutation_fr,
      'situation_family': situation_family_en,
      'situation_family_ar': situation_family_ar,
      'situation_family_fr': situation_family_fr,
      'situation_professionel_en': situation_professionel_en,
      'situation_professionel_ar': situation_professionel_ar,
      'situation_professionel_fr': situation_professionel_fr,
      'fadher_firstName': fadherFirstName,
      'mother_firstName': motherFirstName,
      'fadher_lastName': fadherLastName,
      'mother_lastName': motherLastName,
      'user_id': userId,
      'deleted_at': deletedAt,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
