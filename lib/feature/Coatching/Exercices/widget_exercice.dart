import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../controller/Exercice_controller.dart';
import '../../../model/exercice_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import '../../../utils/resources/api/token_manager.dart';
import 'createExerciceScreen.dart';

class ExerciceWidget extends StatelessWidget {
  final Exercise exercise;
  final Function() loadDataFunction;

  const ExerciceWidget({
    Key? key, // Corrected syntax for key
    required this.loadDataFunction,
    required this.exercise,
  }) : super(key: key);

  Future<String> duplicate(int id, BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse(
        'https://www.mobile.sportspedagogue.com/api/exercices/duplicate/$id');
    final response = await http.post(
      url,
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with success message
          return AlertDialog(
            title: Text('Success!'),
            content: Text('your exercice is duplicated now'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      return "";
    } else {
      throw Exception('Failed to duplicated this exercice');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(exercise?.image);
    // API
    final exerciceController ExerciceController = exerciceController();

    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: Dimensions.mediumValue,
          horizontal: Dimensions.largeValue,
        ),
        child: Padding(
          padding: Dimensions.paddingLarge,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://mobile.sportspedagogue.com/images_video/${exercise.image}"))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text('${exercise?.image}'),
                      Text(
                        '${exercise?.name} ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(' ${exercise?.rating}'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: AppColors.warningColor),
                      onPressed: () => Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (context) => CreateExerciceScreen(
                                exercise: exercise,
                              ),
                            ),
                          )
                          .whenComplete(loadDataFunction),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: AppColors.dangerColor),
                      onPressed: () => ApiViewHandler.withAlert(
                        context: context,
                        apiCall: ExerciceController.delete(exercise.id!),
                        successFunction: loadDataFunction,
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.copy, color: Colors.green),
                        onPressed: () {
                          duplicate(exercise.id!, context);
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
