import '../../../constants/env.dart';
import '../../../model/library/collectiveintelligence_model.dart';
import '../base_service.dart';

class CollectiveIntelligenceService extends BaseService<CollectiveIntelligence> {
  CollectiveIntelligenceService._();

  static final CollectiveIntelligenceService instance = CollectiveIntelligenceService._();

  factory CollectiveIntelligenceService() => instance;

  @override
  String apiUrl = '$baseUrl/collective_intelligence';

  @override
  Function? get fromJsonFunction => CollectiveIntelligence.fromJson;

  @override
  Function(CollectiveIntelligence collectiveIntelligence)? get toJsonFunction =>
          (CollectiveIntelligence collectiveIntelligence) => collectiveIntelligence.toJson();
}
