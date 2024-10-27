

import 'package:pedagogue/model/evaluation_by_program_model/attaque_model.dart';

import '../../../constants/env.dart';

import '../base_service.dart';

class AttaqueService extends BaseService<AttaqueModel> {
  AttaqueService._();

  static final AttaqueService instance = AttaqueService._();

  factory AttaqueService() => instance;

  @override
  String apiUrl = '$baseUrl/evalution_attacked';

  @override
  Function? get fromJsonFunction => AttaqueModel.fromJson;

  @override
  Function(AttaqueModel goalKeeperModel)? get toJsonFunction =>
      (AttaqueModel goalKeeperModel) => goalKeeperModel.toJson();
}
