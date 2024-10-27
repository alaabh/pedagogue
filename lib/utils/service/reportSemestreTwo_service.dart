import 'package:pedagogue/model/rapport_semestre1_model.dart';

import '../../constants/env.dart';
import '../../model/rapport_semestre2_model.dart';
import '../../model/season.dart';
import 'base_service.dart';

class RapportSemestre2Service extends BaseService<RapportSemestre2Model> {
  RapportSemestre2Service._();

  static final RapportSemestre2Service instance = RapportSemestre2Service._();

  factory RapportSemestre2Service() => instance;

  @override
  String apiUrl = '$baseUrl/seasons';

  @override
  Function? get fromJsonFunction => Season.fromJson;

  @override
  Function(RapportSemestre2Model rapportSemestre2Model)? get toJsonFunction =>
      (RapportSemestre2Model rapportSemestre2Model) => rapportSemestre2Model.toJson();
}
