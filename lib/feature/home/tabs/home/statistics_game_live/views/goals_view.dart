import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/widgets/image_picker_element_widget.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../../../../l10n/localization.dart';
import '../../../../../../shared/style/app_color.dart';
import '../../../../../../shared/style/dimensions.dart';

class GoalsView extends StatefulWidget {
  final String teamName;
  final Color teamColor;

  const GoalsView({
    super.key,
    required this.teamName,
    required this.teamColor,
  });

  @override
  State<GoalsView> createState() => _GoalsViewState();
}

class _GoalsViewState extends State<GoalsView> {
  XFile? selectedImage1Path;
  XFile? selectedImage2Path;
  XFile? selectedImage3Path;
  XFile? selectedImage4Path;
  XFile? selectedImage5Path;
  XFile? selectedImage6Path;
  XFile? selectedImage7Path;
  XFile? selectedImage8Path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teamName == 'A' ? intl.goalsa : intl.goalsb),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: Dimensions.paddingMedium,
              child: _buildContent(context),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          title: "${intl.goalsTeamTitle1}",
          onImagePicked: (imagePath) => selectedImage1Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          onImagePicked: (imagePath) => selectedImage2Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          onImagePicked: (imagePath) => selectedImage3Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          onImagePicked: (imagePath) => selectedImage4Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          title: "${intl.goalsTeamTitle2}",
          onImagePicked: (imagePath) => selectedImage5Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        Padding(
          padding: Dimensions.paddingSmall,
          child: CustomInput(
            inputType: InputType.text,
            title: "${intl.note}",
            hint: "${intl.leaveNote}",
            minLines: 5,
            maxLines: 5,
          ),
        ),
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          onImagePicked: (imagePath) => selectedImage6Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          onImagePicked: (imagePath) => selectedImage7Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          onImagePicked: (imagePath) => selectedImage8Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        Padding(
          padding: Dimensions.paddingSmall,
          child: CustomInput(
            inputType: InputType.text,
            title: "${intl.comments}",
            hint: "${intl.leaveNote}",
            minLines: 5,
            maxLines: 5,
          ),
        ),
        Dimensions.verticalSpacingMedium,
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      width: double.infinity,
      padding: Dimensions.paddingExtraLarge,
      decoration: BoxDecoration(
        color: AppColors.secondaryBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -3),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {},
              child: Text(intl.save),
            ),
          ),
          Dimensions.horizontalSpacingMedium,
          Expanded(
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {},
              child: Text(intl.print),
            ),
          ),
        ],
      ),
    );
  }
}
