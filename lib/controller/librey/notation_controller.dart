import '../../model/library/natation_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/natation_service.dart';

class NotationController extends BaseController<Natation> {
  @override
  BaseService<Natation>? get service => NatationService.instance;
}
