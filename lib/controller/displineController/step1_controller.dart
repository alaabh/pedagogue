import 'package:pedagogue/model/displineModel/step1_model.dart';

import 'package:pedagogue/utils/service/displineService/step1_service.dart';

import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';

class Step1Controller extends BaseController<Step1Model> {
  @override
  BaseService<Step1Model>? get service => Step1Service.instance;
}
