import 'package:flutter/material.dart';

import '../../../controller/sessions_controller.dart';
import '../../../l10n/localization.dart';
import '../../../model/sessions_model.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/style/dimensions.dart';
import '../../../utils/resources/api/api_view_handler.dart';
import 'createSession.dart';

class SessionsWidget extends StatelessWidget {
  final Sessions? sessions;
  final Function() loadDataFunction;

  const SessionsWidget({
    Key? key,
    required this.loadDataFunction,
    this.sessions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SessionsController sessionsController = SessionsController();

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
                  Row(
                    children: [
                      Text("${intl.name} :"),
                      Dimensions.horizontalSpacingMedium,
                      Text(
                        '${sessions?.name ?? ''}',
                        style: Theme.of(context).textTheme.titleLarge!,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                        Text("${intl.rating} :"),
                      Dimensions.horizontalSpacingMedium,
                      Text('${sessions?.rating ?? ''}'),
                    ],
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
                          builder: (context) => CreatingSession(
                            sessions: sessions,
                          ),
                        ),
                      )
                      .whenComplete(loadDataFunction),
                ),
                if (sessions != null) // Check if sessions is not null
                  IconButton(
                    icon: Icon(Icons.delete, color: AppColors.dangerColor),
                    onPressed: () => ApiViewHandler.withAlert(
                      context: context,
                      apiCall: sessionsController.delete(sessions!.id!),
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
