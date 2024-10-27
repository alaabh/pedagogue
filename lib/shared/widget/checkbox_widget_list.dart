import 'package:flutter/material.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/dimensions.dart';

class CheckboxWidgetList extends StatefulWidget {
  final String? title;
  final List<String>? valueTitle;

  final List<bool> values;
  final int listLength;
  final Axis? orientation;
  String? selectedValue;
  //final Function(String?) onChanged; // Callback function

  CheckboxWidgetList({
    super.key,
    this.title,
    this.valueTitle,
    required this.values,
    this.orientation,
    required this.listLength,
    this.selectedValue,
   // required this.onChanged,
  });

  @override
  State<CheckboxWidgetList> createState() => _CheckboxWidgetListState();
}

class _CheckboxWidgetListState extends State<CheckboxWidgetList> {
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
              widget.listLength,
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
          widget.valueTitle![index],
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Checkbox(
          activeColor: AppColors.textColor,
          value: widget.values[index],
          onChanged: (value) {
            setState(() {
            
              widget.values[index] = value!;
             
            });
          },
        ),
      ],
    );
  }
}
