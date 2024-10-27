import '../model/PlayerStarting_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/JoueurStarting_service.dart';
import '../utils/service/base_service.dart';

class JoueurStartingController extends BaseController<PlayerStarting> {
  @override
  BaseService<PlayerStarting>? get service => JoueurStartingService.instance;
}
