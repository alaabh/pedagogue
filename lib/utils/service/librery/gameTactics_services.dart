import '../../../constants/env.dart';
import '../../../model/library/gameTactics_model.dart';
import '../base_service.dart';

class GameTacticsService extends BaseService<GameTactic> {
  GameTacticsService._();

  static final GameTacticsService instance = GameTacticsService._();

  factory GameTacticsService() => instance;

  @override
  String apiUrl = '$baseUrl/game_tactics';

  @override
  Function? get fromJsonFunction => GameTactic.fromJson;

  @override
  Function(GameTactic gameTactic)? get toJsonFunction =>
          (GameTactic gameTactic) => gameTactic.toJson();
}
