import 'package:flutter/material.dart';

import '../../l10n/localization.dart';
import '../style/app_color.dart';
import '../style/dimensions.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? refreshText;
  final String? errorText;
  final Function? tapFunction;
  final Color? textColor;
  final bool displayCard;
  final double? iconSize;

  const CustomErrorWidget({
    super.key,
    this.refreshText,
    required this.errorText,
    this.tapFunction,
    this.textColor,
    this.displayCard = false,
    this.iconSize,
  });

  // --------------------------- BUILD METHODS -----------------------------  //

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: displayCard ? 2 : 0,
        color:
            displayCard ? AppColors.primaryBackgroundColor : Colors.transparent,
        margin: Dimensions.paddingSmallHorizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: Dimensions.paddingSmallVertical,
              child: Icon(
                Icons.error,
                color: AppColors.dangerColor,
                size: iconSize ?? 40,
              ),
            ),
            if (errorText != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.smallValue,
                ),
                child: Text(
                  errorText!,
                  style: TextStyle(color: textColor ?? textColor),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
            if (tapFunction != null)
              Padding(
                padding: Dimensions.paddingLarge,
                child: TextButton(
                  onPressed: () => tapFunction!(),
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.transparent,
                    ),
                    foregroundColor: MaterialStatePropertyAll(
                      AppColors.accentColor,
                    ),
                  ),
                  child: Text(
                    refreshText ?? intl.refresh,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
