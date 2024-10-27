

import '../../../constants/env.dart';
import '../../../model/evaluation_by_program_model/GoalKeeper_model.dart';

import '../base_service.dart';

class GoalKeeperService extends BaseService<GoalKeeperModel> {
  GoalKeeperService._();

  static final GoalKeeperService instance = GoalKeeperService._();

  factory GoalKeeperService() => instance;

  @override
  String apiUrl = '$baseUrl/evalution_goalkeeper';

  @override
  Function? get fromJsonFunction => GoalKeeperModel.fromJson;

  @override
  Function(GoalKeeperModel goalKeeperModel)? get toJsonFunction =>
      (GoalKeeperModel goalKeeperModel) => goalKeeperModel.toJson();
}
