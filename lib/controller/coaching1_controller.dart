import 'package:pedagogue/model/coaching.dart';
import 'package:pedagogue/utils/base_controller.dart';
import 'package:pedagogue/utils/service/coaching_service.dart';
import '../model/coachng1_model.dart';
import '../utils/service/base_service.dart';
import '../utils/service/coaching1_service.dart';

class Coaching1Controller extends BaseController<Coaching1> {
  @override
  BaseService<Coaching1>? get service => Coaching1Service.instance;
}
