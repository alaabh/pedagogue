import '../../../constants/env.dart';
import '../../../model/library/jeux_model.dart';
import '../base_service.dart';

class JeuxService extends BaseService<Jeux> {
  JeuxService._();

  static final JeuxService instance = JeuxService._();

  factory JeuxService() => instance;

  @override
  String apiUrl = '$baseUrl/jeux_eps';

  @override
  Function? get fromJsonFunction => Jeux.fromJson;

  @override
  Function(Jeux jeux)? get toJsonFunction =>
          (Jeux jeux) => jeux.toJson();
}
