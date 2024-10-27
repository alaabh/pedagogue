import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pedagogue/shared/widget/custom_card_widget.dart';
import 'package:pedagogue/shared/widget/custom_input.dart';

import '../../../../../../l10n/localization.dart';
import '../../../../../../shared/style/app_color.dart';
import '../../../../../../shared/style/dimensions.dart';
import '../widgets/image_picker_element_widget.dart';

class MatchFormView extends StatefulWidget {
  final String teamName;
  final Color teamColor;

  const MatchFormView({
    super.key,
    required this.teamName,
    required this.teamColor,
  });

  @override
  State<MatchFormView> createState() => _MatchFormViewState();
}

class _MatchFormViewState extends State<MatchFormView> {
  // UI
  ScrollController scrollController = ScrollController();

  XFile? selectedImage1Path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textColorInverted,
      appBar: AppBar(
          title:
              Text(widget.teamName == 'A' ? intl.matchfroma : intl.matchfromb)),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                padding: Dimensions.paddingMedium,
                child: _buildContent(context),
              ),
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
        CustomCardWidget(
          color: Colors.white,
          title: "${intl.theMainPlayers}",
          backgroundColor: widget.teamColor,
          child: Column(
            children: [
              Padding(
                padding: Dimensions.paddingSmall,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text("N°")),
                    Dimensions.horizontalSpacingMedium,
                    Expanded(flex: 3, child: Text("${intl.matchFormPosition}")),
                    Dimensions.horizontalSpacingMedium,
                    Expanded(flex: 3, child: Text("${intl.fullName}")),
                    Dimensions.horizontalSpacingMedium,
                    Expanded(flex: 1, child: Text("${intl.shoot}")),
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
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        CustomCardWidget(
          color: Colors.white,
          title: "${intl.playersparticipating}",
          backgroundColor: widget.teamColor,
          child: Column(
            children: [
              Padding(
                padding: Dimensions.paddingSmall,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text("N°")),
                    Dimensions.horizontalSpacingMedium,
                    Expanded(flex: 3, child: Text("${intl.matchFormPosition}")),
                    Dimensions.horizontalSpacingMedium,
                    Expanded(flex: 3, child: Text("${intl.fullName}")),
                    Dimensions.horizontalSpacingMedium,
                    Expanded(flex: 1, child: Text("${intl.shoot}")),
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
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        CustomCardWidget(
          color: Colors.white,
          title: "${intl.change}",
          backgroundColor: widget.teamColor,
          child: Column(
            children: [
              Padding(
                padding: Dimensions.paddingSmall,
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Text("${intl.playerNameIn}")),
                    Dimensions.horizontalSpacingMedium,
                    Expanded(flex: 3, child: Text("${intl.playerNameOut}")),
                    Dimensions.horizontalSpacingMedium,
                    Expanded(flex: 2, child: Text("${intl.timing}")),
                  ],
                ),
              ),
              _buildChangeForm(),
              _buildChangeForm(),
              _buildChangeForm(),
              _buildChangeForm(),
              _buildChangeForm(),
              _buildChangeForm(),
              _buildChangeForm(),
              _buildChangeForm(),
              _buildChangeForm(),
              _buildChangeForm(),
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        CustomCardWidget(
          color: Colors.white,
          title: "${intl.goalkeeper}",
          backgroundColor: widget.teamColor,
          child: Padding(
            padding: Dimensions.paddingMedium,
            child: Column(
              children: [
                _buildGoalKeeperForm(),
                Dimensions.verticalSpacingHuge,
                const Divider(),
                Dimensions.verticalSpacingHuge,
                _buildGoalKeeperForm(),
                Dimensions.verticalSpacingHuge,
                const Divider(),
                Dimensions.verticalSpacingHuge,
                _buildGoalKeeperForm(),
              ],
            ),
          ),
        ),
        Dimensions.verticalSpacingMedium,
        ImagePickerElementWidget(
          titleBackgroundColor: widget.teamColor,
          title: "${intl.gameStrategy}",
          onImagePicked: (imagePath) => selectedImage1Path = imagePath,
        ),
        Dimensions.verticalSpacingMedium,
        CustomCardWidget(
          color: Colors.white,
          title: "${intl.outstandingPlayers}",
          backgroundColor: widget.teamColor,
          child: Padding(
            padding: Dimensions.paddingMedium,
            child: Column(
              children: [
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
                _buildPlayersForm(),
                _buildPlayersForm(),
                _buildPlayersForm(),
                _buildPlayersForm(),
              ],
            ),
          ),
        ),
        Dimensions.verticalSpacingMedium,
        CustomCardWidget(
          color: Colors.white,
          title: "${intl.playersLeastLevel}",
          backgroundColor: widget.teamColor,
          child: Padding(
            padding: Dimensions.paddingMedium,
            child: Column(
              children: [
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
                _buildPlayersForm(),
                _buildPlayersForm(),
                _buildPlayersForm(),
                _buildPlayersForm(),
              ],
            ),
          ),
        ),
        Dimensions.verticalSpacingMedium,
        CustomCardWidget(
          color: Colors.white,
          title: "${intl.goalsDescription}",
          backgroundColor: widget.teamColor,
          child: Padding(
            padding: Dimensions.paddingMedium,
            child: Column(
              children: List.generate(
                10,
                (i) => Column(
                  children: [
                    _buildGoalsDescriptionForm(),
                    if (i != 9) Dimensions.verticalSpacingHuge,
                    if (i != 9) const Divider(),
                    if (i != 9) Dimensions.verticalSpacingHuge,
                  ],
                ),
              ),
            ),
          ),
        ),
        Dimensions.verticalSpacingMedium,
        buildGameStaticsForm(),
      ],
    );
  }

  Widget _buildPlayerForm() {
    return Padding(
      padding: Dimensions.paddingSmall,
      child: Row(
        children: [
          Expanded(flex: 1, child: TextFormField()),
          Dimensions.horizontalSpacingMedium,
          Expanded(
            flex: 3,
            child: CustomInput(
              inputType: InputType.dropdown,
              hint: "${intl.matchFormPosition}",
              dropdownItems: [
                "${intl.matchFormAttacker}",
                "${intl.leftstriker}",
                "${intl.rightstriker}",
                "${intl.centralstriker}",
                "${intl.matchFormMiddle}",
                "${intl.rightmidfielder}",
                "${intl.defensivemidfielder}",
                "${intl.attackingmidfielder}",
                "${intl.leftmidfielder}",
                "${intl.matchFormDefender}",
                "${intl.rightcentreback}",
                "${intl.leftcentreback}",
                "${intl.leftside}",
                "${intl.rightSide}",
                "${intl.matchFormGuardian}",
                "${intl.matchFormGuardian1}",
              ],
              dropdownTitleItems: [
                "${intl.matchFormAttacker}",
                "${intl.matchFormMiddle}",
                "${intl.matchFormDefender}",
                "${intl.matchFormGuardian}",
              ],
            ),
          ),
          Dimensions.horizontalSpacingMedium,
          Expanded(flex: 3, child: TextFormField()),
          Dimensions.horizontalSpacingMedium,
          Expanded(flex: 1, child: TextFormField()),
        ],
      ),
    );
  }

  Widget _buildChangeForm() {
    return Padding(
      padding: Dimensions.paddingSmall,
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child: CustomInput(
              inputType: InputType.text,
            ),
          ),
          Dimensions.horizontalSpacingMedium,
          const Expanded(
            flex: 3,
            child: CustomInput(
              inputType: InputType.text,
            ),
          ),
          Dimensions.horizontalSpacingMedium,
          Expanded(
            flex: 2,
            child: CustomInput(
              controller: TextEditingController(),
              inputType: InputType.time,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalKeeperForm() {
    return Padding(
      padding: Dimensions.paddingSmall,
      child: Column(
        children: [
          const CustomInput(title: "N°", inputType: InputType.text),
          Dimensions.verticalSpacingMedium,
          CustomInput(title: "${intl.gPFullName}", inputType: InputType.text),
          Dimensions.verticalSpacingMedium,
          CustomInput(title: "${intl.repel}", inputType: InputType.text),
          Dimensions.verticalSpacingMedium,
          CustomInput(title: "${intl.goals}", inputType: InputType.text),
          Dimensions.verticalSpacingMedium,
          CustomInput(
            title: "${intl.timetable}",
            controller: TextEditingController(),
            inputType: InputType.time,
          ),
        ],
      ),
    );
  }

  Widget _buildPlayersForm() {
    return const Padding(
      padding: Dimensions.paddingSmall,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomInput(
              inputType: InputType.text,
            ),
          ),
          Dimensions.horizontalSpacingMedium,
          Expanded(
            flex: 3,
            child: CustomInput(
              inputType: InputType.text,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalsDescriptionForm() {
    return Padding(
      padding: Dimensions.paddingSmall,
      child: Column(
        children: [
          CustomInput(
            title: "${intl.description}",
            inputType: InputType.text,
          ),
          Dimensions.verticalSpacingMedium,
          CustomInput(
            title: "${intl.goalScorer}",
            inputType: InputType.text,
          ),
          Dimensions.verticalSpacingMedium,
          CustomInput(
            title: "${intl.goalAssist}",
            inputType: InputType.text,
          ),
          Dimensions.verticalSpacingMedium,
          CustomInput(
            title: "${intl.timetable}",
            controller: TextEditingController(),
            inputType: InputType.time,
          ),
        ],
      ),
    );
  }

  Widget buildGameStaticsForm() {
    return CustomCardWidget(
      color: Colors.white,
      backgroundColor: widget.teamColor,
      title: "${intl.gameStatics}",
      child: Padding(
        padding: Dimensions.paddingSmall,
        child: Column(
          children: [
            CustomInput(title: "${intl.shooting}", inputType: InputType.text),
            Dimensions.verticalSpacingMedium,
            CustomInput(
                title: "${intl.cornerStrike}", inputType: InputType.text),
            Dimensions.verticalSpacingMedium,
            CustomInput(title: "${intl.repelGoals}", inputType: InputType.text),
            Dimensions.verticalSpacingMedium,
            CustomInput(title: "${intl.errors}", inputType: InputType.text),
            Dimensions.verticalSpacingMedium,
            CustomInput(title: "${intl.offside}", inputType: InputType.text),
            Dimensions.verticalSpacingMedium,
            for (int i = 0; i < 15; i++)
              Column(
                children: [
                  buildGameStaticsPlayerCards(),
                  if (i != 14) Dimensions.verticalSpacingHuge,
                  if (i != 14) const Divider(),
                  if (i != 14) Dimensions.verticalSpacingHuge,
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget buildGameStaticsPlayerCards() {
    return Padding(
      padding: Dimensions.paddingSmall,
      child: Column(
        children: [
          CustomInput(
              title: "${intl.name} ${intl.player}", inputType: InputType.text),
          Dimensions.verticalSpacingMedium,
          CustomInput(title: "${intl.yellowCard}", inputType: InputType.text),
          Dimensions.verticalSpacingMedium,
          CustomInput(title: "${intl.redCard}", inputType: InputType.text),
          Dimensions.verticalSpacingMedium,
          CustomInput(title: "${intl.errors}", inputType: InputType.text),
          Dimensions.verticalSpacingMedium,
          CustomInput(title: "${intl.timing}", inputType: InputType.text),
          Dimensions.verticalSpacingMedium,
          CustomInput(
            title: "${intl.timing}",
            controller: TextEditingController(),
            inputType: InputType.time,
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
              child: Text(intl.print),
            ),
          ),
        ],
      ),
    );
  }
}
