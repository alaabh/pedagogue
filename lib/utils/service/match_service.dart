import 'package:pedagogue/model/match.dart';

import '../../constants/env.dart';
import 'base_service.dart';

class MatchService extends BaseService<Match> {
  MatchService._();

  static final MatchService instance = MatchService._();

  factory MatchService() => instance;

  @override
  String apiUrl = '$baseUrl/matchs';

  @override
  Function? get fromJsonFunction => Match.fromJson;

  @override
  Function(Match match)? get toJsonFunction => (Match match) => match.toJson();
}
