import '../../constants/env.dart';
import '../../model/PlayerStarting_model.dart';
import '../resources/api/api_response.dart';
import 'base_service.dart';

class JoueurStartingService extends BaseService<PlayerStarting> {
  JoueurStartingService._();

  static final JoueurStartingService instance = JoueurStartingService._();

  factory JoueurStartingService() => instance;

  @override
  String apiUrl = '$baseUrl/players/starting';

  @override
  Function? get fromJsonFunction => PlayerStarting.fromJson;

  @override
  Function(PlayerStarting playerStarting)? get toJsonFunction =>
      (PlayerStarting playerStarting) => playerStarting.toJson();

  @override
  Future<ApiResponse<PlayerStarting>> getAll() async {
    print(
        'Calling getAll method in JoueurStartingService'); // Add print statement
    final response = await super.getAll();
    print('Response from getAll: $response'); // Add print statement
    return response;
  }

// Similarly, you can add print statements to other methods like getById, add, update, and delete if needed.
}
