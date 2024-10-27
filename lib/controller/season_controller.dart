import 'package:pedagogue/model/season.dart';
import 'package:pedagogue/utils/base_controller.dart';
import '../utils/service/base_service.dart';
import '../utils/service/season_service.dart';

class SeasonController extends BaseController<Season> {
  @override
  BaseService<Season>? get service => SeasonService.instance;
}
