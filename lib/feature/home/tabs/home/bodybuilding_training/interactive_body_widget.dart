import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pedagogue/feature/home/tabs/home/bodybuilding_training/entities/exercise.dart';
import 'package:pedagogue/feature/home/tabs/home/bodybuilding_training/exercises_view.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';
import 'package:xml/xml.dart';

import '../../../../../l10n/localization.dart';
import '../../../../../shared/style/dimensions.dart';
import '../../../../../shared/widget/transition_animation_widget.dart';
import 'entities/body_part.dart';
import 'helpers/clipper.dart';

class InteractiveBodyWidget extends StatelessWidget {
  final String asset;
  final bool isMale;

  const InteractiveBodyWidget({
    super.key,
    required this.asset,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    BodyPart? selectedBodyPart;
    List<BodyPart>? bodyPartList;

    Future<void> loadSvgImage({required String svgImage}) async {
      bodyPartList = [];

      String generalString = await rootBundle.loadString(svgImage);

      XmlDocument document = XmlDocument.parse(generalString);

      for (var group in document.findAllElements('g')) {
        String id = group.getAttribute('id').toString();

        BodyPartId? partId = BodyPartId.values.firstWhereOrNull(
          (e) => e.value == id,
        );

        List<String> pathList = [];
        for (var path in group.findAllElements('path')) {
          String partPath = path.getAttribute('d').toString();
          pathList.add(partPath);
        }

        if (partId != null) {
          bodyPartList?.add(BodyPart(id: partId, pathList: pathList));
        } else {
          if (kDebugMode) print('Body part $id does not exist');
        }
      }
    }

    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: loadSvgImage(svgImage: asset),
      builder: (context, _) {
        if (bodyPartList?.isNotEmpty ?? false) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  TransitionAnimationWidget(
                    child: selectedBodyPart?.id == null
                        ? const SizedBox.shrink()
                        : _buildNavigationRow(context, selectedBodyPart!.id),
                  ),
                  Dimensions.verticalSpacingMedium,
                  Expanded(
                    child: InteractiveViewer(
                      maxScale: 5,
                      minScale: 0.1,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          for (var bodyPart in bodyPartList!)
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: selectedBodyPart != null
                                  ? screenWidth - 85
                                  : screenWidth - 30,
                              child: _getClippedImage(
                                clipper: Clipper(
                                  svgPathList: bodyPart.pathList,
                                ),
                                color: bodyPart.id == BodyPartId.correction
                                    ? Colors.white
                                    : bodyPart.id == BodyPartId.body
                                        ? Colors.black
                                        : selectedBodyPart?.id == bodyPart.id
                                            ? AppColors.primaryColor
                                            : Colors.black.withOpacity(0.2),
                                bodyPart: bodyPart,
                                onBodyPartSelected:
                                    bodyPart.id == BodyPartId.body ||
                                            bodyPart.id == BodyPartId.correction
                                        ? null
                                        : (bodyPart) => setState(
                                              () => selectedBodyPart = bodyPart,
                                            ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  TransitionAnimationWidget(
                    child: selectedBodyPart?.id == null
                        ? const SizedBox.shrink()
                        : Center(
                            child: Padding(
                              padding: Dimensions.paddingMedium,
                              child: Text(
                                '${selectedBodyPart?.id.localizedValue}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              );
            },
          );
        } else {
          return const LoadingWidget(height: 200);
        }
      },
    );
  }

  Widget _buildNavigationRow(BuildContext context, BodyPartId bodyPartId) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Dimensions.horizontalSpacingMedium,
          OutlinedButton(
            child: Text(intl.bodyWeight),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ExercisesView(
                  isMale: isMale,
                  bodyPartId: bodyPartId,
                  exerciseCategory: ExerciseCategory.bodyWeight,
                ),
              ),
            ),
          ),
          Dimensions.horizontalSpacingMedium,
          OutlinedButton(
            child: Text(intl.dumbbells),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ExercisesView(
                  isMale: isMale,
                  bodyPartId: bodyPartId,
                  exerciseCategory: ExerciseCategory.dumbbells,
                ),
              ),
            ),
          ),
          Dimensions.horizontalSpacingMedium,
          OutlinedButton(
            child: Text(intl.barbell),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ExercisesView(
                  isMale: isMale,
                  bodyPartId: bodyPartId,
                  exerciseCategory: ExerciseCategory.barbell,
                ),
              ),
            ),
          ),
          Dimensions.horizontalSpacingMedium,
          OutlinedButton(
            child: Text(intl.stretches),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ExercisesView(
                  isMale: isMale,
                  bodyPartId: bodyPartId,
                  exerciseCategory: ExerciseCategory.stretches,
                ),
              ),
            ),
          ),
          Dimensions.horizontalSpacingMedium,
          OutlinedButton(
            child: Text(intl.band),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ExercisesView(
                  isMale: isMale,
                  bodyPartId: bodyPartId,
                  exerciseCategory: ExerciseCategory.band,
                ),
              ),
            ),
          ),
          Dimensions.horizontalSpacingMedium,
        ],
      ),
    );
  }

  Widget _getClippedImage({
    required Clipper clipper,
    required Color color,
    required BodyPart bodyPart,
    final Function(BodyPart bodyPart)? onBodyPartSelected,
  }) {
    return ClipPath(
      clipper: clipper,
      child: onBodyPartSelected == null
          ? Container(color: color)
          : GestureDetector(
              onTap: () => onBodyPartSelected(bodyPart),
              child: Container(color: color),
            ),
    );
  }
}
