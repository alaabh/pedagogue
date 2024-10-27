import '../model/sessions_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/sessions_service.dart';

class SessionsController extends BaseController<Sessions> {
  @override
  BaseService<Sessions>? get service => SessionsService.instance;
}
