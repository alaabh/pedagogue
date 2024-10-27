import '../../../constants/env.dart';
import '../../../model/library/jeux_model.dart';
import '../../../model/library/kidsEps_model.dart';
import '../base_service.dart';

class KidsService extends BaseService<KidsEps> {
  KidsService._();

  static final KidsService instance = KidsService._();

  factory KidsService() => instance;

  @override
  String apiUrl = '$baseUrl/kids_eps';

  @override
  Function? get fromJsonFunction => KidsEps.fromJson;

  @override
  Function(KidsEps kidsEps)? get toJsonFunction =>
          (KidsEps kidsEps) => kidsEps.toJson();
}
