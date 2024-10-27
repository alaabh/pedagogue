import '../../constants/env.dart';
import '../../model/injuredPlayer_model.dart';
import 'base_service.dart';

class JoueurInjuredService extends BaseService<PlayerInjured> {
  JoueurInjuredService._();

  static final JoueurInjuredService instance = JoueurInjuredService._();

  factory JoueurInjuredService() => instance;

  @override
  String apiUrl = '$baseUrl/players/injured';

  @override
  Function? get fromJsonFunction => PlayerInjured.fromJson;

  @override
  Function(PlayerInjured playerInjured)? get toJsonFunction =>
      (PlayerInjured playerInjured) => playerInjured.toJson();
}
