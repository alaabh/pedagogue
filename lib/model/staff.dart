import 'package:pedagogue/model/base_model.dart';
import 'package:pedagogue/utils/json_utils.dart';

import '../l10n/localization.dart';

class Staff extends BaseModel {
  StaffType? staffType;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  String? sex;
  DateTime? birthdate;
  String? birthplace;
  String? mobile;
  String? address;
  String? country;
  String? zipCode;
  String? city;

  get fullName => firstName == null && lastName == null
      ? null
      : '${firstName ?? ''} ${lastName ?? ''}';

  Staff({
    int? id,
    this.staffType,
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
  }) {
    this.id = id;
  }

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: JsonUtils.attribute(json['id']),
      staffType: JsonUtils.staffType(json['post']),
      firstName: JsonUtils.attribute(json['firstName']),
      lastName: JsonUtils.attribute(json['lastName']),
      email: JsonUtils.attribute(json['email']),
      image: JsonUtils.attribute(json['image']),
      sex: JsonUtils.attribute(json['sex']),
      birthdate: JsonUtils.dateFromString(json['birthdate']),
      birthplace: JsonUtils.attribute(json['birthplace']),
      mobile: JsonUtils.attribute(json['mobile']),
      address: JsonUtils.attribute(json['address']),
      country: JsonUtils.attribute(json['country']),
      zipCode: JsonUtils.attribute(json['zip_code']),
      city: JsonUtils.attribute(json['city']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'post': staffType?.value,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'sex': sex,
      'birthdate': JsonUtils.toStringDate(birthdate),
      'birthplace': birthplace,
      'mobile': mobile,
      'address': address,
      'country': country,
      'zip_code': zipCode,
      'city': city,
    };
  }
}

enum StaffType {
  coach('coach'),
  assistant('assistant'),
  director('directeur'),
  doctor('doctor'),
  administrative('administratif'),
  delegate('delegue'),
  fitness('fitness'),
  goalkeeper('goalkeeper'),
  material('materiel'),
  nutritionist('nutritonist'),
  physiotherapist('phisios'),
  statistician('staticien');

  final String value;

  const StaffType(this.value);
}

extension StaffTypeExtension on StaffType {
  String get localizedValue {
    switch (this) {
      case StaffType.coach:
        return intl.coach;
      case StaffType.assistant:
        return intl.assistant;
      case StaffType.director:
        return intl.director;
      case StaffType.doctor:
        return intl.doctor;
      case StaffType.administrative:
        return intl.administrative;
      case StaffType.delegate:
        return intl.delegateValue;
      case StaffType.fitness:
        return intl.fitness;
      case StaffType.goalkeeper:
        return intl.coachgoalkeeper;
      case StaffType.material:
        return intl.material;
      case StaffType.nutritionist:
        return intl.nutritionist;
      case StaffType.physiotherapist:
        return intl.physiotherapist;
      case StaffType.statistician:
        return intl.statistician;
    }
  }
}
