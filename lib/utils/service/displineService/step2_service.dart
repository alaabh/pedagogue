





import '../../../constants/env.dart';
import '../../../model/displineModel/step2_model.dart';
import '../base_service.dart';

class Step2Service extends BaseService<Step2Model> {
  Step2Service._();

  static final Step2Service instance = Step2Service._();

  factory Step2Service() => instance;

  @override
  String apiUrl = '$baseUrl/step2';

  @override
  Function? get fromJsonFunction => Step2Model.fromJson;

  @override
  Function(Step2Model step2Model)? get toJsonFunction =>
      (Step2Model step2Model) => step2Model.toJson();
}
