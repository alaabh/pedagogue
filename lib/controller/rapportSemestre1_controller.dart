


import '../model/rapport_semestre1_model.dart';
import '../utils/base_controller.dart';

import '../utils/service/base_service.dart';
import '../utils/service/rapport_Semestre1_service.dart';

class RapportSmestre1Controller extends BaseController<RapportSemestre1Model> {
  @override
  BaseService<RapportSemestre1Model>? get service => RapportSemestre1Service.instance;
}
