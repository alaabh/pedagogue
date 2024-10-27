import 'package:flutter/material.dart';
import 'package:pedagogue/controller/season_controller.dart';
import 'package:pedagogue/feature/home/drawer/season/season_add_edit_view.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/season.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';

class SeasonWidget extends StatelessWidget {
  final Season season;
  final Function() loadDataFunction;

  const SeasonWidget({
    super.key,
    required this.season,
    required this.loadDataFunction,
  });

  @override
  Widget build(BuildContext context) {
    // API
    SeasonController seasonController = SeasonController();

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
                    season.name ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Dimensions.verticalSpacingMedium,
                  Text(
                    '${intl.doubleDotPlaceholder(intl.description)}\n'
                    '${season.description ?? ''}',
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
                          builder: (context) =>
                              SeasonAddEditView(season: season),
                        ),
                      )
                      .whenComplete(loadDataFunction),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: AppColors.dangerColor),
                  onPressed: () => ApiViewHandler.withAlert(
                    context: context,
                    apiCall: seasonController.delete(season.id!),
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
