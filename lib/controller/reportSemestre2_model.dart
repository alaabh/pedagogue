

import '../model/rapport_semestre2_model.dart';

import '../utils/base_controller.dart';

import '../utils/service/base_service.dart';
import '../utils/service/reportSemestreTwo_service.dart';

class RapportSmestre2Controller extends BaseController<RapportSemestre2Model> {
  @override
  BaseService<RapportSemestre2Model>? get service => RapportSemestre2Service.instance;
}
