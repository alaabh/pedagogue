import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/tabs/home/bodybuilding_training/interactive_body_widget.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/assets.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

import '../../../../../l10n/localization.dart';

class BodyBuildingTrainingView extends StatefulWidget {
  const BodyBuildingTrainingView({super.key});

  @override
  State<BodyBuildingTrainingView> createState() =>
      _BodyBuildingTrainingViewState();
}

class _BodyBuildingTrainingViewState extends State<BodyBuildingTrainingView> {
  bool isMale = true;
  bool isFront = true;

  String resolveAsset() {
    if (isMale) {
      if (isFront) {
        return Assets.manBodyFront;
      } else {
        return Assets.manBodyBack;
      }
    } else {
      if (isFront) {
        return Assets.womanBodyFront;
      } else {
        return Assets.womanBodyBack;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(intl.bodyBuildingTraining)),
      body: Column(
        children: [
          Expanded(
            child: InteractiveBodyWidget(
              asset: resolveAsset(),
              isMale: isMale,
            ),
          ),
          _buildBodySelectionWidget(),
          _buildGenderSelectionWidget(),
        ],
      ),
    );
  }

  Widget _buildBodySelectionWidget() {
    return Row(
      children: [
        Dimensions.horizontalSpacingMedium,
        Expanded(
          child: FilledButton.icon(
            onPressed: () => setState(() => isFront = true),
            label: Text(intl.front),
            icon: const Icon(Icons.tag_faces_outlined),
            style: FilledButton.styleFrom(
              backgroundColor: isFront ? AppColors.primaryColor : Colors.grey,
            ),
          ),
        ),
        Dimensions.horizontalSpacingMedium,
        Expanded(
          child: FilledButton.icon(
            onPressed: () => setState(() => isFront = false),
            label: Text(intl.back),
            icon: const Icon(Icons.circle_outlined),
            style: FilledButton.styleFrom(
              backgroundColor: !isFront ? AppColors.primaryColor : Colors.grey,
            ),
          ),
        ),
        Dimensions.horizontalSpacingMedium,
      ],
    );
  }

  Widget _buildGenderSelectionWidget() {
    return Row(
      children: [
        Dimensions.horizontalSpacingMedium,
        Expanded(
          child: FilledButton.icon(
            onPressed: () => setState(() => isMale = true),
            label: Text(intl.male),
            icon: const Icon(Icons.male),
            style: FilledButton.styleFrom(
              backgroundColor: isMale ? AppColors.primaryColor : Colors.grey,
            ),
          ),
        ),
        Dimensions.horizontalSpacingMedium,
        Expanded(
          child: FilledButton.icon(
            onPressed: () => setState(() => isMale = false),
            label: Text(intl.female),
            icon: const Icon(Icons.female),
            style: FilledButton.styleFrom(
              backgroundColor: !isMale ? AppColors.primaryColor : Colors.grey,
            ),
          ),
        ),
        Dimensions.horizontalSpacingMedium,
      ],
    );
  }
}
