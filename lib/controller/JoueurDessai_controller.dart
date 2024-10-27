import '../model/joueurDessai.dart';
import '../utils/base_controller.dart';
import '../utils/service/JoueurDessai_service.dart';
import '../utils/service/base_service.dart';

class JoueurDessaiController extends BaseController<JoueurDessai> {
  @override
  BaseService<JoueurDessai>? get service => JoueurDessaiService.instance;
}
