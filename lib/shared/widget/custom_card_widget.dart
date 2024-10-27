import 'package:flutter/material.dart';

import '../style/dimensions.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String? path;
  final Color? backgroundColor;
  final Color? color;
  final Color? surfaceTintColor;
  final Widget? child;

  const CustomCardWidget({
    super.key,
    required this.title,
    this.color,
    this.surfaceTintColor,
    this.backgroundColor,
    this.child,
    this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFC7BAAA),
            Color.fromRGBO(255, 255, 255, 1),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          //stops: [0.4, 0.7],
          tileMode: TileMode.repeated,
        ),
      ),
      //color: color,
      //surfaceTintColor: surfaceTintColor,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            color: backgroundColor,
            padding: Dimensions.paddingMedium,
            child: Center(
              child: Column(
                children: [
                  Dimensions.verticalSpacingMedium,
                  Text(
                    title,
                    style: TextStyle(
                        color: color == Colors.white
                            ? Colors.white
                            : Color(0xFF866422),
                        fontSize: 18),
                  ),
                  Dimensions.verticalSpacingLarge,
                  path == null
                      ? SizedBox()
                      : Image.asset(
                          path!,
                          width: MediaQuery.of(context).size.width * 0.15,
                        )
                ],
              ),
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
