import '../../constants/env.dart';
import '../../model/observation_model.dart';
import 'base_service.dart';

class ObservationsService extends BaseService<Observation> {
  ObservationsService._();

  static final ObservationsService instance = ObservationsService._();

  factory ObservationsService() => instance;

  @override
  String apiUrl = '$baseUrl/observation';

  @override
  Function? get fromJsonFunction => Observation.fromJson;

  @override
  Function(Observation observation)? get toJsonFunction => (Observation observation) => observation.toJson();
}
