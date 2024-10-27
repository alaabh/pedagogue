import '../../model/library/musculBuilding_module.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/musculeBuilding_service.dart';

class MuscleBuildingController extends BaseController<MuscleBuilding> {
  @override
  BaseService<MuscleBuilding>? get service => MusculeBuildingService.instance;
}

