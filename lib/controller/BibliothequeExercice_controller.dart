import '../model/exerciceLibrery.dart';
import '../utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/bibliothequeExercice_service.dart';




class BibliothequeExerciceController extends BaseController<BibliothequeExercicee> {

  @override
  BaseService<BibliothequeExercicee>? get service => BibliothequeExerciceService.instance;
}
