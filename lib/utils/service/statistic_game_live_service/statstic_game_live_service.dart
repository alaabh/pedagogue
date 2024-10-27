import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/statstic_game_live_model/statstic_game_live_model.dart';
import '../../resources/api/token_manager.dart';

class StatisticGameLiveService {
  Future<StatisticGameLiveModel> fetchstatistic(
      String url, StatisticGameLiveModel statistic) async {
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
        body: statistic.toJson());

    if (response.statusCode == 200) {
      StatisticGameLiveModel statisticGameLiveModel =
          StatisticGameLiveModel.fromJson(jsonDecode(response.body));
      print(" ccc");
      print("${response.body} ccccccc");

      return statisticGameLiveModel;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load strategy");
    }
  }
}
