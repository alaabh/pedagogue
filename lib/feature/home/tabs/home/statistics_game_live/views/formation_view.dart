import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/widgets/image_picker_element_widget.dart';

import '../../../../../../l10n/localization.dart';
import '../../../../../../shared/style/app_color.dart';
import '../../../../../../shared/style/dimensions.dart';

class FormationView extends StatefulWidget {
  const FormationView({super.key});

  @override
  State<FormationView> createState() => _FormationViewState();
}

class _FormationViewState extends State<FormationView> {
  XFile? selectedImage1Path;
  XFile? selectedImage2Path;
  XFile? selectedImage3Path;
  XFile? selectedImage4Path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.foramtionAB),
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
          title: "${intl.team} (${intl.a}) – ${intl.formatonABTitle1}",
          titleBackgroundColor: AppColors.teamAColor,
          onImagePicked: (imagePath) => selectedImage1Path = imagePath,
        ),
        ImagePickerElementWidget(
          title: "${intl.team} (${intl.a}) – ${intl.formatonABTitle2}",
          titleBackgroundColor: AppColors.teamAColor,
          onImagePicked: (imagePath) => selectedImage2Path = imagePath,
        ),
        ImagePickerElementWidget(
          title: "${intl.team} (${intl.b}) – ${intl.formatonABTitle1}",
          titleBackgroundColor: AppColors.teamBColor,
          onImagePicked: (imagePath) => selectedImage3Path = imagePath,
        ),
        ImagePickerElementWidget(
          title: "${intl.team} (${intl.b}) – ${intl.formatonABTitle2}",
          titleBackgroundColor: AppColors.teamBColor,
          onImagePicked: (imagePath) => selectedImage4Path = imagePath,
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
