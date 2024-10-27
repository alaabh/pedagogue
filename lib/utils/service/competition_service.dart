import 'package:pedagogue/model/competition.dart';

import '../../constants/env.dart';
import 'base_service.dart';

class CompetitionService extends BaseService<Competition> {
  CompetitionService._();

  static final CompetitionService instance = CompetitionService._();

  factory CompetitionService() => instance;

  @override
  String apiUrl = '$baseUrl/competitions';

  @override
  Function? get fromJsonFunction => Competition.fromJson;

  @override
  Function(Competition competition)? get toJsonFunction =>
      (Competition competition) => competition.toJson();
}
