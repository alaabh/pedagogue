import '../model/injuredPlayer_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/joueurInjued_service.dart';

class JoueurInjuredController extends BaseController<PlayerInjured> {
  @override
  BaseService<PlayerInjured>? get service => JoueurInjuredService.instance;
}
