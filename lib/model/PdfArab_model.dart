import 'dart:convert';
import 'base_model.dart';

class PdfArab  extends BaseModel{
  int? id;
  String? pdf;
  String? name;
  String? createdAt; // Assuming these can be null based on your JSON
  String? updatedAt;

  PdfArab({
     this.id,
     this.pdf,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory PdfArab.fromJson(Map<String, dynamic> json) {
    return PdfArab(
      id: json['id'] as int,
      pdf: json['pdf'] as String,
      name: json['name'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pdf': pdf,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

// Example usage:
String jsonString = '{"data": [...]}'; // Your JSON string here

// Parsing JSON data into a list of PdfArab
List<PdfArab> pdfListArab = (jsonDecode(jsonString)['data'] as List)
    .map((data) => PdfArab.fromJson(data))
    .toList();

// Converting a PdfArab object to JSON
Map<String, dynamic> pdfToJson = pdfListArab[0].toJson();
