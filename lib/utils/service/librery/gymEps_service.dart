import '../../../constants/env.dart';
import '../../../model/library/gymEps_model.dart';
import '../base_service.dart';

class GymEpsService extends BaseService<GymEps> {
  GymEpsService._();

  static final GymEpsService instance = GymEpsService._();

  factory GymEpsService() => instance;

  @override
  String apiUrl = '$baseUrl/gym_eps';

  @override
  Function? get fromJsonFunction => GymEps.fromJson;

  @override
  Function(GymEps gymEps)? get toJsonFunction =>
          (GymEps gymEps) => gymEps.toJson();
}
