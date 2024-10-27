import '../model/emploi.dart';
import '../utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/emploi_service.dart';

class EmploiController  extends  BaseController<Emploi>{

  @override
  BaseService<Emploi>? get service => EmploiService.instance;

}
