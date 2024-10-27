import '../../constants/env.dart';
import '../../model/PdfArab_model.dart';
import 'base_service.dart';

class PdfArabService extends BaseService<PdfArab> {
  PdfArabService._();

  static final PdfArabService instance = PdfArabService._();

  factory PdfArabService() => instance;

  @override
  String apiUrl = '$baseUrl/documents_eps';

  @override
  Function? get fromJsonFunction => PdfArab.fromJson;

  @override
  Function(PdfArab pdfArab)? get toJsonFunction => (PdfArab pdfArab) => pdfArab.toJson();
}
