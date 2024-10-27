import '../../model/FootBalExercice_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/librery/FootBalExercice_service.dart';
import '../../utils/service/base_service.dart';

class FottballExerciceController extends BaseController<FootballExercise> {
  @override
  BaseService<FootballExercise>? get service => FootBalExerciceService.instance;
}
