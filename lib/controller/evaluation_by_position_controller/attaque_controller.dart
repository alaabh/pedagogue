






import 'package:pedagogue/model/evaluation_by_program_model/attaque_model.dart';
import 'package:pedagogue/utils/service/evaluation_by_position_service.dart/attaque_service.dart';

import '../../utils/base_controller.dart';

import '../../utils/service/base_service.dart';


class AttaqueController extends BaseController<AttaqueModel> {
  @override
  BaseService<AttaqueModel>? get service => AttaqueService.instance;
}
