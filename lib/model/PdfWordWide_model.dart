
import 'package:pedagogue/model/base_model.dart';

class PdfWorldWide  extends BaseModel{
  int? id;
  String? pdf;
  String? name;
  String? createdAt; // Assuming these can be null based on your JSON
  String? updatedAt;

  PdfWorldWide({
     this.id,
    this.pdf,
     this.name,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create an instance of PdfWorldWide from a JSON map
  factory PdfWorldWide.fromJson(Map<String, dynamic> json) => PdfWorldWide(
    id: json['id'],
    pdf: json['pdf'],
    name: json['name'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  // Method to convert an instance of PdfWorldWide to a JSON map
  Map<String, dynamic> toJson() => {
    'id': id,
    'pdf': pdf,
    'name': name,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

// Example of using PdfWorldWide.fromJson
var pdfExample = PdfWorldWide.fromJson({
  "id": 1009,
  "pdf": "https://example.com/pdf1.pdf",
  "name": "Example PDF 1",
  "created_at": null,
  "updated_at": null,
});

// Example of using toJson
Map<String, dynamic> pdfJson = pdfExample.toJson();
