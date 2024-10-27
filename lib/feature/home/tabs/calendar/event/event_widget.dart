import 'package:flutter/material.dart';

import '../../../../../shared/style/dimensions.dart';

class EventWidget extends StatelessWidget {
  final String dayString;
  final String title;
  final Color color;

  const EventWidget({
    super.key,
    required this.dayString,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimensions.paddingMediumHorizontal,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: Dimensions.extraLargeBorderRadius,
      ),
      child: Container(
        padding: Dimensions.paddingMedium,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: Dimensions.extraLargeBorderRadius,
        ),
        child: Row(
          children: [
            Text(dayString),
            Dimensions.horizontalSpacingHuge,
            Text(title),
          ],
        ),
      ),
    );
  }
}
