import 'package:pedagogue/model/base_model.dart';

class User extends BaseModel {
  String? firstName;
  String? lastName;
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
  String? emailVerifiedAt;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  bool? isOnline;

  get fullName => '${firstName ?? ''} ${lastName ?? ''}';

  User({
    int? id,
    this.firstName,
    this.lastName,
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
    this.emailVerifiedAt,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  }) {
    this.id = id;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      image: json['image'],
      sex: json['sex'],
      birthdate: json['birthdate'],
      birthplace: json['birthplace'],
      mobile: json['mobile'],
      address: json['address'],
      country: json['country'],
      zipCode: json['zip_code'],
      city: json['city'],
      emailVerifiedAt: json['email_verified_at'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
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
      'email_verified_at': emailVerifiedAt,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
