import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../l10n/localization.dart';
import '../../../../../../shared/style/assets.dart';
import '../../../../../../shared/style/dimensions.dart';

class ImagePickerExerciceWidget extends StatefulWidget {
  final String? title;
  XFile? imgFile;
  final Color? titleBackgroundColor;
  Function(XFile? imagePath)? onImagePicked;

  ImagePickerExerciceWidget({
    super.key,
    this.title,
    this.titleBackgroundColor,
    this.onImagePicked,
    this.imgFile,
  });

  @override
  State<ImagePickerExerciceWidget> createState() =>
      _ImagePickerExerciceWidgetState();
}

class _ImagePickerExerciceWidgetState extends State<ImagePickerExerciceWidget> {
  String? selectedImagePath;
  @override
  void initState() {
    // TODO: implement initState
    print(widget.imgFile);
    if (widget.imgFile != null) {
      selectedImagePath = widget.imgFile!.path;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          if (widget.title != null)
            Container(
              width: double.maxFinite,
              color: widget.titleBackgroundColor,
              padding: Dimensions.paddingMedium,
              child: Center(
                child: Text(
                  widget.title!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: selectedImagePath == null
                ? Image.asset(TechnicalDrawingAssets.footballTerrain)
                : Image.file(File(selectedImagePath!)),
          ),
          Container(
            width: double.maxFinite,
            padding: Dimensions.paddingSmall,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () async {
                final XFile? pickedFile = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );

                if (pickedFile != null) {
                  setState(() {
                    selectedImagePath = pickedFile.path;
                  });

                  widget.onImagePicked!(pickedFile);
                }
              },
              child: Text(intl.chooseImage),
            ),
          ),
        ],
      ),
    );
  }
}
