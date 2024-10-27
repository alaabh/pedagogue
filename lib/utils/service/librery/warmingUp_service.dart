import '../../../constants/env.dart';
import '../../../model/library/warmingup_model.dart';
import '../base_service.dart';

class WarningupService extends BaseService<WarmingUp> {
  WarningupService._();

  static final WarningupService instance = WarningupService._();

  factory WarningupService() => instance;

  @override
  String apiUrl = '$baseUrl/echauffement_eps';

  @override
  Function? get fromJsonFunction => WarmingUp.fromJson;

  @override
  Function(WarmingUp warmingUp)? get toJsonFunction =>
          (WarmingUp warmingUp) => warmingUp.toJson();
}
