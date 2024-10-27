import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class Clipper extends CustomClipper<Path> {
  Clipper({required this.svgPathList});

  List<String> svgPathList;

  @override
  Path getClip(Size size) {
    var combinedPath = Path();

    for (String svgPath in svgPathList) {
      var path = parseSvgPathData(svgPath);
      final Matrix4 matrix4 = Matrix4.identity();

      double scaleFactor = size.height / 1235;

      matrix4.scale(scaleFactor, scaleFactor);

      combinedPath.addPath(path.transform(matrix4.storage), Offset.zero);
    }

    return combinedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    if (oldClipper is Clipper) {
      return !listEquals(oldClipper.svgPathList, svgPathList);
    }

    return true;
  }
}
