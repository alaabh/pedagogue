import 'package:pedagogue/model/report.dart';

import '../../constants/env.dart';
import 'base_service.dart';

class ReportService extends BaseService<Report> {
  ReportService._();

  static final ReportService instance = ReportService._();

  factory ReportService() => instance;

  @override
  String apiUrl = '$baseUrl/reports';

  @override
  Function? get fromJsonFunction => Report.fromJson;

  @override
  Function(Report report)? get toJsonFunction =>
      (Report report) => report.toJson();
}
