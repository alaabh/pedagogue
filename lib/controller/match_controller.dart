import 'package:pedagogue/model/match.dart';
import 'package:pedagogue/utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/match_service.dart';

class MatchController extends BaseController<Match> {
  @override
  BaseService<Match>? get service => MatchService.instance;
}
