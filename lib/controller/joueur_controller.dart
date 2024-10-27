import '../model/Joueur_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/joueur_service.dart';

class JoueurController extends BaseController<Player> {
  @override
  BaseService<Player>? get service => JoueurService.instance;
}
