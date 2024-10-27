


import 'package:pedagogue/model/evaluation_by_program_model/GoalKeeper_model.dart';
import 'package:pedagogue/utils/service/evaluation_by_position_service.dart/goalkeeper_service.dart';

import '../../utils/base_controller.dart';

import '../../utils/service/base_service.dart';


class GoalKeeperController extends BaseController<GoalKeeperModel> {
  @override
  BaseService<GoalKeeperModel>? get service => GoalKeeperService.instance;
}
