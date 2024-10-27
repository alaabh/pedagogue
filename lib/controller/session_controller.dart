import 'package:pedagogue/model/session_model.dart';
import 'package:pedagogue/utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/session_service.dart';

class SessionController extends BaseController<SessionModel> {
  @override
  BaseService<SessionModel>? get service => SessionService.instance;
}
