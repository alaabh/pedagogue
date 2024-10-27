import '../../model/library/coatching18_20.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/coatching18_service.dart';

class coatching18Controller extends BaseController<Coaching18> {
  @override
  BaseService<Coaching18>? get service => Coatching18Service.instance;
}
