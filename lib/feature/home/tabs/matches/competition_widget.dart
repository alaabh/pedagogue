import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/competition_controller.dart';
import 'package:pedagogue/feature/home/tabs/matches/competition_add_edit_view.dart';
import 'package:pedagogue/model/competition.dart';
import 'package:pedagogue/utils/resources/api/api_response.dart';

import '../../../../l10n/localization.dart';
import '../../../../shared/Widget/custom_dialog.dart';
import '../../../../shared/style/dimensions.dart';

class CompetitionWidget extends StatelessWidget {
  final Competition competition;
  final Future<void> Function({int? param}) reloadDataFunction;
  final void Function({required int elementId, required int? param})
      deleteElementFunction;

  const CompetitionWidget({
    super.key,
    required this.competition,
    required this.reloadDataFunction,
    required this.deleteElementFunction,
  });

  @override
  Widget build(BuildContext context) {
    CompetitionController competitionController = CompetitionController();
    competitionController.apiResponse.value = ApiResponse.completed();

    return SizedBox(
      width: 250,
      child: Obx(
        () => Opacity(
          opacity: competitionController.apiResponse.value.status ==
                  ApiStatus.completed
              ? 1
              : 0.4,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CompetitionAddEditView(
                  competition: competition,
                  reloadDataFunction: reloadDataFunction,
                ),
              ),
            ),
            child: Card(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsetsDirectional.only(
                end: Dimensions.largeValue,
                top: Dimensions.smallValue,
                bottom: Dimensions.smallValue,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.flag_circle_sharp,
                    size: Dimensions.iconSizeExtraLarge,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Dimensions.verticalSpacingSmall,
                        Padding(
                          padding: Dimensions.paddingSmall,
                          child: Text(
                            competition.name ?? '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Padding(
                          padding: Dimensions.paddingMediumHorizontal,
                          child: Text(
                            '${intl.doubleDotPlaceholder(intl.description)}\n'
                            '${competition.description ?? ''}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Dimensions.verticalSpacingSmall,
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      AlertMaker.showActionAlertDialog(
                        context: context,
                        title: intl.deleteConfirmation,
                        description: intl.areYouSureYouWantToDeleteThis(
                          intl.match,
                        ),
                        alertType: AlertType.danger,
                        positiveAction: () =>
                            competitionController.delete(competition.id!).then(
                                  (value) => deleteElementFunction(
                                    elementId: competition.id!,
                                    param: 1,
                                  ),
                                ),
                        negativeAction: () {},
                        positiveActionTitle: intl.yes,
                        negativeActionTitle: intl.no,
                      );
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
