import '../model/observation_model.dart';
import '../utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/observation_service.dart';

class ObservationController extends BaseController<Observation> {
  @override
  BaseService<Observation>? get service => ObservationsService.instance;
}
