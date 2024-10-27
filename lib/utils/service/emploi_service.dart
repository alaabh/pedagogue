import '../../constants/env.dart';
import '../../model/emploi.dart';
import 'base_service.dart';

class EmploiService extends BaseService<Emploi> {
  EmploiService._();

  static final EmploiService instance = EmploiService._();

  factory EmploiService() => instance;

  @override
  String apiUrl = '$baseUrl/emploi_du_temps';

  @override
  Function? get fromJsonFunction => Emploi.fromJson;

  @override
  Function(Emploi emploi)? get toJsonFunction =>
      (Emploi emploi) => emploi.toJson();
}
