import '../../../constants/env.dart';
import '../../../model/library/footballTactical.dart';
import '../base_service.dart';

class FootBalTacticalService extends BaseService<FootballTactical> {
  FootBalTacticalService._();

  static final FootBalTacticalService instance = FootBalTacticalService._();

  factory FootBalTacticalService() => instance;

  @override
  String apiUrl = '$baseUrl/football_tactical';

  @override
  Function? get fromJsonFunction => FootballTactical.fromJson;

  @override
  Function(FootballTactical footballTactical)? get toJsonFunction =>
          (FootballTactical footballTactical) => footballTactical.toJson();
}
