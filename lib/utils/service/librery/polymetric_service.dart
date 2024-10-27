import '../../../constants/env.dart';
import '../../../model/library/polytricTrainig.dart';
import '../base_service.dart';

class PolymetricService extends BaseService<Plyometric> {
  PolymetricService._();

  static final PolymetricService instance = PolymetricService._();

  factory PolymetricService() => instance;

  @override
  String apiUrl = '$baseUrl/plyometric';

  @override
  Function? get fromJsonFunction => Plyometric.fromJson;

  @override
  Function(Plyometric plyometric)? get toJsonFunction =>
          (Plyometric plyometric) => plyometric.toJson();
}
