import 'package:flutter/material.dart';

import '../../l10n/localization.dart';
import '../style/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 305, // default width
    this.height = 50, // default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:
                onPressed != null ? AppColors.primaryColor : Colors.transparent,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
        gradient: LinearGradient(
          colors: [
            onPressed != null
                ? AppColors.primaryColor
                : Colors.grey.withOpacity(0.4),
            onPressed != null
                ? AppColors.accentColor
                : Colors.grey.withOpacity(0.4),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.transparent),
          side: MaterialStateProperty.all(BorderSide.none),
        ),
        child: text == "${intl.save}"
            ? Icon(
                Icons.save,
                color: Colors.white,
              )
            : text == "${intl.print}"
                ? Icon(
                    Icons.print,
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Medium',
                    ),
                  ),
      ),
    );
  }
}
