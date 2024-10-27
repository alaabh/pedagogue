import '../../../constants/env.dart';
import '../../../model/library/tacticaLZone_model.dart';
import '../base_service.dart';

class TacticalZoneService extends BaseService<TacticalZone> {
  TacticalZoneService._();

  static final TacticalZoneService instance = TacticalZoneService._();

  factory TacticalZoneService() => instance;

  @override
  String apiUrl = '$baseUrl/tactical_zone';

  @override
  Function? get fromJsonFunction => TacticalZone.fromJson;

  @override
  Function(TacticalZone tacticalZone)? get toJsonFunction =>
          (TacticalZone tacticalZone) => tacticalZone.toJson();
}
