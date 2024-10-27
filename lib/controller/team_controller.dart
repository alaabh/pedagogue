import 'package:pedagogue/utils/base_controller.dart';
import '../model/team.dart';
import '../utils/service/base_service.dart';
import '../utils/service/team_service.dart';

class TeamController extends BaseController<Team> {
  @override
  BaseService<Team>? get service => TeamService.instance;
}
