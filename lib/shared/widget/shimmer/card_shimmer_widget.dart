import 'package:flutter/material.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/shared/widget/shimmer/shimmer_element.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmerWidget extends StatelessWidget {
  const CardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade200
            : Colors.black,
        period: const Duration(milliseconds: 1000),
        child: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              ShimmerElement(
                height: 200,
                width: 238,
                borderRadius: Dimensions.mediumBorderRadius,
              ),
              SizedBox(width: 12),
              ShimmerElement(
                height: 200,
                width: 238,
                borderRadius: Dimensions.mediumBorderRadius,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
