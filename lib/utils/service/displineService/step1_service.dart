



import 'package:pedagogue/model/displineModel/step1_model.dart';

import '../../../constants/env.dart';
import '../base_service.dart';

class Step1Service extends BaseService<Step1Model> {
  Step1Service._();

  static final Step1Service instance = Step1Service._();

  factory Step1Service() => instance;

  @override
  String apiUrl = '$baseUrl/step1';

  @override
  Function? get fromJsonFunction => Step1Model.fromJson;

  @override
  Function(Step1Model step1Model)? get toJsonFunction =>
      (Step1Model step1Model) => step1Model.toJson();
}
