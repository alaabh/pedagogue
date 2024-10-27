import 'package:flutter/material.dart';
import 'package:pedagogue/controller/team_controller.dart';
import 'package:pedagogue/feature/home/drawer/team/team_add_edit_view.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/team.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';

class TeamWidget extends StatelessWidget {
  final Team team;
  final Function() loadDataFunction;

  const TeamWidget({
    super.key,
    required this.team,
    required this.loadDataFunction,
  });

  @override
  Widget build(BuildContext context) {
    // API
    TeamController teamController = TeamController();

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: Dimensions.mediumValue,
        horizontal: Dimensions.largeValue,
      ),
      child: Padding(
        padding: Dimensions.paddingLarge,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    team.name ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Dimensions.verticalSpacingMedium,
                  Text(
                    '${intl.doubleDotPlaceholder(intl.category)}'
                    '${team.category ?? ''}',
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: AppColors.warningColor),
                  onPressed: () => Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => TeamAddEditView(team: team),
                        ),
                      )
                      .whenComplete(loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: teamController.delete(team.id!),
                    successFunction: loadDataFunction,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
