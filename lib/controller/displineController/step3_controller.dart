
import '../../model/displineModel/step3_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/displineService/step3_service.dart';
class Step3Controller extends BaseController<Step3Model> {
  @override
  BaseService<Step3Model>? get service => Step3Service.instance;
}
