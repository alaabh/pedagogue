import 'package:flutter/material.dart';



class CheckboxList extends StatefulWidget {
  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  List<bool> isChecked = List<bool>.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List<Widget>.generate(5, (index) {
        return ListTile(
          title: Text('Item ${index + 1}'),
          leading: Checkbox(
            value: isChecked[index],
            onChanged: (bool? value) {
              setState(() {
                isChecked[index] = value!;
              });
            },
          ),
        );
      }),
    );
  }
}