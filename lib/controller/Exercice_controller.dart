import '../model/exercice_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/Exercice_service.dart';
import '../utils/service/base_service.dart';

class exerciceController extends BaseController<Exercise> {
  @override
  BaseService<Exercise>? get service => ExerciceService.instance;
}
