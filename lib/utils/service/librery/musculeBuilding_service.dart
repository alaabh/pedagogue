import '../../../constants/env.dart';
import '../../../model/library/musculBuilding_module.dart';
import '../base_service.dart';

class MusculeBuildingService extends BaseService<MuscleBuilding> {
  MusculeBuildingService._();

  static final MusculeBuildingService instance = MusculeBuildingService._();

  factory MusculeBuildingService() => instance;

  @override
  String apiUrl = '$baseUrl/muscule_building';

  @override
  Function? get fromJsonFunction => MuscleBuilding.fromJson;

  @override
  Function(MuscleBuilding muscleBuilding)? get toJsonFunction =>
          (MuscleBuilding muscleBuilding) => muscleBuilding.toJson();
}
