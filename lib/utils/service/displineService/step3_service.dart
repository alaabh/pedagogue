





import '../../../constants/env.dart';

import '../../../model/displineModel/step3_model.dart';
import '../base_service.dart';

class Step3Service extends BaseService<Step3Model> {
  Step3Service._();

  static final Step3Service instance = Step3Service._();

  factory Step3Service() => instance;

  @override
  String apiUrl = '$baseUrl/step3';

  @override
  Function? get fromJsonFunction => Step3Model.fromJson;

  @override
  Function(Step3Model step3Model)? get toJsonFunction =>
      (Step3Model step3Model) => step3Model.toJson();
}
