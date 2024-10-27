import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedagogue/shared/widget/loading_widget.dart';

import '../../l10n/localization.dart';
import '../../shared/style/app_color.dart';
import '../../shared/style/dimensions.dart';
import '../../utils/resources/api/token_manager.dart';
class WorkoutHistory extends StatefulWidget {
  const WorkoutHistory({super.key});

  @override
  State<WorkoutHistory> createState() => _WorkoutHistoryState();
}

class _WorkoutHistoryState extends State<WorkoutHistory> {
 List<Map<String, dynamic>> _workoutData = [];
  @override
  void initState() {
    super.initState();
    // Call the method to fetch data when the widget initializes
    getResult(context);
  }

  bool loader = true;

  Future<void> getResult(BuildContext context) async {
    bool authIsRequired = true;
    Map<String, String>? headers;
    headers ??= {};

    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }
    final url = Uri.parse(
        'https://www.mobile.sportspedagogue.com/api/workout_before_date');
    final response = await http.get(
      url,
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        _workoutData = List<Map<String, dynamic>>.from(data['data']);
        loader = false;
      });

      print(data);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with success message
          return AlertDialog(
            title: Text('failed'),
            content: Text('Check your internet connection or your input'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.workoutHistory),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: loader
              ? LoadingWidget()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dimensions.verticalSpacingExtraLarge,
                    // Iterate over workout data and create columns for each entry
                    for (var workout in _workoutData)
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.all(16.0),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${intl.date}: ${workout['date']}"),
                            SizedBox(height: 8),
                            // Text("Squat Rep: ${workout['squat_rep']}"),
                            // Add more workout fields here if needed
                          ],
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}