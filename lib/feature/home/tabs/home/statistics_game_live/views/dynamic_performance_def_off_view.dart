import 'package:flutter/material.dart';

import '../../../../../../l10n/localization.dart';
import '../../../../../../shared/style/app_color.dart';
import '../../../../../../shared/style/assets.dart';
import '../../../../../../shared/style/dimensions.dart';
import '../../../../../../shared/widget/custom_card_widget.dart';
import '../../../../../../shared/widget/custom_input.dart';

class DynamicPerformanceDefOffView extends StatelessWidget {
  final String teamName;
  final Color teamColor;

  const DynamicPerformanceDefOffView({
    super.key,
    required this.teamName,
    required this.teamColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teamName == 'A'
            ? intl.dynamicPerformancea
            : intl.dynamicPerformanceb),
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
        Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              Container(
                color: AppColors.primaryDarkColor,
                padding: Dimensions.paddingSmall,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "${intl.position}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Dimensions.horizontalSpacingMedium,
                    Expanded(
                      flex: 3,
                      child: Text(
                        "${intl.numbersOfPlayers}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "${intl.playerNumber}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              _buildPositionsForm(
                title: "${intl.defensivePosition}",
                subTitle: "${intl.midlePosition} 1",
              ),
              _buildPositionsForm(subTitle: "${intl.defenseZone} 1"),
              _buildPositionsForm(subTitle: "${intl.attakedZone} 2"),
              _buildPositionsForm(subTitle: "${intl.defenseZone} 2"),
              _buildPositionsForm(subTitle: "${intl.attakedZone} 3"),
              _buildPositionsForm(subTitle: "${intl.defenseZone} 3"),
              _buildPositionsForm(
                title: "${intl.midlePosition}",
                subTitle: "${intl.attakedZone} 4",
              ),
              _buildPositionsForm(subTitle: "${intl.defenseZone} 4"),
              _buildPositionsForm(subTitle: "${intl.attakedZone} 5"),
              _buildPositionsForm(subTitle: "${intl.defenseZone} 5"),
              _buildPositionsForm(subTitle: "${intl.attakedZone} 6"),
              _buildPositionsForm(subTitle: "${intl.defenseZone} 6"),
              _buildPositionsForm(
                title: "${intl.attakedZone}",
                subTitle: "${intl.attakedZone} 7",
              ),
              _buildPositionsForm(subTitle: "${intl.defenseZone} 7"),
              _buildPositionsForm(subTitle: "${intl.attakedZone} 8"),
              _buildPositionsForm(subTitle: "${intl.defenseZone} 8"),
              _buildPositionsForm(subTitle: "${intl.attakedZone} 9"),
              _buildPositionsForm(subTitle: "${intl.defenseZone} 9"),
            ],
          ),
        ),
        Dimensions.verticalSpacingMedium,
        _buildZonesForm(context, title: "${intl.sTRONGPOINTS}"),
        Dimensions.verticalSpacingMedium,
        _buildZonesForm(context, title: "${intl.attakedZone}"),
        Dimensions.verticalSpacingMedium,
        _buildZonesForm(context, title: "${intl.wEAKPOINTS}"),
        Dimensions.verticalSpacingMedium,
        Padding(
          padding: Dimensions.paddingSmall,
          child: CustomInput(
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

  Widget _buildPositionsForm({String? title, required String subTitle}) {
    return Padding(
      padding: Dimensions.paddingSmall,
      child: Column(
        children: [
          if (title != null) Text(title, style: const TextStyle(fontSize: 20)),
          Row(
            children: [
              Expanded(flex: 2, child: Text(subTitle)),
              Dimensions.horizontalSpacingMedium,
              Expanded(
                flex: 3,
                child: SizedBox(height: 40, child: TextFormField()),
              ),
              Dimensions.horizontalSpacingMedium,
              Expanded(
                flex: 4,
                child: SizedBox(height: 40, child: TextFormField()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildZonesForm(BuildContext context, {required String title}) {
    return CustomCardWidget(
      title: title,
      color: AppColors.primaryBackgroundColor,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.primaryColor,
      child: Column(
        children: [
          Dimensions.verticalSpacingMedium,
          Card(
            clipBehavior: Clip.hardEdge,
            child: Image.asset(Assets.dividedTerrain),
          ),
          Dimensions.verticalSpacingMedium,
          Wrap(
            children: List.generate(
              9,
              (index) => SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 12.0,
                child: Card(
                  margin: Dimensions.paddingSmall,
                  child: Column(
                    children: [
                      Dimensions.verticalSpacingMedium,
                      Text(
                        "${intl.zone} ${index + 1}",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      Padding(
                        padding: Dimensions.paddingMedium,
                        child: CustomInput(
                          title: "${intl.offensive}",
                          inputType: InputType.text,
                          centerTitle: true,
                        ),
                      ),
                      Padding(
                        padding: Dimensions.paddingMedium,
                        child: CustomInput(
                          title: "${intl.defensive}",
                          inputType: InputType.text,
                          centerTitle: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
