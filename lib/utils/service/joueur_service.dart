import '../../constants/env.dart';
import '../../model/Joueur_model.dart';
import '../resources/api/api_response.dart';
import 'base_service.dart';

class JoueurService extends BaseService<Player> {
  JoueurService._();

  static final JoueurService instance = JoueurService._();

  factory JoueurService() => instance;

  @override
  String apiUrl = '$baseUrl/players';

  @override
  Function? get fromJsonFunction => Player.fromJson;

  @override
  Function(Player player)? get toJsonFunction =>
      (Player player) => player.toJson();

  @override
  Future<ApiResponse<Player>> getAll() async {
    print('Calling getAll method in JoueurService'); // Add print statement
    final response = await super.getAll();
    print('Response from getAll: $response'); // Add print statement
    return response;
  }

// Similarly, you can add print statements to other methods like getById, add, update, and delete if needed.
}
