import '../../../constants/env.dart';
import '../../../model/library/coatching18_20.dart';
import '../base_service.dart';

class Coatching18Service extends BaseService<Coaching18> {
  Coatching18Service._();

  static final Coatching18Service instance = Coatching18Service._();

  factory Coatching18Service() => instance;

  @override
  String apiUrl = '$baseUrl/coaching_u18_u20';

  @override
  Function? get fromJsonFunction => Coaching18.fromJson;

  @override
  Function(Coaching18 coaching18)? get toJsonFunction =>
          (Coaching18 coaching18) => coaching18.toJson();
}
