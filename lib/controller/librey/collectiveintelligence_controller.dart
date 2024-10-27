import '../../model/library/collectiveintelligence_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/collectiveIntelligente_service.dart';

class CollectiveIntelligenceController extends BaseController<CollectiveIntelligence> {
  @override
  BaseService<CollectiveIntelligence>? get service => CollectiveIntelligenceService.instance;
}
