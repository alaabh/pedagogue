import 'package:pedagogue/model/rapport_semestre1_model.dart';

import '../../constants/env.dart';
import '../../model/season.dart';
import 'base_service.dart';

class RapportSemestre1Service extends BaseService<RapportSemestre1Model> {
  RapportSemestre1Service._();

  static final RapportSemestre1Service instance = RapportSemestre1Service._();

  factory RapportSemestre1Service() => instance;

  @override
  String apiUrl = '$baseUrl/seasons';

  @override
  Function? get fromJsonFunction => Season.fromJson;

  @override
  Function(RapportSemestre1Model rapportSemestre1Modelason)? get toJsonFunction =>
      (RapportSemestre1Model rapportSemestre1Model) => rapportSemestre1Model.toJson();
}
