import '../../../constants/env.dart';
import '../../../model/library/scoorOffsideModel.dart';
import '../base_service.dart';

class ScoorOffSideService extends BaseService<SoccerOffside> {
  ScoorOffSideService._();

  static final ScoorOffSideService instance = ScoorOffSideService._();

  factory ScoorOffSideService() => instance;

  @override
  String apiUrl = '$baseUrl/soccer_offside';

  @override
  Function? get fromJsonFunction => SoccerOffside.fromJson;

  @override
  Function(SoccerOffside soccerOffside)? get toJsonFunction =>
          (SoccerOffside soccerOffside) => soccerOffside.toJson();
}
