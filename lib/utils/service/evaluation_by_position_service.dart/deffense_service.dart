




import '../../../constants/env.dart';


import '../../../model/evaluation_by_program_model/defense_model.dart';
import '../base_service.dart';

class DeffenseService extends BaseService<DeffenseModel> {
  DeffenseService._();

  static final DeffenseService instance = DeffenseService._();

  factory DeffenseService() => instance;

  @override
  String apiUrl = '$baseUrl/evalution_defender';

  @override
  Function? get fromJsonFunction => DeffenseModel.fromJson;

  @override
  Function(DeffenseModel deffenseModel)? get toJsonFunction =>
      (DeffenseModel deffenseModel) => deffenseModel.toJson();
}
