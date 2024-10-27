import 'package:flutter/material.dart';
import 'package:pedagogue/constants/env.dart';
import 'package:pedagogue/feature/home/tabs/home/bodybuilding_training/entities/exercise.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/shared/widget/video_player_widget.dart';

class ExerciseWidget extends StatelessWidget {
  final Exercise exercise;

  const ExerciseWidget({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: Dimensions.paddingLarge,
      child: Padding(
        padding: Dimensions.paddingMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                exercise.title,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Dimensions.verticalSpacingExtraLarge,
            Text(
              '${intl.doubleDotPlaceholder(intl.difficulty)}'
              '${exercise.difficulty.localizedValue}',
            ),
            Dimensions.verticalSpacingMedium,
            Row(
              children: [
                Expanded(
                  child: VideoPlayerWidget(
                    filename: exercise.video1Filename,
                    baseUrl: videoWebUrl,
                    height: 94,
                    showControls: false,
                    volume: 0,
                    videoViewerOnTap: true,
                  ),
                ),
                Dimensions.horizontalSpacingMedium,
                Expanded(
                  child: VideoPlayerWidget(
                    filename: exercise.video2Filename,
                    baseUrl: videoWebUrl,
                    height: 94,
                    showControls: false,
                    volume: 0,
                    videoViewerOnTap: true,
                  ),
                ),
              ],
            ),
            for (int index = 0; index < exercise.steps.length; index++)
              Padding(
                padding: Dimensions.paddingMediumVertical,
                child: Stack(
                  children: [
                    Container(
                      constraints: const BoxConstraints(minHeight: 40),
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsetsDirectional.only(start: 20),
                      padding: const EdgeInsetsDirectional.only(start: 30),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: Dimensions.mediumBorderRadius,
                      ),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Text(exercise.steps[index]),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.textColor,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: AppColors.textColorInverted,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
