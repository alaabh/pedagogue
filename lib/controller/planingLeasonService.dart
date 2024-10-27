import 'package:pedagogue/model/planingLeason_model.dart';
import 'package:pedagogue/utils/service/planingLeason_service.dart';
import '../utils/base_controller.dart';
import '../utils/service/base_service.dart';


class PlaningLeasonController extends BaseController<PlaningLeasonModel> {
  @override
  BaseService<PlaningLeasonModel>? get service => PlaningLeasonService.instance;
}
