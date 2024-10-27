import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/player_terrain_model.dart';
import '../resources/api/token_manager.dart';

class PlayerTerrainService {
  Future<PlayerTerrain> fetchPlayerTerrain() async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }

    final String baseUrl =
        'https://www.mobile.sportspedagogue.com/api'; // Replace with your actual base URL
    final response = await http.get(
      headers: headers,
      Uri.parse("${baseUrl}/players/terrain"),
    );

    if (response.statusCode == 200) {
      PlayerTerrain playerTerrain =
          PlayerTerrain.fromJson(jsonDecode(response.body));
    //print(playerTerrain.team1!.player);
      //print(calories.meals!.first.id);

      return playerTerrain;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load Biological age");
    }
  }
}
