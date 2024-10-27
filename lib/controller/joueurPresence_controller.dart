import '../model/JoueurPresence_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/JoueurPresence_service.dart';
import '../utils/service/base_service.dart';

class JoueurPresenceController extends BaseController<JoueurPresence> {
  @override
  BaseService<JoueurPresence>? get service => JoueurPresenceService.instance;
}
