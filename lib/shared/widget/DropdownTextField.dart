import 'package:flutter/material.dart';

class DropdownTextField extends StatefulWidget {
  final List<String> options;
  final String hintText;
  final String labelText;

  const DropdownTextField({
    Key? key,
    required this.options,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  _DropdownTextFieldState createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedOption,
      onChanged: (String? newValue) {
        setState(() {
          _selectedOption = newValue;
        });
      },
      items: widget.options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
