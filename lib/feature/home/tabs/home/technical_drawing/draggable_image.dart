import 'package:flutter/material.dart';

/* class DraggableImage extends StatefulWidget {
  final String id;
  final String? name;
  final double iconSize;
  final int tag;
  final Offset? position;
  final bool isPlaced;

  DraggableImage({
    required this.id,
    required this.iconSize,
    this.tag = -1,
    this.position,
    this.isPlaced = false,
    this.name,
    super.key
  }) ;

  @override
  State<DraggableImage> createState() => _DraggableImageState();
}

class _DraggableImageState extends State<DraggableImage> {
   String? name1 = "";
   /*  final imageWidget = RotatedBox(
      quarterTurns: 1,
      child: Column(
        children: [
          (name1 == "" || name1 == null)
              ? SizedBox.shrink()
              : Text(name.toString()),
          Image.asset(
            id,
            width: iconSize,
            height: iconSize,
          ),
        ],
      ),
    ); */
  @override
  void initState() {
    name1 = widget.name;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    

    return Draggable(
      data: this,
      feedback: RotatedBox(
      quarterTurns: 1,
      child: Column(
        children: [
          (name1 == "" || name1 == null)
              ? SizedBox.shrink()
              : Text(name1.toString()),
          Image.asset(
            widget.id,
            width: widget.iconSize,
            height: widget.iconSize,
          ),
        ],
      ),
    ),
      childWhenDragging: const SizedBox.shrink(),
      child: imageWidget,
    );
  }
} */
class DraggableImage extends StatelessWidget {
  final String id;
  final String? name;
  final double iconSize;
  final int tag;
  final Offset? position;
  final bool isPlaced;

  DraggableImage({
    required this.id,
    required this.iconSize,
    this.tag = -1,
    this.position,
    this.isPlaced = false,
    this.name,
  }) : super(key: Key(id));

  @override
  Widget build(BuildContext context) {
    var name1 = name;
    final imageWidget = RotatedBox(
      quarterTurns: 1,
      child: Column(
        children: [
          (name1 == "" || name1 == null)
              ? SizedBox.shrink()
              : Text(name.toString()),
          Image.asset(
            id,
            width: iconSize,
            height: iconSize,
          ),
        ],
      ),
    );

    return Draggable(
      data: this,
      feedback: imageWidget,
      childWhenDragging: const SizedBox.shrink(),
      child: imageWidget,
    );
  }
}
