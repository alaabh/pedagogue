import 'package:flutter/material.dart';

import '../../../../../../shared/style/app_color.dart';

class CheckboxElementWidget extends StatefulWidget {
  final String? title;

  const CheckboxElementWidget({
    super.key,
    this.title,
  });

  @override
  State<CheckboxElementWidget> createState() => _CheckboxElementWidgetState();
}

class _CheckboxElementWidgetState extends State<CheckboxElementWidget> {
  bool selectedValue = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxMenuButton(
      style: TextButton.styleFrom(foregroundColor: AppColors.textColor),
      value: selectedValue,
      onChanged: (_) => setState(() => selectedValue = !selectedValue),
      child: Text(widget.title ?? ''),
    );
  }
}
