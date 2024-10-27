import '../../model/library/tacticaLZone_model.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';
import '../../utils/service/librery/tacticalZone_service.dart';

class TacticalZoneController extends BaseController<TacticalZone> {
  @override
  BaseService<TacticalZone>? get service => TacticalZoneService.instance;
}
