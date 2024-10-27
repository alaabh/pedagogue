import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../shared/widget/loading_widget.dart';

class CardPlayerWidget extends StatefulWidget {
  final String? imgUrl;
  final String? title;
  final String? number;

  const CardPlayerWidget({super.key, this.imgUrl, this.title, this.number});

  @override
  State<CardPlayerWidget> createState() => _CardPlayerWidgetState();
}

class _CardPlayerWidgetState extends State<CardPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(widget.imgUrl!),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.number!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  widget.title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
