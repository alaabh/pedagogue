import '../model/PdfArab_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/pdfArab_service.dart';

class PdfArabController extends BaseController<PdfArab> {
  @override
  BaseService<PdfArab>? get service => PdfArabService.instance;
}
