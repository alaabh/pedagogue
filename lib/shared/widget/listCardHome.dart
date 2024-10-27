import 'package:flutter/material.dart';

import '../../model/CardItem.dart';

class CustomCardWidget extends StatelessWidget {



  final List<CardItem> items;

  const CustomCardWidget({Key? key, required this.items}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item.title!),
          leading: Icon(item.icon),
          onTap: () {
            if (item.destination != null) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => item.destination!));
            }
          },
        );
      },
    );
  }
}
