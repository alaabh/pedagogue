import 'package:flutter/material.dart';

import '../../l10n/localization.dart';
import '../style/app_color.dart';
import '../style/dimensions.dart';

enum AlertType {
  success,
  information,
  warning,
  danger,
}

class AlertMaker {
  static void showSimpleAlertDialog({
    required BuildContext context,
    required String title,
    required String description,
    required AlertType alertType,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CustomDialogBox(
          title: title,
          description: description,
          alertType: alertType,
        );
      },
    );
  }

  static void showSingleActionAlertDialog({
    required BuildContext context,
    required String title,
    required String description,
    required AlertType alertType,
    required VoidCallback? action,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CustomDialogBox(
          title: title,
          description: description,
          alertType: alertType,
          positiveAction: action,
        );
      },
    );
  }

  static Future<void> showActionAlertDialog({
    required BuildContext context,
    required String title,
    required String description,
    required AlertType alertType,
    required VoidCallback? positiveAction,
    required VoidCallback? negativeAction,
    required String positiveActionTitle,
    required String negativeActionTitle,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CustomDialogBox(
          title: title,
          description: description,
          alertType: alertType,
          positiveAction: positiveAction,
          negativeAction: negativeAction,
          positiveActionTitle: positiveActionTitle,
          negativeActionTitle: negativeActionTitle,
        );
      },
    );
  }

  static Future<void> showWidgetAlertDialog({
    required BuildContext context,
    required AlertType alertType,
    VoidCallback? negativeAction,
    VoidCallback? positiveAction,
    String? negativeActionTitle,
    String? positiveActionTitle,
    required Widget widget,
    bool hasDefaultButtons = true,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CustomDialogBox(
          alertType: alertType,
          negativeAction: negativeAction,
          positiveAction: positiveAction,
          negativeActionTitle: negativeActionTitle,
          positiveActionTitle: positiveActionTitle,
          widget: widget,
          hasDefaultButtons: hasDefaultButtons,
        );
      },
    );
  }
}

class CustomDialogBox extends StatelessWidget {
  final String? title;
  final String? description;
  final AlertType alertType;
  final VoidCallback? positiveAction;
  final VoidCallback? negativeAction;
  final String? positiveActionTitle;
  final String? negativeActionTitle;
  final Widget? widget;
  final bool hasDefaultButtons;

  const CustomDialogBox({
    super.key,
    this.title,
    this.description,
    required this.alertType,
    this.positiveAction,
    this.negativeAction,
    this.positiveActionTitle,
    this.negativeActionTitle,
    this.widget,
    this.hasDefaultButtons = true,
  });

  // --------------------------- BUILD METHODS -----------------------------  //

  @override
  Widget build(BuildContext context) {
    late IconData icon;
    late Color mainColor;

    switch (alertType) {
      case AlertType.success:
        mainColor = AppColors.successColor;
        icon = Icons.check_circle;
        break;
      case AlertType.information:
        mainColor = AppColors.infoColor;
        icon = Icons.info;
        break;
      case AlertType.warning:
        mainColor = AppColors.warningColor;
        icon = Icons.warning;
        break;
      case AlertType.danger:
        mainColor = AppColors.dangerColor;
        icon = Icons.error;
        break;
    }

    final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: Dimensions.largeBorderRadius,
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: screenHeight * 0.9,
        ),
        padding: Dimensions.paddingExtraLarge,
        decoration: BoxDecoration(
          color: AppColors.primaryBackgroundColor.withOpacity(0.95),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget ??
                Column(
                  children: [
                    Icon(icon, size: 75, color: mainColor),
                    Dimensions.verticalSpacingHuge,
                    Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    Dimensions.verticalSpacingHuge,
                    Text(description ?? ''),
                    Dimensions.verticalSpacingHuge,
                  ],
                ),
            if (hasDefaultButtons)
              Row(
                children: [
                  if (positiveAction == null && negativeAction == null)
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(mainColor),
                          foregroundColor: const MaterialStatePropertyAll(
                            Colors.white,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                color: mainColor,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: Dimensions.largeBorderRadius,
                            ),
                          ),
                        ),
                        child: Text(intl.ok),
                      ),
                    ),
                  if (positiveAction != null && negativeAction != null)
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                if (negativeAction != null) {
                                  negativeAction!();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  AppColors.primaryBackgroundColor,
                                ),
                                foregroundColor: const MaterialStatePropertyAll(
                                  Colors.white,
                                ),
                              ),
                              child: Text(
                                negativeActionTitle ?? intl.no,
                                style: TextStyle(
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          ),
                          Dimensions.horizontalSpacingLarge,
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                if (positiveAction != null) {
                                  positiveAction!();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  mainColor,
                                ),
                                foregroundColor: const MaterialStatePropertyAll(
                                  Colors.white,
                                ),
                              ),
                              child: Text(
                                positiveActionTitle ?? intl.yes,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (positiveAction != null && negativeAction == null)
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (positiveAction != null) positiveAction!();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            mainColor.withOpacity(0.2),
                          ),
                          foregroundColor: MaterialStatePropertyAll(
                            mainColor,
                          ),
                        ),
                        child: Text(intl.proceed),
                      ),
                    ),
                  if (positiveAction == null && negativeAction != null)
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (negativeAction != null) negativeAction!();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            mainColor.withOpacity(0.2),
                          ),
                          foregroundColor: MaterialStatePropertyAll(
                            mainColor,
                          ),
                        ),
                        child: Text(negativeActionTitle ?? intl.cancel),
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
