import '../../constants/env.dart';
import '../../model/session_model.dart';
import 'base_service.dart';

class SessionService extends BaseService<SessionModel> {
  SessionService._();

  static final SessionService instance = SessionService._();

  factory SessionService() => instance;

  @override
  String apiUrl = '$baseUrl/sessions';

  @override
  Function? get fromJsonFunction => SessionModel.fromJson;

  @override
  Function(SessionModel session)? get toJsonFunction =>
      (SessionModel session) => session.toJson();
}
