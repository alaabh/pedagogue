import 'package:get/get.dart';

import '../../../constants/env.dart';
import '../../../model/proteinCalculator/protein_calculator_model.dart';
import '../base_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../resources/api/token_manager.dart';

class ProteinCalculatorService {
  Future<ProteinCalculatorModel> fetchprotein(
    String sex,
    String heightSystem,
    String heightTens,
    String heightUnits,
    String age,
    String weightSystem,
    String goal,
    String activity,
    String weight,
  ) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }

    final String baseUrl =
        'https://www.mobile.sportspedagogue.com/api'; // Replace with your actual base URL
    final response = await http
        .post(headers: headers, Uri.parse("${baseUrl}/protien"), body: {
      /*  "sex": "F",
      "heightSystem": "feet",
      "heightTens": "2",
      "heightUnits": "2",
      "age": "25",
      "weightSystem": "pounds",
      "goal": "maintenance",
      "activity": "M",
      "weight": "68", */
      "sex": sex,
      "heightSystem": heightSystem,
      "heightTens": heightTens,
      "heightUnits": heightUnits,
      "age": age,
      "weightSystem": weightSystem,
      "goal": goal,
      "activity": "M",
      "weight": weight,
    });
    print(sex +
        heightSystem +
        heightTens +
        heightUnits +
        weightSystem +
        goal +
        "M" +
        weight);

    if (response.statusCode == 200) {
      print("object");
      ProteinCalculatorModel protein =
          ProteinCalculatorModel.fromJson(jsonDecode(response.body));

      print(response.body);
      print("object1");
      print(protein.proteinIntake);

      return protein;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception("Failed to load protein");
    }
  }
}
