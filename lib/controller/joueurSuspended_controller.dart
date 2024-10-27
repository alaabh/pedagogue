import '../model/JoueurSuspendu_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/JoueurSuspondu_service.dart';
import '../utils/service/base_service.dart';

class JoueurSuspendedController extends BaseController<PlayerSuspended> {
  @override
  BaseService<PlayerSuspended>? get service => JoueurSusponduService.instance;
}
