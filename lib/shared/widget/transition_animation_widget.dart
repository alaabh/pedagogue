import 'package:flutter/material.dart';

class TransitionAnimationWidget extends StatelessWidget {
  final Widget child;

  const TransitionAnimationWidget({super.key, required this.child});

  // --------------------------- BUILD METHODS -----------------------------  //

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: child,
        );
      },
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: child,
    );
  }
}
