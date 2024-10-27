import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:pedagogue/feature/workout/workout_result.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';

import '../../env/env.dart';
import '../../l10n/localization.dart';
import '../../shared/style/dimensions.dart';

class WorkoutMain extends StatefulWidget {
  const WorkoutMain({super.key});

  @override
  State<WorkoutMain> createState() => _WorkoutMainState();
}

class _WorkoutMainState extends State<WorkoutMain> {
  Future<String> generateWorkoutPlan({
    required String age,
    required String sex,
    required String name,
    required String height,
    required String weight,
    required String part,
    String? illness,
    required String workoutTime,
    required String goal,
  }) async {
    OpenAI.apiKey = Env.apiKey;
    final openai = OpenAI.instance;

    final prompt = '''
Suggest a structured workout plan for a $age-year-old $sex named $name with a height of $height cm and weight of $weight kg, targeting the $part. This person has ${illness ?? 'no'} health issues, has $workoutTime minutes for the workout, and aims to $goal. Please the response must be just workout and format the plan with -  for workout and please just 5 and no more informations .
''';

    final completion = await openai.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              prompt,
            ),
          ],
          role: OpenAIChatMessageRole.user,
        ),
        OpenAIChatCompletionChoiceMessageModel(
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              "You are a talented sports coach. Respond in english.",
            ),
          ],
          role: OpenAIChatMessageRole.system,
        ),
      ],
    );
    setState(() {
      workoutMessage = completion.choices.first.message.content!.first.text ??
          'No response found';
    });

    // extractExercises(workoutMessage);

    generateNextImage(extractExercises(
        completion.choices.first.message.content!.first.text.toString()));
    return completion.choices.first.message.content!.first.text ??
        'No response found';
  }

  Future<String> generateImageWorkoutPlan({
    required String exercices,
  }) async {
    OpenAI.apiKey = Env.apiKey;
    final openai = OpenAI.instance;

    final completion = await openai.image.create(
        size: OpenAIImageSize.size512,
        model: "dall-e-2",
        prompt:
            // "Illustration of a workout exercise for $exercices, fitness concept, high resolution");
            "Illustration of a workout exercise for $exercices, fitness concept, high resolution ,and large and picture without  legend ");

    return completion.data.first.url ?? 'No response found';
  }

  List<String> extractExercises(String text) {
    List<String> exercises = [];
    List<String> lines = text.split('\n');
    for (String line in lines) {
      if (line.trim().startsWith('-')) {
        exercises.add(line.trim().substring(2));
      }
    }
    print(exercises);
    return exercises;
  }

  List<String> imgUrls = [];
  Future<void> generateNextImage(List<String> exerciseList) async {
    print("exerciseList dddddddddddddddddddddddddddddddddddddddddd");
    print(exerciseList.length);
    for (var i = 0; i < 5; i++) {
      String exercise = exerciseList[i];
      String imageUrl = await generateImageWorkoutPlan(exercices: exercise);
      print("currentIndex:$i");
      print('Image URL for $exercise: $imageUrl');
      imgUrls.add(imageUrl);

      // Refresh the UI
    }
    setState(() {
      workoutLoading = false;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => WorkoutResult(
                imgUrls: imgUrls,
                result: workoutMessage,
              )),
    );
  }

  String workoutMessage = "";
  bool workoutLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController partController = TextEditingController();
  final TextEditingController goalController = TextEditingController();
  final TextEditingController illnessController = TextEditingController();
  final TextEditingController workoutTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intl.workout} Ai"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Center(
              child: Column(
                children: [
                  CustomInput(
                    title: "Name",
                    inputType: InputType.text,
                    controller: nameController,
                  ),
                  CustomInput(
                    title: "age",
                    inputType: InputType.text,
                    controller: ageController,
                  ),
                  CustomInput(
                    title: "sex",
                    inputType: InputType.dropdown,
                    dropdownItems: ["Men", "Women"],
                    controller: sexController,
                  ),
                  CustomInput(
                    title: "height",
                    inputType: InputType.text,
                    controller: heightController,
                  ),
                  CustomInput(
                    title: "weight",
                    inputType: InputType.text,
                    controller: weightController,
                  ),
                  CustomInput(
                      title: "part",
                      inputType: InputType.dropdown,
                      controller: partController,
                      dropdownItems: [
                        "Biceps",
                        "Shoulders",
                        "Traps",
                        "Chest",
                        "Quads",
                        "Calves",
                        "Hamstrings",
                        "Lower-back",
                        "Glutes",
                        "Lats",
                        "Traps-middle",
                        "Triceps",
                      ]),
                  CustomInput(
                    title: "illness",
                    inputType: InputType.text,
                    controller: illnessController,
                  ),
                  CustomInput(title: "workoutTime", inputType: InputType.text),
                  CustomInput(
                    title: "goal",
                    controller: goalController,
                    inputType: InputType.dropdown,
                    dropdownItems: [
                      "Lose 2 Pounds per Week",
                      "Lose 1.5 Pounds per Week",
                      "Lose 1 Pounds per Week",
                      "Lose 0.5 Pounds per Week",
                      "Stay the Same Weight",
                      "Gain 0.5 Pound per Week",
                      "Gain 1 Pound per Week",
                      "Gain 1.5 Pounds per Week",
                      "Gain 2 Pounds per Week",
                    ],
                  ),
                  Dimensions.verticalSpacingExtraLarge,
                  workoutLoading
                      ? LoadingWidget()
                      : ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              workoutLoading = true;
                            });
                            await generateWorkoutPlan(
                              name: nameController.text,
                              age: ageController.text,
                              sex: sexController.text,
                              height: heightController.text,
                              weight: weightController.text,
                              part: partController.text,
                              illness: illnessController.text,
                              workoutTime: workoutTimeController.text,
                              goal: goalController.text,
                            );
                          },
                          child: Text("Generate a workout plan")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
