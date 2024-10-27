import '../../constants/env.dart';
import '../../model/joueurDessai.dart';
import '../resources/api/api_response.dart';
import 'base_service.dart';

class JoueurDessaiService extends BaseService<JoueurDessai> {
  JoueurDessaiService._();

  static final JoueurDessaiService instance = JoueurDessaiService._();

  factory JoueurDessaiService() => instance;

  @override
  String apiUrl = '$baseUrl/players/trial';

  @override
  Function? get fromJsonFunction => JoueurDessai.fromJson;

  @override
  Function(JoueurDessai joueurDessai)? get toJsonFunction =>
      (JoueurDessai joueurDessai) => joueurDessai.toJson();

  @override
  Future<ApiResponse<JoueurDessai>> getAll() async {
    print(
        'Calling getAll method in JoueurDessaiService'); // Add print statement
    final response = await super.getAll();
    print('Response from getAll: $response'); // Add print statement
    return response;
  }

// Similarly, you can add print statements to other methods like getById, add, update, and delete if needed.
}
