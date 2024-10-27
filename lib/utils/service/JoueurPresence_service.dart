import '../../constants/env.dart';
import '../../model/JoueurPresence_model.dart';
import '../resources/api/api_response.dart';
import 'base_service.dart';

class JoueurPresenceService extends BaseService<JoueurPresence> {
  JoueurPresenceService._();

  static final JoueurPresenceService instance = JoueurPresenceService._();

  factory JoueurPresenceService() => instance;

  @override
  String apiUrl = '$baseUrl/players/presence';

  @override
  Function? get fromJsonFunction => JoueurPresence.fromJson;

  @override
  Function(JoueurPresence joueurPresence)? get toJsonFunction =>
      (JoueurPresence joueurPresence) => joueurPresence.toJson();

  @override
  Future<ApiResponse<JoueurPresence>> getAll() async {
    print('Calling getAll method in JoueurService'); // Add print statement
    final response = await super.getAll();
    print('Response from getAll: $response'); // Add print statement
    return response;
  }

// Similarly, you can add print statements to other methods like getById, add, update, and delete if needed.
}
