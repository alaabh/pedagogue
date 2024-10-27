import 'package:flutter/material.dart';

import '../../model/CardItem.dart';

class CustomCardWidget extends StatelessWidget {
  final List<CardItem> items;


  const CustomCardWidget({
    Key? key,
    required this.items,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (items[index].destination != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => items[index].destination!),
                );
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    items[index].title!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(items[index].icon),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
