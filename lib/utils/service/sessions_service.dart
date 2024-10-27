import '../../constants/env.dart';
import '../../model/sessions_model.dart';
import '../resources/api/api_response.dart';
import 'base_service.dart';

class SessionsService extends BaseService<Sessions> {
  SessionsService._();

  static final SessionsService instance = SessionsService._();

  factory SessionsService() => instance;

  @override
  String apiUrl = '$baseUrl/sessions';

  @override
  Function? get fromJsonFunction => Sessions.fromJson;

  @override
  Function(Sessions sessions)? get toJsonFunction =>
          (Sessions sessions) => sessions.toJson();

  @override
  Future<ApiResponse<Sessions>> getAll() async {
    print('Calling getAll method in JoueurService'); // Add print statement
    final response = await super.getAll();
    print('Response from getAll: $response'); // Add print statement
    return response;
  }

// Similarly, you can add print statements to other methods like getById, add, update, and delete if needed.
}
