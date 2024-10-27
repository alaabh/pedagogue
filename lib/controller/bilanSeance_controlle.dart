import '../model/BilanSeance_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/BilanSeance_service.dart';
import '../utils/service/base_service.dart';

class BilanSeanceController  extends  BaseController<BilanSeance>{

  @override
  BaseService<BilanSeance>? get service => BilanSeanceService.instance;

}
