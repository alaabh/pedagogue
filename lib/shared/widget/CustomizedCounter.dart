import 'package:flutter/material.dart';

import '../style/dimensions.dart';

class CustomizedCounter extends StatefulWidget {
  TextEditingController? controller;
  final String title;
  final int? max;
  CustomizedCounter(
      {super.key, required this.title, this.controller, this.max});

  @override
  State<CustomizedCounter> createState() => _CustomizedCounterState();
}

class _CustomizedCounterState extends State<CustomizedCounter> {
  void _increment(TextEditingController? _controller) {
    setState(() {
      if (widget.max != null) {
        int currentValue = int.tryParse(_controller!.text) ?? 0;
        if (currentValue < widget.max!) {
          currentValue++;
        }
        _controller.text = currentValue.toString();
      } else {
        int currentValue = int.tryParse(_controller!.text) ?? 0;
        currentValue++;
        _controller.text = currentValue.toString();
      }
    });
  }

  void _decrement(TextEditingController? _controller) {
    setState(() {
      int currentValue = int.tryParse(_controller!.text) ?? 0;
      if (currentValue > 0) {
        currentValue--;
        _controller.text = currentValue.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width * 0.43,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          Dimensions.verticalSpacingMedium,
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: TextField(
              controller: widget.controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    _decrement(widget.controller);
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _increment(widget.controller);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
