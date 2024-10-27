import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pedagogue/model/biological_age_model.dart';




import '../resources/api/token_manager.dart';

class BiologicalAgeService {
  Future<BiologicalAge> fetchBiologicalAge(
  dynamic sex,
   dynamic age,
   dynamic race,
   dynamic longevity,
   dynamic Education,
   dynamic sleep,
   dynamic cholesterol,
   dynamic bp,
   dynamic smoking,
   dynamic heredity,
   dynamic weight,
   dynamic stress,
   dynamic activity,
   dynamic medexam,
   dynamic heart,
   dynamic lung,
   dynamic time,
   dynamic protein,
   dynamic drugs,
   dynamic femalehealth,
   dynamic pill,
   dynamic breakfast,
   dynamic meals,
   dynamic veg,
   dynamic refined,
   dynamic alcohol,
   dynamic happiness,
   dynamic depression,
   dynamic anxiety,
   dynamic relax,
   dynamic love,
   dynamic job,
   dynamic social,
   dynamic driving,
   dynamic seatbelt,
   dynamic risk,) async {
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
        Uri.parse("${baseUrl}/biological_age"),
        body: {
          "pill":pill ,
      "breakfast":breakfast ,
      "veg":veg,
      "meals": meals,
      "refined":refined,
      "alcohol":alcohol,
      "happiness":happiness ,
      "depression":depression,
      "anxiety":anxiety,
      "relax": relax,
      "love":love,
      "job":job,
      "social":social ,
      "driving":driving ,
      "seatbelt": seatbelt,
      "risk":risk,
      'sex': sex,
      'age': age,
      'race': race,
      'longevity': longevity,
      'Education': Education,
      'sleep': sleep,
      'cholesterol': cholesterol,
      'bp': bp,
      'smoking': smoking,
      'heredity': heredity,
      'weight': weight,
      'stress': stress,
      'activity': activity,
      'medexam': medexam,
      'heart': heart,
      'lung': lung,
      'time': time,
      'protein': protein,
      'drugs': drugs,
      'femalehealth': femalehealth,
          });

    if (response.statusCode == 200) {
      BiologicalAge biologicalAge =
          BiologicalAge.fromJson(jsonDecode(response.body));
      print(response.body);
      //print(calories.meals!.first.id);

      return biologicalAge;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load Biological age");
    }
  }
}

