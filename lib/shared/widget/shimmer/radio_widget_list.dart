import 'package:flutter/material.dart';

import '../../style/app_color.dart';
import '../../style/dimensions.dart';

class RadioWidgetList extends StatefulWidget {
  final String? title;
  final List<String> values;
  final Axis? orientation;
  String? selectedValue;
  final Function(String?) onChanged; // Callback function

  RadioWidgetList({
    super.key,
    this.title,
    required this.values,
    this.orientation,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  State<RadioWidgetList> createState() => _RadioWidgetListState();
}

class _RadioWidgetListState extends State<RadioWidgetList> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null)
          Container(
            width: double.maxFinite,
            color: AppColors.primaryColor,
            padding: Dimensions.paddingMedium,
            child: Center(
              child: Text(
                widget.title!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        Container(
          padding: Dimensions.paddingMediumVertical,
          color: AppColors.primaryColor.withOpacity(0.2),
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
    return Column(
      children: [
        Text(
          widget.values[index],
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Radio(
          activeColor: AppColors.textColor,
          value: widget.values[index],
          groupValue: widget.selectedValue,
          onChanged: (value) {
            setState(() {
              print(widget.selectedValue);
              widget.selectedValue = value;
              print(widget.selectedValue);
              widget.onChanged(value);
            });
          },
        ),
      ],
    );
  }
}
