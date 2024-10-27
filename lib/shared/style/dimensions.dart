import 'package:flutter/cupertino.dart';

class Dimensions {
  static const double smallValue = 5;
  static const double mediumValue = 10;
  static const double largeValue = 15;
  static const double extraLargeValue = 20;
  static const double hugeValue = 35;

  static const verticalSpacingSmall = SizedBox(height: smallValue);
  static const verticalSpacingMedium = SizedBox(height: mediumValue);
  static const verticalSpacingLarge = SizedBox(height: largeValue);
  static const verticalSpacingExtraLarge = SizedBox(height: extraLargeValue);
  static const verticalSpacingHuge = SizedBox(height: hugeValue);

  static const horizontalSpacingSmall = SizedBox(width: smallValue);
  static const horizontalSpacingMedium = SizedBox(width: mediumValue);
  static const horizontalSpacingLarge = SizedBox(width: extraLargeValue);
  static const horizontalSpacingExtraLarge = SizedBox(width: extraLargeValue);
  static const horizontalSpacingHuge = SizedBox(width: hugeValue);

  static const paddingSmall = EdgeInsets.all(smallValue);
  static const paddingMedium = EdgeInsets.all(mediumValue);
  static const paddingLarge = EdgeInsets.all(largeValue);
  static const paddingExtraLarge = EdgeInsets.all(extraLargeValue);
  static const paddingHuge = EdgeInsets.all(hugeValue);

  static const paddingSmallHorizontal = EdgeInsets.symmetric(
    horizontal: smallValue,
  );
  static const paddingMediumHorizontal = EdgeInsets.symmetric(
    horizontal: mediumValue,
  );
  static const paddingLargeHorizontal = EdgeInsets.symmetric(
    horizontal: largeValue,
  );
  static const paddingExtraLargeHorizontal = EdgeInsets.symmetric(
    horizontal: extraLargeValue,
  );
  static const paddingHugeHorizontal = EdgeInsets.symmetric(
    horizontal: hugeValue,
  );

  static const paddingSmallVertical = EdgeInsets.symmetric(
    vertical: smallValue,
  );
  static const paddingMediumVertical = EdgeInsets.symmetric(
    vertical: mediumValue,
  );
  static const paddingLargeVertical = EdgeInsets.symmetric(
    vertical: largeValue,
  );
  static const paddingExtraLargeVertical = EdgeInsets.symmetric(
    vertical: extraLargeValue,
  );
  static const paddingHugeVertical = EdgeInsets.symmetric(
    vertical: hugeValue,
  );

  static const smallRadius = Radius.circular(smallValue);
  static const mediumRadius = Radius.circular(mediumValue);
  static const largeRadius = Radius.circular(largeValue);
  static const extraLargeRadius = Radius.circular(extraLargeValue);
  static const hugeRadius = Radius.circular(hugeValue);

  static const BorderRadius smallBorderRadius = BorderRadius.all(
    smallRadius,
  );
  static const BorderRadius mediumBorderRadius = BorderRadius.all(
    mediumRadius,
  );
  static const BorderRadius largeBorderRadius = BorderRadius.all(
    largeRadius,
  );
  static const BorderRadius extraLargeBorderRadius = BorderRadius.all(
    extraLargeRadius,
  );
  static const BorderRadius hugeBorderRadius = BorderRadius.all(
    hugeRadius,
  );

  static const smallRoundedShape = RoundedRectangleBorder(
    borderRadius: smallBorderRadius,
  );
  static const mediumRoundedShape = RoundedRectangleBorder(
    borderRadius: mediumBorderRadius,
  );
  static const largeRoundedShape = RoundedRectangleBorder(
    borderRadius: largeBorderRadius,
  );
  static const extraLargeRoundedShape = RoundedRectangleBorder(
    borderRadius: extraLargeBorderRadius,
  );
  static const hugeRoundedShape = RoundedRectangleBorder(
    borderRadius: hugeBorderRadius,
  );

  static const iconSizeSmall = 20.0;
  static const iconSizeMedium = 25.0;
  static const iconSizeLarge = 40.0;
  static const iconSizeExtraLarge = 70.0;
  static const iconSizeHuge = 100.0;
}
