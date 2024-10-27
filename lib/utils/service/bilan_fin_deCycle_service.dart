import '../../constants/env.dart';

import '../../model/bilan_fin_decycle_model.dart';
import '../../model/emploi.dart';
import 'base_service.dart';

class BilanFinCycleService extends BaseService<BilanFinCycle> {

  BilanFinCycleService._();

  static final BilanFinCycleService instance = BilanFinCycleService._();

  factory BilanFinCycleService() => instance;

  @override
  String apiUrl = '$baseUrl/bilan_fin_cycle';

  @override
  Function? get fromJsonFunction => BilanFinCycle.fromJson;

  @override
  Function(BilanFinCycle bilanFinCycle)? get toJsonFunction =>
      (BilanFinCycle bilanFinCycle) => bilanFinCycle.toJson();
}
