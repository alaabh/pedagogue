


import '../../constants/env.dart';
import '../../model/fiche_pedagogue_model.dart';
import '../resources/api/api_response.dart';
import 'base_service.dart';

class FichePedagogueService extends BaseService<FichePedagogue> {
  FichePedagogueService._();

  static final FichePedagogueService instance = FichePedagogueService._();

  factory FichePedagogueService() => instance;

  @override
  String apiUrl = '$baseUrl/pedagogue';

  @override
  Function? get fromJsonFunction => FichePedagogue.fromJson;

  @override
  Function(FichePedagogue fichePedagogue)? get toJsonFunction =>
          (FichePedagogue fichePedagogue) => fichePedagogue.toJson();

 
}

