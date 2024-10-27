import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/style/dimensions.dart';
import 'imagePicker_widget.dart';

class stepTrieExercice extends StatefulWidget {
  XFile? imgFile;
  Function(XFile? imagePath)? onImagePicked;

  stepTrieExercice({
    super.key,
    this.imgFile,
    this.onImagePicked,
  });

  @override
  State<stepTrieExercice> createState() => _stepTrieExerciceState();
}

class _stepTrieExerciceState extends State<stepTrieExercice> {
  String? selectedImage1Path;

  @override
  void initState() {
    print(widget.imgFile);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagePickerExerciceWidget(
                imgFile: widget.imgFile,
                title: "Main Players",
                onImagePicked: widget.onImagePicked,
              ),
              Dimensions.verticalSpacingExtraLarge,

              
            ],
          ),
        ),
      ),
    );
  }
}
