import '../../constants/env.dart';
import '../../model/JoueurSuspendu_model.dart';
import '../resources/api/api_response.dart';
import 'base_service.dart';

class JoueurSusponduService extends BaseService<PlayerSuspended> {
  JoueurSusponduService._();

  static final JoueurSusponduService instance = JoueurSusponduService._();

  factory JoueurSusponduService() => instance;

  @override
  String apiUrl = '$baseUrl/players/suspended';

  @override
  Function? get fromJsonFunction => PlayerSuspended.fromJson;

  @override
  Function(PlayerSuspended playerSuspended)? get toJsonFunction =>
      (PlayerSuspended playerSuspended) => playerSuspended.toJson();

  @override
  Future<ApiResponse<PlayerSuspended>> getAll() async {
    print('Calling getAll method in JoueurService'); // Add print statement
    final response = await super.getAll();
    print('Response from getAll: $response'); // Add print statement
    return response;
  }

// Similarly, you can add print statements to other methods like getById, add, update, and delete if needed.
}
