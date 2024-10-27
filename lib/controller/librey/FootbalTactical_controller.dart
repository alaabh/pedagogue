import '../../model/library/footballTactical.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/footbalTactical_service.dart';

class FoottballTacticalController extends BaseController<FootballTactical> {
  @override
  BaseService<FootballTactical>? get service => FootBalTacticalService.instance;
}
