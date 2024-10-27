

import 'package:pedagogue/model/evaluation_by_program_model/middle_model.dart';

import '../../../constants/env.dart';


import '../base_service.dart';

class MiddleService extends BaseService<MiddleModel> {
  MiddleService._();

  static final MiddleService instance = MiddleService._();

  factory MiddleService() => instance;

  @override
  String apiUrl = '$baseUrl/evalution_midfielder';

  @override
  Function? get fromJsonFunction => MiddleModel.fromJson;

  @override
  Function(MiddleModel middleModel)? get toJsonFunction =>
      (MiddleModel middleModel) => middleModel.toJson();
}
