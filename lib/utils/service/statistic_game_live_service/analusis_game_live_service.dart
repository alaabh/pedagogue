import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/statstic_game_live_model/analyse_game_live_model.dart';
import '../../resources/api/token_manager.dart';

class AnalysisGameLiveService {
  Future<AnalysisGameLiveModel> fetchstatistic(
      String url, AnalysisGameLiveModel analysis) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }

    final String baseUrl = 'https://www.mobile.sportspedagogue.com/api';

    print("$url ssss");
    final response = await http.post(
        headers: headers,
        Uri.parse("${baseUrl}/$url"),
        body: analysis.toJson());

    if (response.statusCode == 200) {
      AnalysisGameLiveModel analysisGameLiveModel =
          AnalysisGameLiveModel.fromJson(jsonDecode(response.body));
      print(" ccc");
      print("${response.body} ccccccc");

      return analysisGameLiveModel;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load analysisl");
    }
  }
}
