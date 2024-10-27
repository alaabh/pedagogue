
import 'package:pedagogue/model/evaluation_by_program_model/middle_model.dart';
import 'package:pedagogue/utils/service/evaluation_by_position_service.dart/middle_service.dart';

import '../../utils/base_controller.dart';

import '../../utils/service/base_service.dart';


class MiddleController extends BaseController<MiddleModel> {
  @override
  BaseService<MiddleModel>? get service => MiddleService.instance;
}
