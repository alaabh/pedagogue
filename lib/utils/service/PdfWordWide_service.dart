import '../../constants/env.dart';
import '../../model/PdfWordWide_model.dart';
import 'base_service.dart';

class PdfWordWdeService extends BaseService<PdfWorldWide> {
  PdfWordWdeService._();

  static final PdfWordWdeService instance = PdfWordWdeService._();

  factory PdfWordWdeService() => instance;

  @override
  String apiUrl = '$baseUrl/documents_training';

  @override
  Function? get fromJsonFunction => PdfWorldWide.fromJson;

  @override
  Function(PdfWorldWide pdfWorldWide)? get toJsonFunction => (PdfWorldWide pdfWorldWide) => pdfWorldWide.toJson();
}
