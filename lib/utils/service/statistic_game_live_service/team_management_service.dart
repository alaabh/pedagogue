/* import 'package:pedagogue/model/coaching.dart';

import '../../../constants/env.dart';

import '../../../model/statstic_game_live_model/team_management_model.dart';
import '../base_service.dart';


class TeamManagementService extends BaseService<TeamManagementModel> {
  TeamManagementService._();

  static final TeamManagementService instance = TeamManagementService._();

  factory TeamManagementService() => instance;

  @override
  String apiUrl = '$baseUrl/formation';

  @override
  Function? get fromJsonFunction => TeamManagementModel.fromJson;

  @override
  Function(TeamManagementModel teamManagementModel)? get toJsonFunction =>
      (TeamManagementModel teamManagementModel) => teamManagementModel.toJson();
}


class TeamManagementServiceb extends BaseService<TeamManagementModel> {
  TeamManagementServiceb._();

  static final TeamManagementServiceb instance = TeamManagementServiceb._();

  factory TeamManagementServiceb() => instance;

  @override
  String apiUrl = '$baseUrl/formationb';

  @override
  Function? get fromJsonFunction => TeamManagementModel.fromJson;

  @override
  Function(TeamManagementModel teamManagementModel)? get toJsonFunction =>
      (TeamManagementModel teamManagementModel) => teamManagementModel.toJson();
} */




import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/statstic_game_live_model/team_management_model.dart';
import '../../resources/api/token_manager.dart';

class TeamManagementService {
  Future<TeamManagementModel> fetchstatistic(
      String url, TeamManagementModel teamManagementModel) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({
        'Authorization': 'Bearer ${TokenManager.storedToken}',
        "Content-type": "multipart/form-data"
      });
    }

    final String baseUrl = 'https://www.mobile.sportspedagogue.com/api';

    print("$url");
    print("${teamManagementModel.toJson()} bbbbbbb");

    var x = teamManagementModel.toJson();
    print(x["image1"]);
    var request = http.MultipartRequest('POST', Uri.parse("${baseUrl}/$url"));
    request.headers.addAll(headers);
    request.files.add(http.MultipartFile(
      'image1',
      teamManagementModel.image1!.readAsBytes().asStream(),
      teamManagementModel.image1!.lengthSync(),
      filename: "image1",
    ));
    request.files.add(http.MultipartFile(
      'image2',
      teamManagementModel.image1!.readAsBytes().asStream(),
      teamManagementModel.image1!.lengthSync(),
      filename: "image2",
    ));
    request.fields.addAll({"comment": teamManagementModel.comment});

    var response = await request.send();

    print(response.statusCode);

    if (response.statusCode == 200) {
      final body = jsonDecode(await response.stream.bytesToString())
          as Map<String, dynamic>;

      /*  if (body.containsKey('data') && body.keys.length == 1) {
        print(body['data']);
        return body['data'];
      } */

      TeamManagementModel teamManagementModel =
          TeamManagementModel.fromJson(body['data']);
      print(" ccc");
      print(teamManagementModel.image111);
      //print("${jsonDecode(await response.stream.bytesToString())} ccccccc");
      // print(response.stream.bytesToString());

      return teamManagementModel;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load analysisl");
    }
  }
}
