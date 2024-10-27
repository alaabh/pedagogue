import '../../../../../../l10n/localization.dart';

class BodyPart {
  BodyPartId id;
  List<String> pathList;

  BodyPart({
    required this.id,
    required this.pathList,
  });
}

enum BodyPartId {
  // Front
  abdominal('abdominal'),
  obliques('obliques'),
  forearms('forearms'),
  biceps('biceps'),
  shoulders('shoulders'),
  traps('traps'),
  chest('chest'),
  quads('quads'),
  calves('calves'),
  hamstrings('hamstrings'),
  lowerBack('lower-back'),
  glutes('glutes'),
  lats('lats'),
  trapsMiddle('traps-middle'),
  triceps('triceps'),
  body('body'),
  correction('correction');

  final String value;

  const BodyPartId(this.value);
}

extension BodyPartIdExtension on BodyPartId {
  String get localizedValue {
    switch (this) {
      case BodyPartId.abdominal:
        return intl.abdominal;
      case BodyPartId.obliques:
        return intl.obliques;
      case BodyPartId.forearms:
        return intl.forearms;
      case BodyPartId.biceps:
        return intl.biceps;
      case BodyPartId.shoulders:
        return intl.shoulders;
      case BodyPartId.traps:
        return intl.traps;
      case BodyPartId.chest:
        return intl.chest;
      case BodyPartId.quads:
        return intl.quads;
      case BodyPartId.calves:
        return intl.calves;
      case BodyPartId.hamstrings:
        return intl.hamstrings;
      case BodyPartId.lowerBack:
        return intl.lowerBack;
      case BodyPartId.glutes:
        return intl.glutes;
      case BodyPartId.lats:
        return intl.lats;
      case BodyPartId.trapsMiddle:
        return intl.trapsMiddle;
      case BodyPartId.triceps:
        return intl.triceps;
      default:
        return value;
    }
  }
}
