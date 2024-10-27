import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:im_stepper/stepper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pedagogue/feature/Coatching/Exercices/stepOne.dart';
import 'package:pedagogue/feature/Coatching/Exercices/stepTrie.dart';
import 'package:pedagogue/feature/Coatching/Exercices/stepTwo.dart';

import '../../../controller/Exercice_controller.dart';
import '../../../l10n/localization.dart';
import '../../../l10n/localization_controller.dart';
import '../../../model/exercice_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'ListeExercice.dart';

class CreateExerciceScreen extends StatefulWidget {
  final Exercise? exercise;

  const CreateExerciceScreen({super.key, this.exercise});

  @override
  State<CreateExerciceScreen> createState() => _CreateExerciceScreenState();
}

class _CreateExerciceScreenState extends State<CreateExerciceScreen> {
  int activeStep = 0;
  int upperBound = 2;
  TextEditingController _NameController = TextEditingController();
  TextEditingController _PartController =
      TextEditingController(); // Corrected variable name
  TextEditingController _gameStageController =
      TextEditingController(); // Corrected variable name
  TextEditingController _themeController =
      TextEditingController(); // Corrected variable name
  TextEditingController _CategoryController = TextEditingController();
  TextEditingController _pedagoyController =
      TextEditingController(); // Corrected variable name
  TextEditingController _TotalDuarationController = TextEditingController();
  TextEditingController _NumberrepetitionsController = TextEditingController();
  TextEditingController _NumberofseriesController = TextEditingController();
  TextEditingController _WorktimeController = TextEditingController();
  TextEditingController _ReposController = TextEditingController();
  TextEditingController _IntensityController = TextEditingController();
  TextEditingController _dimentionObjectiveController = TextEditingController();
  TextEditingController _instructionEvolutionController =
      TextEditingController();
  TextEditingController _expectedBihavorController = TextEditingController();
  XFile? imgFile;
  double? ratings;

  String getKeyForValue(String value, Map<String, String> list) {
    for (var entry in list.entries) {
      if (entry.value == value) {
        return entry.key;
      }
    }
    return "";
  }

  String getValueForKey(String key, Map<String, String> list) {
    for (var entry in list.entries) {
      if (entry.key == key) {
        return entry.value;
      }
    }
    return "";
  }

  exerciceController eexerciceController = exerciceController();
  Future<void> submit() async {
    print(imgFile!.path);
    print(ratings);
    print(_NameController.text);
    FocusManager.instance.primaryFocus?.unfocus();

    Exercise exerciseModel = Exercise(
      id: widget.exercise?.id,
      rating: ratings,
      name: _NameController.text,
      part: getValueForKey(
          getKeyForValue(
              _PartController.text,
              LocalizationController.locale.value == Localization.localeArabic
                  ? partCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? partCoachingFr
                      : partCoachingEn),
          partCoachingEn),
      gameStage: getValueForKey(
          getKeyForValue(
              _gameStageController.text,
              LocalizationController.locale.value == Localization.localeArabic
                  ? gameStageCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? gameStageCoachingFr
                      : gameStageCoachingEn),
          gameStageCoachingEn),
      theme: getValueForKey(
          getKeyForValue(
              _themeController.text,
              LocalizationController.locale.value == Localization.localeArabic
                  ? themeCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? themeCoachingFr
                      : themeCoachingEn),
          themeCoachingEn),
      categories: _CategoryController.text,
      pedagogy: getValueForKey(
          getKeyForValue(
              _pedagoyController.text,
              LocalizationController.locale.value == Localization.localeArabic
                  ? pedagogyCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? pedagogyCoachingFr
                      : pedagogyCoachingEn),
          pedagogyCoachingEn),
      totalDuration: _TotalDuarationController.text,
      dimension: _dimentionObjectiveController.text,
      instruction: _instructionEvolutionController.text,
      expected: _expectedBihavorController.text,
      workTime: _WorktimeController.text,
      repos: _ReposController.text,
      intensity: getValueForKey(
          getKeyForValue(
              _IntensityController.text,
              LocalizationController.locale.value == Localization.localeArabic
                  ? intensityCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? intensityCoachingFr
                      : intensityCoachingEn),
          intensityCoachingEn),
      numberOfRepetitions: _NumberrepetitionsController.text,
    );

    widget.exercise == null
        ? ApiViewHandler.withAlert(
            context: context,
            apiCall: eexerciceController.add(
              exerciseModel,
              multipartParamName: 'image',
              imagePathList: [imgFile!.path],
            ),
            successFunction: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ListeExercice(),
              ),
            ),
          )
        : ApiViewHandler.withAlert(
            context: context,
            apiCall: eexerciceController.update(
              exerciseModel,
              multipartParamName: 'image',
              imagePathList: [imgFile!.path],
            ),
            successFunction: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ListeExercice(),
              ),
            ),
          );
    ;
  }

  Future<XFile> imageFromUrl(String imageUrl) async {
    try {
      // Fetching the image from the URL
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // Getting temporary directory
        final documentDirectory = await getTemporaryDirectory();

        // File path in the temporary directory
        final filePath = documentDirectory.path + '/temp_image';

        // Saving the image as a file
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        // Converting File to XFile
        final xFile = XFile(file.path);

        return xFile;
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      throw Exception('Error fetching image: $e');
    }
  }

  void loadImage(String id) async {
    print(id);
    try {
      imgFile = await imageFromUrl(
          'https://back.sportspedagogue.com/images_video/$id');
      print('Image saved as XFile with path: ${imgFile?.path}');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    LocalizationController.locale.value == Localization.localeArabic;
    if (widget.exercise != null) {
      _NameController =
          TextEditingController(text: widget.exercise!.name.toString());
      _PartController = TextEditingController(
          text: getValueForKey(
              getKeyForValue(widget.exercise!.part.toString(), partCoachingEn),
              LocalizationController.locale.value == Localization.localeArabic
                  ? partCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? partCoachingFr
                      : partCoachingEn)); // Corrected variable name
      _gameStageController = TextEditingController(
          text: getValueForKey(
              getKeyForValue(
                  widget.exercise!.gameStage.toString(), gameStageCoachingEn),
              LocalizationController.locale.value == Localization.localeArabic
                  ? gameStageCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? gameStageCoachingFr
                      : gameStageCoachingEn)); // Corrected variable name
      _themeController = TextEditingController(
          text: getValueForKey(
              getKeyForValue(
                  widget.exercise!.theme.toString(), themeCoachingEn),
              LocalizationController.locale.value == Localization.localeArabic
                  ? themeCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? themeCoachingFr
                      : themeCoachingEn)); // Corrected variable name
      _CategoryController =
          TextEditingController(text: widget.exercise!.categories.toString());
      _pedagoyController = TextEditingController(
          text: getValueForKey(
              getKeyForValue(
                  widget.exercise!.pedagogy.toString(), pedagogyCoachingEn),
              LocalizationController.locale.value == Localization.localeArabic
                  ? pedagogyCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? pedagogyCoachingFr
                      : pedagogyCoachingEn)); // Corrected variable name
      _TotalDuarationController = TextEditingController(
          text: widget.exercise!.totalDuration.toString());
      _NumberrepetitionsController = TextEditingController(
          text: widget.exercise!.numberOfRepetitions.toString());
      _NumberofseriesController = TextEditingController(
          text: widget.exercise!.numberOfSeries.toString());
      _WorktimeController =
          TextEditingController(text: widget.exercise!.workTime.toString());
      _ReposController =
          TextEditingController(text: widget.exercise!.repos.toString());
      _IntensityController = TextEditingController(
          text: getValueForKey(
              getKeyForValue(
                  widget.exercise!.intensity.toString(), intensityCoachingEn),
              LocalizationController.locale.value == Localization.localeArabic
                  ? intensityCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? intensityCoachingFr
                      : intensityCoachingEn));
      _dimentionObjectiveController =
          TextEditingController(text: widget.exercise!.dimension.toString());
      _instructionEvolutionController =
          TextEditingController(text: widget.exercise!.instruction.toString());
      _expectedBihavorController =
          TextEditingController(text: widget.exercise!.expected.toString());

      ratings = double.parse(widget.exercise!.rating.toString());
      widget.exercise!.image == null
          ? imgFile = XFile("")
          : loadImage(widget.exercise!.image);
    }
    print("${widget.exercise}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${intl.addexercise}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconStepper(
              icons: [
                Icon(Icons.looks_one),
                Icon(Icons.looks_two_rounded),
                Icon(Icons.looks_3_rounded),
              ],
              activeStep: activeStep,
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            header(),
            Expanded(
              child: stepInterface(activeStep),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                previousButton(),
                activeStep == 2
                    ? CustomButton(
                        onPressed: () {
                          submit();
                        },
                        text: '${intl.save}',
                        width: MediaQuery.of(context).size.width * 0.18,
                      )
                    : nextButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('${intl.next}'),
    );
  }

  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('${intl.back}'),
    );
  }

  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget stepInterface(int step) {
    switch (step) {
      case 0:
        return StepOneExercice(
          nameController: _NameController,
          partController: _PartController,
          gameStageController: _gameStageController,
          themeController: _themeController,
          categoryController: _CategoryController,
          pedagoyController: _pedagoyController,
          totalDuarationController: _TotalDuarationController,
          numberrepetitionsController: _NumberrepetitionsController,
          numberofseriesController: _NumberofseriesController,
          worktimeController: _WorktimeController,
          reposController: _ReposController,
          intensityController: _IntensityController,
          onRatingChange: (rating) => ratings = rating,
        );
      case 1:
        return stepTwoExercice(
          dimentionObjectiveController: _dimentionObjectiveController,
          instructionEvolutionController: _instructionEvolutionController,
          expectedBihavorController: _expectedBihavorController,
        );
      case 2:
        return stepTrieExercice(
          imgFile: imgFile,
          onImagePicked: (file) => imgFile = file,
        );
      default:
        return Container();
    }
  }

  String headerText() {
    switch (activeStep) {
      case 0:
        return '${intl.step1}';
      case 1:
        return '${intl.step2}';
      case 2:
        return '${intl.step3}';
      default:
        return 'Introduction';
    }
  }
}

Map<String, String> pedagogyCoachingEn = {
  "pedagogyCoaching1": "active",
  "pedagogyCoaching2": "guideline",
};
Map<String, String> pedagogyCoachingFr = {
  "pedagogyCoaching1": "actif",
  "pedagogyCoaching2": "ligne directrice",
};
Map<String, String> pedagogyCoachingAr = {
  "pedagogyCoaching1": "نشط",
  "pedagogyCoaching2": "الارشادات",
};

Map<String, String> intensityCoachingEn = {
  "intensityCoaching1": "weak",
  "intensityCoaching2": "mean",
  "intensityCoaching3": "high"
};
Map<String, String> intensityCoachingFr = {
  "intensityCoaching1": "Faible",
  "intensityCoaching2": "Moyenne",
  "intensityCoaching3": "Élevé"
};
Map<String, String> intensityCoachingAr = {
  "intensityCoaching1": "ضعيف",
  "intensityCoaching2": "معدل",
  "intensityCoaching3": "قوي"
};

Map<String, String> themeCoachingEn = {
  "themeCoaching1": "coordination",
  "themeCoaching2": "endurance",
  "themeCoaching3": "bodybuilding",
  "themeCoaching4": "speed",
  "themeCoaching5": "control",
  "themeCoaching6": "crosses and retakes",
  "themeCoaching7": "conduct",
  "themeCoaching8": "the pass",
  "themeCoaching9": "aerial game",
  "themeCoaching10": "defensive techniques",
  "themeCoaching11": "the shot",
  "themeCoaching12": "team block",
  "themeCoaching13": "land use",
  "themeCoaching14": "transition off > def",
  "themeCoaching15": "transition Set > Off",
  "themeCoaching16": "set kick",
  "themeCoaching166": "opposite game Support - support - handover",
  "themeCoaching17": "game at 2. at 3",
  "themeCoaching18": "side game",
  "themeCoaching19": "pressing / pressing area",
  "themeCoaching20": "recovery",
  "themeCoaching21": "stretching",
  "themeCoaching22": "conservation",
  "themeCoaching23": "duel",
  "themeCoaching24": "cohesion",
};
Map<String, String> themeCoachingFr = {
  "themeCoaching1": "Coordination",
  "themeCoaching2": "Endurance",
  "themeCoaching3": "la musculation",
  "themeCoaching4": "vitesse",
  "themeCoaching5": "contrôle",
  "themeCoaching6": "croise et reprend",
  "themeCoaching7": "conduire",
  "themeCoaching8": "la passe",
  "themeCoaching9": "jeu aérien",
  "themeCoaching10": "technique défensive",
  "themeCoaching11": "le tir",
  "themeCoaching12": "bloc d'équipe",
  "themeCoaching13": "l'utilisation des terres",
  "themeCoaching14": "transition désactivée > def",
  "themeCoaching15": "transition désactivée < def",
  "themeCoaching16": "donner un coup de pied",
  "themeCoaching166": "jeu opposé Accompagnement - accompagnement - passation",
  "themeCoaching17": "jeu à 2. à 3",
  "themeCoaching18": "jeu parallèle",
  "themeCoaching19": "pressage / zone de pressage",
  "themeCoaching20": "récupération",
  "themeCoaching21": "élongation",
  "themeCoaching22": "conservation",
  "themeCoaching23": "duel",
  "themeCoaching24": "cohésion",
};
Map<String, String> themeCoachingAr = {
  "themeCoaching1": "التوافق",
  "themeCoaching2": "المداومة",
  "themeCoaching3": "التقوية",
  "themeCoaching4": "السرعة",
  "themeCoaching5": "التحك",
  "themeCoaching6": "العبور و الاستجابة",
  "themeCoaching7": "الجري بالكرة",
  "themeCoaching8": "التمرير",
  "themeCoaching9": "اللعب الفضائي",
  "themeCoaching10": "فنية دفاعية",
  "themeCoaching11": "التصويب",
  "themeCoaching12": "كتلة الفريق",
  "themeCoaching13": "اللعب الارضي",
  "themeCoaching14": "التحول من الوضعية الهجومية الى الوضعية الدفاعية",
  "themeCoaching15": "التحول من الوضعية الدفاعية الى الوضعية الهجومية",
  "themeCoaching16": "الكرات الثابتة",
  "themeCoaching166": "اللعب العكسي",
  "themeCoaching17": "اللعب ب2 و 3",
  "themeCoaching18": "اللعب المتوازي",
  "themeCoaching19": "الظغط و منطقة الظغط",
  "themeCoaching20": "استرجاع الكرة",
  "themeCoaching21": "اللعب الطولي",
  "themeCoaching22": "الاحتفاظ بالكرة",
  "themeCoaching23": "الثنائيات",
  "themeCoaching24": "تماسك الفريق",
};

Map<String, String> gameStageCoachingEn = {
  "gameStageCoaching1": "unbalance / finish",
  "gameStageCoaching2": "Oppose",
  "gameStageCoaching3": "keep",
  "gameStageCoaching4": "Protecting his goal",
  "gameStageCoaching5": "Progress",
  "gameStageCoaching6": "Ball recovery",
};
Map<String, String> gameStageCoachingFr = {
  "gameStageCoaching1": "déséquilibre / finition",
  "gameStageCoaching2": "S'opposer",
  "gameStageCoaching3": "Continuer",
  "gameStageCoaching4": "Protéger son objectif",
  "gameStageCoaching5": "Progrès",
  "gameStageCoaching6": "Récupération de balle",
};
Map<String, String> gameStageCoachingAr = {
  "gameStageCoaching1": "عدم التوازن / الانتهاء",
  "gameStageCoaching2": "التضاد",
  "gameStageCoaching3": "الاستمرار",
  "gameStageCoaching4": "حماية الهدف",
  "gameStageCoaching5": "التطوير",
  "gameStageCoaching6": "استرجاع الكرة",
};
Map<String, String> partCoachingEn = {
  "partCoaching1": "warming up",
  "partCoaching2": "athletic",
  "partCoaching3": "technical",
  "partCoaching4": "tactical",
  "partCoaching5": "mental",
};
Map<String, String> partCoachingFr = {
  "partCoaching1": "échauffement",
  "partCoaching2": "athlétique",
  "partCoaching3": "technique",
  "partCoaching4": "tactique",
  "partCoaching5": "mental",
};
Map<String, String> partCoachingAr = {
  "partCoaching1": "الاحماء",
  "partCoaching2": "لياقي",
  "partCoaching3": "فني",
  "partCoaching4": "تكتيكي",
  "partCoaching5": "ذهني",
};
