import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/env.dart';
import '../../../model/nutriSport_model/recipe_model.dart';
import '../../resources/api/token_manager.dart';

class RecipeProvider {
  Future<List<Recipe>> fetchRecipes(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langue = prefs.getString('SAVED_LOCALIZATION');

    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};
    headers.addAll({'Content-Type': 'application/json; charset=utf-8'});
    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }

    final String baseUrl =
        'https://www.mobile.sportspedagogue.com/api'; // Replace with your actual base URL
    final response = await http.get(
        headers: headers, Uri.parse("${baseUrl}/recipes_$langue?type=$type"));

    if (response.statusCode == 200) {
      //print(jsonDecode(response.body));
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> recipesList = body['data'];
      List<Recipe> recipes = recipesList
          .map<Recipe>(
              (dynamic item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList();
      return recipes;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load recipes");
    }
  }
}
