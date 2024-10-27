import 'package:pedagogue/utils/service/librery/technical1215_service.dart';
import '../../model/library/technial1215years.dart';
import '../../utils/base_controller.dart';
import '../../utils/service/base_service.dart';

class Technical1215Controller extends BaseController<Technical1215> {
  @override
  BaseService<Technical1215>? get service => Technical1215Service.instance;
}
