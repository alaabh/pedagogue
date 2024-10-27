import '../../constants/env.dart';
import '../../model/planingLeason_model.dart';

import 'base_service.dart';

class PlaningLeasonService extends BaseService<PlaningLeasonModel> {
  PlaningLeasonService._();

  static final PlaningLeasonService instance = PlaningLeasonService._();

  factory PlaningLeasonService() => instance;

  @override
  String apiUrl = '$baseUrl/lesson';

  @override
  Function? get fromJsonFunction => PlaningLeasonModel.fromJson;

  @override
  Function(PlaningLeasonModel planingLeasonModel)? get toJsonFunction =>
      (PlaningLeasonModel planingLeasonModel) => planingLeasonModel.toJson();
}
