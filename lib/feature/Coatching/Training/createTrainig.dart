import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:pedagogue/feature/Coatching/Training/trainigListe.dart';
import 'package:pedagogue/shared/widget/customTextField.dart';

import '../../../controller/coaching1_controller.dart';
import '../../../controller/sessions_controller.dart';
import '../../../l10n/localization.dart';
import '../../../l10n/localization_controller.dart';
import '../../../model/coachng1_model.dart';
import '../../../shared/style/dimensions.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_input.dart';
import '../../../utils/resources/api/api_view_handler.dart';

class CreateTraing extends StatefulWidget {
  final Coaching1? coaching;
  const CreateTraing({super.key, this.coaching});

  @override
  State<CreateTraing> createState() => _CreateTaingState();
}

class _CreateTaingState extends State<CreateTraing> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _NameController = TextEditingController();
  TextEditingController _placeController = TextEditingController();

  TextEditingController _theme2Controller = TextEditingController();
  TextEditingController _gameStgeController = TextEditingController();
  TextEditingController _themeController = TextEditingController();
  TextEditingController _CategoryController = TextEditingController();
  TextEditingController _ListeExercicesController = TextEditingController();
  TextEditingController _DateController = TextEditingController();
  TextEditingController _TimeController = TextEditingController();
  int rate = 0;
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

  @override
  void initState() {
    loadData();
    //print(widget.coaching?.id);
    if (widget.coaching != null) {
      rate = widget.coaching?.rating ?? 0;
      //rate = widget.coaching == null ? 0 : widget.coaching!.rating;
      _NameController =
          TextEditingController(text: widget.coaching?.name.toString());
      _placeController =
          TextEditingController(text: widget.coaching?.place.toString());
      _gameStgeController = TextEditingController(
          text: getValueForKey(
              getKeyForValue(widget.coaching?.game_stage, gameStageCoachingEn),
              LocalizationController.locale.value == Localization.localeArabic
                  ? gameStageCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? gameStageCoachingFr
                      : gameStageCoachingEn));

      _theme2Controller = TextEditingController(
          text: getValueForKey(
              getKeyForValue(widget.coaching?.theme_2, themeCoachingEn),
              LocalizationController.locale.value == Localization.localeArabic
                  ? themeCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? themeCoachingFr
                      : themeCoachingEn)); // Corrected variable name
      _themeController = TextEditingController(
          text: getValueForKey(
              getKeyForValue(widget.coaching?.theme, themeCoachingEn),
              LocalizationController.locale.value == Localization.localeArabic
                  ? themeCoachingAr
                  : LocalizationController.locale.value ==
                          Localization.localeFrench
                      ? themeCoachingFr
                      : themeCoachingEn)); // Corrected variable name

      _TimeController = TextEditingController();

      _DateController = TextEditingController(
          text: widget.coaching == null
              ? null
              : convertDateTime(
                  widget.coaching!.date.toString())); // Corrected variable name
      _ListeExercicesController = TextEditingController();
    }

    super.initState();
  }

  @override
  void dispose() {
    _NameController.dispose();

    _theme2Controller.dispose(); // Corrected variable name
    _themeController.dispose(); // Corrected variable name
    _CategoryController.dispose();
    _gameStgeController.dispose(); // Corrected variable name
    _ListeExercicesController.dispose(); // Corrected variable name

    super.dispose();
  }

  SessionsController sessionsController = SessionsController();
  List<ValueItem> sessionssList = [];
  List<ValueItem> selectedSessionsList = [];
  Future<void> loadData() async {
    await sessionsController.getAll();

    setState(() {
      for (var element in sessionsController.apiResponse.value.itemList) {
        sessionssList
            .add(ValueItem(label: element.name.toString(), value: element.id));

        _ListSessionscontroller.setOptions(sessionssList);
      }
      if (widget.coaching != null) {
        for (var element in widget.coaching?.sessions) {
          selectedSessionsList.add(ValueItem(
              label: element['name'].toString(), value: element['id']));

          _ListSessionscontroller.setSelectedOptions(selectedSessionsList);
        }
      }
    });
  }

  String convertDateFormat(String originalDateString) {
    // Parse the original string to a DateTime object
    DateTime dateTimeTime = DateFormat('dd/MM/yyyy').parse(originalDateString);

    // Format the DateTime object to the desired string format
    String formattedDateString = DateFormat('yyyy-MM-dd').format(dateTimeTime);

    return formattedDateString;
  }

  String convertDateTime(String dateTimeTimeString) {
    // Parse the string into a DateTime object
    DateTime dateTimeTime = DateTime.parse(dateTimeTimeString);

    // Create a DateFormat to format the DateTime object
    DateFormat dateTimeFormat = DateFormat('yyyy-M-d');

    // Format the DateTime object to only include the dateTime
    String formattedDate = dateTimeFormat.format(dateTimeTime);

    return formattedDate;
  }

  Future<void> submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    //if (!(_formKey.currentState?.validateTime() ?? false)) return;
    List<String> values = _ListSessionscontroller.selectedOptions
        .map((element) => element.value.toString())
        .toList();
    String concatenatedValues = values.join(', ');
    Coaching1 coachingModel = Coaching1(
        id: widget.coaching?.id,
        name: _NameController.text,
        rating: rate,
        session_id: concatenatedValues,
        date: convertDateFormat(_DateController.text),
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
        theme_2: getValueForKey(
            getKeyForValue(
                _theme2Controller.text,
                LocalizationController.locale.value == Localization.localeArabic
                    ? themeCoachingAr
                    : LocalizationController.locale.value ==
                            Localization.localeFrench
                        ? themeCoachingFr
                        : themeCoachingEn),
            themeCoachingEn),
        game_stage: getValueForKey(
            getKeyForValue(
                _gameStgeController.text,
                LocalizationController.locale.value == Localization.localeArabic
                    ? gameStageCoachingAr
                    : LocalizationController.locale.value ==
                            Localization.localeFrench
                        ? gameStageCoachingFr
                        : gameStageCoachingEn),
            gameStageCoachingEn));
    print(coachingModel.toJson());

    widget.coaching == null
        ? ApiViewHandler.withAlert(
            context: context,
            apiCall: coachingController.add(
              coachingModel,
            ),
            successFunction: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TrainingList(),
              ),
            ),
          )
        : ApiViewHandler.withAlert(
            context: context,
            apiCall: coachingController.update(
              coachingModel,
            ),
            successFunction: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TrainingList(),
              ),
            ),
          );
  }

  final MultiSelectController<dynamic> _ListSessionscontroller =
      MultiSelectController();
  Coaching1Controller coachingController = Coaching1Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${intl.create} ${intl.coachingTraining}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Dimensions.verticalSpacingSmall,
                RatingBar.builder(
                  allowHalfRating: true,
                  initialRating: rate.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 50,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      rate = rating.toInt();
                    });
                  },
                ),
                Dimensions.verticalSpacingSmall,
                CustomTextField(
                  hintText: '${intl.name}',
                  labelText: '${intl.name}',
                  controller: _NameController, // Pass the controller here
                ),
                Dimensions.verticalSpacingSmall,
                CustomTextField(
                  hintText: '${intl.place}',
                  labelText: '${intl.place}',
                  controller: _placeController, // Pass the controller here
                ),
                Dimensions.verticalSpacingSmall,
                CustomInput(
                  inputType: InputType.dropdown,
                  controller: _themeController,
                  dropdownItems: [
                    "${intl.themeCoaching1}",
                    "${intl.themeCoaching2}",
                    "${intl.themeCoaching3}",
                    "${intl.themeCoaching4}",
                    "${intl.themeCoaching5}",
                    "${intl.themeCoaching6}",
                    "${intl.themeCoaching7}",
                    "${intl.themeCoaching8}",
                    "${intl.themeCoaching9}",
                    "${intl.themeCoaching10}",
                    "${intl.themeCoaching11}",
                    "${intl.themeCoaching12}",
                    "${intl.themeCoaching13}",
                    "${intl.themeCoaching14}",
                    "${intl.themeCoaching15}",
                    "${intl.themeCoaching16}",
                    "${intl.themeCoaching17}",
                    "${intl.themeCoaching18}",
                    "${intl.themeCoaching19}",
                    "${intl.themeCoaching20}",
                    "${intl.themeCoaching21}",
                    "${intl.themeCoaching22}",
                    "${intl.themeCoaching23}",
                    "${intl.themeCoaching24}",
                  ],
                  title: '${intl.theme}',
                ),
                Dimensions.verticalSpacingSmall,
                CustomInput(
                  inputType: InputType.dropdown,
                  controller: _theme2Controller,
                  dropdownItems: [
                    "${intl.themeCoaching1}",
                    "${intl.themeCoaching2}",
                    "${intl.themeCoaching3}",
                    "${intl.themeCoaching4}",
                    "${intl.themeCoaching5}",
                    "${intl.themeCoaching6}",
                    "${intl.themeCoaching7}",
                    "${intl.themeCoaching8}",
                    "${intl.themeCoaching9}",
                    "${intl.themeCoaching10}",
                    "${intl.themeCoaching11}",
                    "${intl.themeCoaching12}",
                    "${intl.themeCoaching13}",
                    "${intl.themeCoaching14}",
                    "${intl.themeCoaching15}",
                    "${intl.themeCoaching16}",
                    "${intl.themeCoaching166}",
                    "${intl.themeCoaching17}",
                    "${intl.themeCoaching18}",
                    "${intl.themeCoaching19}",
                    "${intl.themeCoaching20}",
                    "${intl.themeCoaching21}",
                    "${intl.themeCoaching22}",
                    "${intl.themeCoaching23}",
                    "${intl.themeCoaching24}",
                  ],
                  title: '${intl.theme}2',
                ),
                Dimensions.verticalSpacingSmall,
                Dimensions.verticalSpacingSmall,
                CustomInput(
                  inputType: InputType.dropdown,
                  controller: _gameStgeController,
                  dropdownItems: [
                    "${intl.gameStageCoaching1}",
                    "${intl.gameStageCoaching2}",
                    "${intl.gameStageCoaching3}",
                    "${intl.gameStageCoaching4}",
                    "${intl.gameStageCoaching5}",
                    "${intl.gameStageCoaching6}",
                  ],
                  title: '${intl.gamestage}',
                ),
                Dimensions.verticalSpacingSmall,
                CustomInput(
                  controller: _DateController,
                  inputType: InputType.date,
                  title: '${intl.date}',
                ),
                Dimensions.verticalSpacingSmall,
                CustomInput(
                  controller: _TimeController,
                  inputType: InputType.time,
                  title: '${intl.time}',
                ),
                Dimensions.verticalSpacingSmall,
                Row(
                  children: [
                    Text(intl.listsessions,
                        style: TextStyle(
                          fontSize: 16.0, // Replace with your desired font size
                        )),
                  ],
                ),
                Dimensions.verticalSpacingSmall,
                MultiSelectDropDown(
                  hint: '${intl.listsessions}',
                  controller: _ListSessionscontroller,
                  selectedOptions: [],
                  onOptionSelected: (options) {
                    debugPrint(options.toString());
                  },
                  options: sessionssList,
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  dropdownHeight: 300,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
                Dimensions.verticalSpacingSmall,
                CustomButton(
                  onPressed: () {
                    submit();
                  },
                  text: '${intl.save}',
                  width: MediaQuery.of(context).size.width * 0.18,
                ),
                Dimensions.verticalSpacingSmall,
              ],
            ),
          ),
        ),
      ),
    );
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
