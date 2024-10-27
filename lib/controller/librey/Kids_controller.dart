import '../../model/library/kidsEps_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/kids_service.dart';

class KidsController extends BaseController<KidsEps> {
  @override
  BaseService<KidsEps>? get service => KidsService.instance; // Updated to CamelCase
}
