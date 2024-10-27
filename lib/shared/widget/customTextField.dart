import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller; // Added type TextEditingController

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller, // Added required keyword
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      // Use widget.controller instead of _controller
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
