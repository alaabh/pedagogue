import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pedagogue/model/statstic_game_live_model/team_management_model.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../../../../controller/statstic_game_live_controller/team_management_controller.dart';
import '../../../../../../l10n/localization.dart';
import '../../../../../../shared/style/app_color.dart';
import '../../../../../../shared/style/dimensions.dart';
import '../widgets/image_picker_element_widget.dart';

class TeamManagementView extends StatefulWidget {
  final String teamName;
  final Color teamColor;

  TeamManagementView({
    super.key,
    required this.teamName,
    required this.teamColor,
  });

  @override
  State<TeamManagementView> createState() => _TeamManagementViewState();
}

class _TeamManagementViewState extends State<TeamManagementView> {
  String? selectedImage1Path;
  String? selectedImage2Path;
  XFile? imgFile1;
  XFile? imgFile2;
  TextEditingController Comments = TextEditingController();
  final TeamMAnagementController teamMAnagementController =
      Get.put(TeamMAnagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.teamName == 'A'
              ? intl.teamManagementa
              : intl.teamManagementb)),
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
        /*  CustomCardWidget(
          title: "TEAM MANAGEMENT - TEAM ${widget.teamName.toUpperCase()}",
          backgroundColor: Colors.red,
        ), */
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          imgFile: imgFile1,
          titleBackgroundColor: widget.teamColor,
          title: "${intl.mainPlayers}",
          onImagePicked: (file) => imgFile1 = file,
        ),
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          imgFile: imgFile2,
          titleBackgroundColor: widget.teamColor,
          title: "${intl.replacementPlayers}",
          onImagePicked: (file) => imgFile2 = file,
        ),
        Dimensions.verticalSpacingMedium,
        Padding(
          padding: Dimensions.paddingSmall,
          child: CustomInput(
            controller: Comments,
            inputType: InputType.text,
            title: "${intl.comments}",
            hint: "${intl.leavecomment}",
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
              onPressed: () async {
                print(imgFile1!.path);

                print(selectedImage1Path);
                teamMAnagementController.sendAnalysis(
                    TeamManagementModel(
                      image1: File(imgFile1!.path),
                      image2: File(imgFile2!.path),
                      comment: Comments.text,
                    ),
                    widget.teamName == "A"
                        ? "formation/create"
                        : "formationb/create");
              },
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
