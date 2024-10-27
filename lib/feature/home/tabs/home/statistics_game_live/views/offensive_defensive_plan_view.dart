import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pedagogue/feature/home/tabs/home/statistics_game_live/widgets/image_picker_element_widget.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../../../../l10n/localization.dart';
import '../../../../../../shared/style/app_color.dart';
import '../../../../../../shared/style/dimensions.dart';

class OffensiveDefensivePlanView extends StatefulWidget {
  final String teamName;
  final Color teamColor;

  const OffensiveDefensivePlanView({
    super.key,
    required this.teamName,
    required this.teamColor,
  });

  @override
  State<OffensiveDefensivePlanView> createState() =>
      _OffensiveDefensivePlanViewState();
}

class _OffensiveDefensivePlanViewState
    extends State<OffensiveDefensivePlanView> {
  XFile? selectedImage1Path;
  XFile? selectedImage2Path;
  String? teamnom = "";

  @override
  void initState() {
    // TODO: implement initState
    widget.teamName == 'A' ? teamnom = intl.a : teamnom = intl.b;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teamName == 'A'
            ? intl.offensiveDefensivea
            : intl.offensiveDefensiveb),
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
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          title: "${intl.team} ($teamnom) – "
              "${intl.startAttackingFormation}",
          onImagePicked: (imagePath) => selectedImage1Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          title: "${intl.team} ($teamnom) – "
              "${intl.startDefendingFormation}",
          onImagePicked: (imagePath) => selectedImage2Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        Padding(
          padding: Dimensions.paddingSmall,
          child: Row(
            children: [
              Expanded(flex: 1, child: Text("N°")),
              Dimensions.horizontalSpacingMedium,
              Expanded(flex: 3, child: Text("${intl.playersFullName}")),
            ],
          ),
        ),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        Dimensions.verticalSpacingMedium,
        Padding(
          padding: Dimensions.paddingSmall,
          child: CustomInput(
            inputType: InputType.text,
            hint: "${intl.leavecomment}",
            title: "${intl.comments}",
            minLines: 5,
            maxLines: 5,
          ),
        ),
        Padding(
          padding: Dimensions.paddingSmall,
          child: Row(
            children: [
              Expanded(flex: 1, child: Text("N°")),
              Dimensions.horizontalSpacingMedium,
              Expanded(flex: 3, child: Text("${intl.playersFullName}")),
            ],
          ),
        ),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        _buildPlayerForm(),
        Dimensions.verticalSpacingMedium,
        Padding(
          padding: Dimensions.paddingSmall,
          child: CustomInput(
            inputType: InputType.text,
            hint: "${intl.leavecomment}",
            title: "${intl.comments}",
            minLines: 5,
            maxLines: 5,
          ),
        ),
        Dimensions.verticalSpacingMedium,
        Padding(
          padding: Dimensions.paddingSmall,
          child: CustomInput(
            inputType: InputType.text,
            hint: "${intl.leavecomment}",
            title: "${intl.strengths}",
            minLines: 5,
            maxLines: 5,
          ),
        ),
        Dimensions.verticalSpacingMedium,
      ],
    );
  }

  Widget _buildPlayerForm() {
    return Padding(
      padding: Dimensions.paddingSmall,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(height: 40, child: TextFormField()),
          ),
          Dimensions.horizontalSpacingMedium,
          Expanded(
            flex: 3,
            child: SizedBox(height: 40, child: TextFormField()),
          ),
        ],
      ),
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
              child:  Text(intl.print),
            ),
          ),
        ],
      ),
    );
  }
}
