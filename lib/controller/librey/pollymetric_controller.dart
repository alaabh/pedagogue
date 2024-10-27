import '../../model/FootBalExercice_model.dart';
import '../../model/library/polytricTrainig.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/librery/FootBalExercice_service.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/polymetric_service.dart';

class polymetricController extends BaseController<Plyometric> {
  @override
  BaseService<Plyometric>? get service => PolymetricService.instance;
}
