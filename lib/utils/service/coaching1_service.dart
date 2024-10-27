import 'package:pedagogue/model/coaching.dart';

import '../../constants/env.dart';
import '../../model/coachng1_model.dart';
import 'base_service.dart';

class Coaching1Service extends BaseService<Coaching1> {
  Coaching1Service._();

  static final Coaching1Service instance = Coaching1Service._();

  factory Coaching1Service() => instance;

  @override
  String apiUrl = '$baseUrl/coachings';

  @override
  Function? get fromJsonFunction => Coaching1.fromJson;

  @override
  Function(Coaching1 coaching)? get toJsonFunction =>
      (Coaching1 coaching) => coaching.toJson();
}
