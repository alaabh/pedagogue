





import 'package:pedagogue/utils/service/evaluation_by_position_service.dart/deffense_service.dart';

import '../../model/evaluation_by_program_model/defense_model.dart';
import '../../utils/base_controller.dart';

import '../../utils/service/base_service.dart';


class DeffenseController extends BaseController<DeffenseModel> {
  @override
  BaseService<DeffenseModel>? get service => DeffenseService.instance;
}
