import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/report_controller.dart';
import 'package:pedagogue/feature/home/tabs/matches/report_add_edit_view.dart';
import 'package:pedagogue/model/report.dart';

import '../../../../l10n/localization.dart';
import '../../../../shared/Widget/custom_dialog.dart';
import '../../../../shared/style/dimensions.dart';
import '../../../../utils/resources/api/api_response.dart';

class ReportWidget extends StatelessWidget {
  final Report report;
  final Future<void> Function({int? param}) reloadDataFunction;
  final void Function({required int elementId, required int? param})
      deleteElementFunction;

  const ReportWidget({
    super.key,
    required this.report,
    required this.reloadDataFunction,
    required this.deleteElementFunction,
  });

  @override
  Widget build(BuildContext context) {
    // API
    ReportController reportController = ReportController();
    reportController.apiResponse.value = ApiResponse.completed();

    return SizedBox(
      width: 250,
      child: Obx(
        () => Opacity(
          opacity:
              reportController.apiResponse.value.status == ApiStatus.completed
                  ? 1
                  : 0.4,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ReportAddEditView(
                  report: report,
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
                    Icons.bar_chart,
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
                            report.match ?? '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: Dimensions.paddingMediumHorizontal,
                            child: Text(
                              '${intl.doubleDotPlaceholder(intl.description)}\n'
                              '${report.score ?? ''}',
                              overflow: TextOverflow.ellipsis,
                            ),
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
                            reportController.delete(report.id!).then(
                                  (value) => deleteElementFunction(
                                    elementId: report.id!,
                                    param: 3,
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
