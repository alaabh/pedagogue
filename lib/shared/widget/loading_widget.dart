import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../style/app_color.dart';

class LoadingWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double size;
  final Color? color;

  const LoadingWidget({
    super.key,
    this.height,
    this.width,
    this.size = 40.0,
    this.color,
  });

  // --------------------------- BUILD METHODS -----------------------------  //

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: SpinKitDualRing(
          color: color ?? AppColors.primaryColor,
          size: size,
        ),
      ),
    );
  }
}
