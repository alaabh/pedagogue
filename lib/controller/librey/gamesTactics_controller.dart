import '../../model/library/gameTactics_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/gameTactics_services.dart';

class GameTacticsController extends BaseController<GameTactic> {
  @override
  BaseService<GameTactic>? get service => GameTacticsService.instance;
}
