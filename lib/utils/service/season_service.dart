import '../../constants/env.dart';
import '../../model/season.dart';
import 'base_service.dart';

class SeasonService extends BaseService<Season> {
  SeasonService._();

  static final SeasonService instance = SeasonService._();

  factory SeasonService() => instance;

  @override
  String apiUrl = '$baseUrl/seasons';

  @override
  Function? get fromJsonFunction => Season.fromJson;

  @override
  Function(Season season)? get toJsonFunction =>
      (Season season) => season.toJson();
}
