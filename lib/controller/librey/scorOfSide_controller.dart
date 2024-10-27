import '../../model/library/scoorOffsideModel.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/scoorOffside_service.dart';

class ScoreOffSifdeController extends BaseController<SoccerOffside> {
  @override
  BaseService<SoccerOffside>? get service => ScoorOffSideService.instance;
}
