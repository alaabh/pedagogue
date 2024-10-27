import '../../constants/env.dart';
import '../../model/team.dart';
import 'base_service.dart';

class TeamService extends BaseService<Team> {
  TeamService._();

  static final TeamService instance = TeamService._();

  factory TeamService() => instance;

  @override
  String apiUrl = '$baseUrl/teams';

  @override
  Function? get fromJsonFunction => Team.fromJson;

  @override
  Function(Team team)? get toJsonFunction => (Team team) => team.toJson();
}
