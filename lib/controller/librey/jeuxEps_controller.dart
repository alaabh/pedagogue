import '../../model/library/jeux_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/jeux_service.dart';

class JeuxController extends BaseController<Jeux> {
  @override
  BaseService<Jeux>? get service => JeuxService.instance;
}
