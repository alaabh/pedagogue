import 'package:pedagogue/model/library/gymEps_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/gymEps_service.dart';

class GymEpsController extends BaseController<GymEps> {
  @override
  BaseService<GymEps>? get service => GymEpsService.instance;
}
