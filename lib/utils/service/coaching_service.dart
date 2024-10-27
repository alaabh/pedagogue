import 'package:pedagogue/model/coaching.dart';

import '../../constants/env.dart';
import 'base_service.dart';

class CoachingService extends BaseService<Coaching> {
  CoachingService._();

  static final CoachingService instance = CoachingService._();

  factory CoachingService() => instance;

  @override
  String apiUrl = '$baseUrl/coachings';

  @override
  Function? get fromJsonFunction => Coaching.fromJson;

  @override
  Function(Coaching coaching)? get toJsonFunction =>
      (Coaching coaching) => coaching.toJson();
}
