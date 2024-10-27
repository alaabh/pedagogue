import 'base_model.dart';

class FichePedagogue extends BaseModel {
  final int? id;
  final dynamic? value1;
  final dynamic? value2;
  final dynamic? value3;
  final dynamic? value4;
  final dynamic? value5;
  final dynamic? value6;
  final dynamic? value7;
  final dynamic? value8;
  final dynamic? value9;
  final dynamic? value10;
  final dynamic? value11;
  final dynamic? value12;
  final dynamic? value13;
  final dynamic? value14;
  final dynamic? value15;
  final dynamic? value16;
  final dynamic? value17;
  final dynamic? value18;
  final dynamic? userId;
  final dynamic? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  FichePedagogue({
    this.id,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
    this.value6,
    this.value7,
    this.value8,
    this.value9,
    this.value10,
    this.value11,
    this.value12,
    this.value13,
    this.value14,
    this.value15,
    this.value16,
    this.value17,
    this.value18,
    this.userId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory FichePedagogue.fromJson(Map<String, dynamic> json) {
    return FichePedagogue(
      id: json['id'] as int?,
      value1: json['value1'] as dynamic?,
      value2: json['value2'] as dynamic?,
      value3: json['value3'] as dynamic?,
      value4: json['value4'] as dynamic?,
      value5: json['value5'] as dynamic?,
      value6: json['value6'] as dynamic?,
      value7: json['value7'] as dynamic?,
      value8: json['value8'] as dynamic?,
      value9: json['value9'] as dynamic?,
      value10: json['value10'] as dynamic?,
      value11: json['value11'] as dynamic?,
      value12: json['value12'] as dynamic?,
      value13: json['value13'] as dynamic?,
      value14: json['value14'] as dynamic?,
      value15: json['value15'] as dynamic?,
      value16: json['value16'] as dynamic?,
      value17: json['value17'] as dynamic?,
      value18: json['value18'] as dynamic?,
      userId: json['user_id'] as dynamic?,
      deletedAt: json['deleted_at'],
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
      'value1': value1,
      'value2': value2,
      'value3': value3,
      'value4': value4,
      'value5': value5,
      'value6': value6,
      'value7': value7,
      'value8': value8,
      'value9': value9,
      'value10': value10,
      'value11': value11,
      'value12': value12,
      'value13': value13,
      'value14': value14,
      'value15': value15,
      'value16': value16,
      'value17': value17,
      'value18': value18,
      'user_id': userId,
      'deleted_at': deletedAt,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
