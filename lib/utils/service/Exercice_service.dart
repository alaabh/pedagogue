import '../../constants/env.dart';
import '../../model/exercice_model.dart';
import '../resources/api/api_response.dart';
import 'base_service.dart';

class ExerciceService extends BaseService<Exercise> {
  ExerciceService._();

  static final ExerciceService instance = ExerciceService._();

  factory ExerciceService() => instance;

  @override
  String apiUrl = '$baseUrl/exercices';

  @override
  Function? get fromJsonFunction => Exercise.fromJson;

  @override
  Function(Exercise exercise)? get toJsonFunction =>
          (Exercise exercise) => exercise.toJson();

 
}

