import 'package:pedagogue/utils/base_controller.dart';
import '../model/report.dart';
import '../utils/service/base_service.dart';
import '../utils/service/report_service.dart';

class ReportController extends BaseController<Report> {
  @override
  BaseService<Report>? get service => ReportService.instance;
}
