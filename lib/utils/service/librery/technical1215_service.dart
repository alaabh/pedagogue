import '../../../constants/env.dart';
import '../../../model/library/technial1215years.dart';
import '../base_service.dart';

class Technical1215Service extends BaseService<Technical1215> {
  Technical1215Service._();

  static final Technical1215Service instance = Technical1215Service._();

  factory Technical1215Service() => instance;

  @override
  String apiUrl = '$baseUrl/technical_12_15_years';

  @override
  Function? get fromJsonFunction => Technical1215.fromJson;

  @override
  Function(Technical1215 technical1215)? get toJsonFunction =>
          (Technical1215 technical1215) => technical1215.toJson();
}
