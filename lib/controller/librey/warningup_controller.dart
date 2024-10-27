import '../../model/library/natation_model.dart';
import '../../model/library/warmingup_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/warmingUp_service.dart';

class WarmingUpController extends BaseController<WarmingUp> {
  @override
  BaseService<WarmingUp>? get service =>  WarningupService.instance;
}
