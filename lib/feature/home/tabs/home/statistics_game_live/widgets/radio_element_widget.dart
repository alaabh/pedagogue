import 'package:flutter/material.dart';

import '../../../../../../shared/style/app_color.dart';
import '../../../../../../shared/style/dimensions.dart';

class RadioElementWidget extends StatefulWidget {
  final String? title;
  final List<String> values;
  final Axis? orientation;
  String? selectedValue;
  final Function(String?) onChanged; // Callback function

  RadioElementWidget({
    super.key,
    this.title,
    required this.values,
    this.orientation,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  State<RadioElementWidget> createState() => _RadioElementWidgetState();
}

class _RadioElementWidgetState extends State<RadioElementWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null)
          Container(
            width: double.maxFinite,
           color: AppColors.primaryColor.withOpacity(0.9),
            padding: Dimensions.paddingMedium,
            child: Center(
              child: Text(
                widget.title!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        Container(
          color: AppColors.teamBColor.withOpacity(0.2),
          child: Flex(
            direction: widget.orientation ?? Axis.horizontal,
            children: List.generate(
              widget.values.length,
              (index) =>
                  (widget.orientation ?? Axis.horizontal) == Axis.horizontal
                      ? Expanded(child: _buildRadio(index))
                      : _buildRadio(index),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadio(int index) {
    return RadioListTile(
      activeColor: AppColors.textColor,
      title: Text(widget.values[index]),
      value: widget.values[index],
      groupValue: widget.selectedValue,
      contentPadding: EdgeInsets.zero,
      onChanged: (value) {
        setState(() {
          print(widget.selectedValue);
          widget.selectedValue = value;
          print(widget.selectedValue);
          widget.onChanged(value);
        });
      },
    );
  }
}
