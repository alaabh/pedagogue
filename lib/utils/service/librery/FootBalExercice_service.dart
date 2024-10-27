import '../../../constants/env.dart';
import '../../../model/FootBalExercice_model.dart';
import '../base_service.dart';

class FootBalExerciceService extends BaseService<FootballExercise> {
  FootBalExerciceService._();

  static final FootBalExerciceService instance = FootBalExerciceService._();

  factory FootBalExerciceService() => instance;

  @override
  String apiUrl = '$baseUrl/football_exercices';

  @override
  Function? get fromJsonFunction => FootballExercise.fromJson;

  @override
  Function(FootballExercise footballExercise)? get toJsonFunction =>
          (FootballExercise footballExercise) => footballExercise.toJson();
}
