import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedagogue/constants/env.dart';
import 'package:pedagogue/controller/match_controller.dart';
import 'package:pedagogue/feature/home/tabs/matches/match_add_edit_view.dart';
import 'package:pedagogue/model/match.dart';
import 'package:pedagogue/shared/Widget/custom_dialog.dart';
import 'package:pedagogue/shared/Widget/media/api_image_widget.dart';
import 'package:pedagogue/utils/resources/api/api_response.dart';

import '../../../../l10n/localization.dart';
import '../../../../shared/style/dimensions.dart';

class MatchWidget extends StatelessWidget {
  final Match match;
  final Future<void> Function({int? param}) reloadDataFunction;
  final void Function({required int elementId, required int? param})
      deleteElementFunction;

  const MatchWidget({
    super.key,
    required this.match,
    required this.reloadDataFunction,
    required this.deleteElementFunction,
  });

  @override
  Widget build(BuildContext context) {
    // API
    MatchController matchController = MatchController();
    matchController.apiResponse.value = ApiResponse.completed();

    return SizedBox(
      width: 250,
      child: Obx(
        () => Opacity(
          opacity:
              matchController.apiResponse.value.status == ApiStatus.completed
                  ? 1
                  : 0.4,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MatchAddEditView(
                  match: match,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ApiImageWidget(
                      width: double.maxFinite,
                      height: 50,
                      imageFilename: match.file,
                      baseUrl: imageWebUrl,
                      fit: BoxFit.cover,
                      borderRadius: 0,
                    ),
                  ),
                  Dimensions.verticalSpacingSmall,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: Dimensions.paddingSmall,
                              child: Text(
                                match.opponent ?? '',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Padding(
                              padding: Dimensions.paddingMediumHorizontal,
                              child: Text(
                                '${intl.doubleDotPlaceholder(intl.referee)}'
                                '${match.arbitrator ?? ''}',
                              ),
                            ),
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
                                matchController.delete(match.id!).then(
                                      (value) => deleteElementFunction(
                                        elementId: match.id!,
                                        param: 2,
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
                  Dimensions.verticalSpacingSmall,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
