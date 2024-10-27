import '../../constants/env.dart';
import '../../model/exerciceLibrery.dart';

import 'base_service.dart';

class BibliothequeExerciceService extends BaseService<BibliothequeExercicee> {
  BibliothequeExerciceService._();

  static final BibliothequeExerciceService instance = BibliothequeExerciceService._();

  factory BibliothequeExerciceService() => instance;

  @override
  String apiUrl = '$baseUrl/exercices/duplicate';

  // Change this line to use BibliothequeExercicee.fromJson
  @override
  Function? get fromJsonFunction => BibliothequeExercicee.fromJson;

  @override
  Function(BibliothequeExercicee bibliothequeExercice)? get toJsonFunction =>
          (BibliothequeExercicee bibliothequeExercice) => bibliothequeExercice.toJson();
}
