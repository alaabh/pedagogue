import 'dart:convert';
import 'package:http/http.dart' as http;



import '../../model/imc_child_model.dart';
import '../resources/api/token_manager.dart';

class ImcChildService {
  Future<ImcChild> fetchImcChild(String poids, String taille, String age) async {
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
        Uri.parse("${baseUrl}/imc_child"),
        body: {
          "poids": poids,
          "taille": taille,
          "age": age,
          });

    if (response.statusCode == 200) {
      ImcChild imcChild =
          ImcChild.fromJson(jsonDecode(response.body));
      print(response.body);
      //print(calories.meals!.first.id);

      return imcChild;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load imc");
    }
  }
}