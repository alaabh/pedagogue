import 'package:pedagogue/utils/service/displineService/step2_service.dart';

import '../../model/displineModel/step2_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';

class Step2Controller extends BaseController<Step2Model> {
  @override
  BaseService<Step2Model>? get service => Step2Service.instance;
}
