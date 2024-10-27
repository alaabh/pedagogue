import 'package:pedagogue/utils/base_controller.dart';
import '../model/competition.dart';
import '../utils/service/base_service.dart';
import '../utils/service/competition_service.dart';

class CompetitionController extends BaseController<Competition> {
  @override
  BaseService<Competition>? get service => CompetitionService.instance;
}
