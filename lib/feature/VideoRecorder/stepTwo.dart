import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pedagogue/feature/VideoRecorder/stepTrie.dart';

class StepTwoVideoRecorder extends StatefulWidget {
  final Function(String?) onSelectImage;
  final String? videoUrl; // Define videoUrl parameter

  const StepTwoVideoRecorder({
    Key? key,
    required this.onSelectImage,
    this.videoUrl, // Add videoUrl parameter to constructor
  }) : super(key: key);

  @override
  State<StepTwoVideoRecorder> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwoVideoRecorder> {
  final List<String> terrainImages = [
    'assets/technical_drawing/athletics/_terrain.png',
    'assets/technical_drawing/basketball/_terrain.png',
    'assets/technical_drawing/football/_terrain.png',
    'assets/technical_drawing/rugby/_terrain.png',
    'assets/technical_drawing/tennis/_terrain.png',
    'assets/technical_drawing/volleyball/_terrain.png',
    'assets/technical_drawing/handball/_terrain.png',
  ];

  String? selectedTerrainImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: terrainImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Pass the selected image to the onSelectImage function
              widget.onSelectImage(terrainImages[index]);
              // Calculate the coordinates of the tap

            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  terrainImages[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
