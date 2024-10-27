import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../l10n/localization.dart';
import '../../../../../../shared/style/app_color.dart';
import '../../../../../../shared/style/assets.dart';
import '../../../../../../shared/style/dimensions.dart';

class ImagePickerElementWidget extends StatefulWidget {
  final String? title;
  XFile? imgFile;
  int? commentVisibility;
  final Color? titleBackgroundColor;
  Function(XFile? imagePath)? onImagePicked;

  ImagePickerElementWidget({
    super.key,
    this.title,
    this.titleBackgroundColor,
    this.onImagePicked,
    this.imgFile,
    this.commentVisibility,
  });

  @override
  State<ImagePickerElementWidget> createState() =>
      _ImagePickerElementWidgetState();
}

class _ImagePickerElementWidgetState extends State<ImagePickerElementWidget> {
  String? selectedImagePath;

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
          widget.commentVisibility == 0
              ? Container()
              : Container(
                  alignment: Alignment.center,
                  padding: Dimensions.paddingMedium,
                  child: RichText(
                    text: TextSpan(
                      text: '* ',
                      style: const TextStyle(color: Colors.red),
                      children: [
                        TextSpan(
                          text: intl
                              .youCanUploadAnImageInTheTechnicalDrawingSection,
                          style: TextStyle(color: AppColors.textColor),
                        ),
                      ],
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
