import '../model/PdfWordWide_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/PdfWordWide_service.dart';
import '../utils/service/base_service.dart';

class PdfWordWideController extends BaseController<PdfWorldWide> {
  @override
  BaseService<PdfWorldWide>? get service => PdfWordWdeService.instance;
}
