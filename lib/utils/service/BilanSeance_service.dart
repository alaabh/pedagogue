import '../../constants/env.dart';
import '../../model/BilanSeance_model.dart';
import '../../model/Joueur_model.dart';
import '../resources/api/api_response.dart';
import 'base_service.dart';

class BilanSeanceService extends BaseService<BilanSeance> {
  BilanSeanceService._();

  static final BilanSeanceService instance = BilanSeanceService._();

  factory BilanSeanceService() => instance;

  @override
  String apiUrl = '$baseUrl/bilan_seance';

  @override
  Function? get fromJsonFunction => Player.fromJson;

  @override
  Function(BilanSeance bilanSeance)? get toJsonFunction =>
          (BilanSeance bilanSeance) => bilanSeance.toJson();

  @override
  Future<ApiResponse<BilanSeance>> getAll() async {
    print('Calling getAll method in BilanSeanceService'); // Add print statement
    final response = await super.getAll();
    print('Response from getAll: $response'); // Add print statement
    return response;
  }

// Similarly, you can add print statements to other methods like getById, add, update, and delete if needed.
}
