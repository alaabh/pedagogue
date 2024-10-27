import '../../constants/env.dart';
import '../../model/bilanDebutCycleModel.dart';
import '../../model/emploi.dart';
import 'base_service.dart';

class BilanDebutCycleService extends BaseService<BilanDebutCycle> {

  BilanDebutCycleService._();

  static final BilanDebutCycleService instance = BilanDebutCycleService._();

  factory BilanDebutCycleService() => instance;

  @override
  String apiUrl = '$baseUrl/bilan_debut_cycle';

  @override
  Function? get fromJsonFunction => Emploi.fromJson;

  @override
  Function(BilanDebutCycle bilanDebutCycle)? get toJsonFunction =>
      (BilanDebutCycle bilanDebutCycle) => bilanDebutCycle.toJson();
}
