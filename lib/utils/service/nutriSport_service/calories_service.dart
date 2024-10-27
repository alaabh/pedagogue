import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/nutriSport_model/calories_model.dart';
import '../../resources/api/token_manager.dart';

class CaloriesService {
  Future<CaloriesModel> fetchRecipes(String type) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }

    final String baseUrl =
        'https://www.mobile.sportspedagogue.com/api'; // Replace with your actual base URL
    final response = await http.post(
        headers: headers,
        Uri.parse("${baseUrl}/calories"),
        body: {"calories": type});

    if (response.statusCode == 200) {
      CaloriesModel calories =
          CaloriesModel.fromJson(jsonDecode(response.body));
      print(response.body);
      //print(calories.meals!.first.id);

      return calories;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load calories");
    }
  }
}
