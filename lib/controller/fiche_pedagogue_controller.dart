import '../model/fiche_pedagogue_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/fiche_pedagogue_service.dart';

class FichePedagogueController extends BaseController<FichePedagogue> {
  @override
  BaseService<FichePedagogue>? get service => FichePedagogueService.instance;
}
