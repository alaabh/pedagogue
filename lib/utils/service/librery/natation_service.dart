import '../../../constants/env.dart';
import '../../../model/library/natation_model.dart';
import '../base_service.dart';

class NatationService extends BaseService<Natation> {
  NatationService._();

  static final NatationService instance = NatationService._();

  factory NatationService() => instance;

  @override
  String apiUrl = '$baseUrl/natation_eps';

  @override
  Function? get fromJsonFunction => Natation.fromJson;

  @override
  Function(Natation natation)? get toJsonFunction =>
          (Natation natation) => natation.toJson();
}
