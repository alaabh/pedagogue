import 'package:pedagogue/model/coaching.dart';
import 'package:pedagogue/utils/base_controller.dart';
import 'package:pedagogue/utils/service/coaching_service.dart';
import '../utils/service/base_service.dart';

class CoachingController extends BaseController<Coaching> {
  @override
  BaseService<Coaching>? get service => CoachingService.instance;
}
