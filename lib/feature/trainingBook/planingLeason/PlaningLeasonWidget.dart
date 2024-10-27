/* import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../../shared/style/app_color.dart';
import '../../../shared/widget/customTextField.dart';
import '../../../shared/widget/custom_input.dart';

class PlaningLeasonWidget extends StatefulWidget {
  final TextEditingController capacitiesController;
  final TextEditingController descriptionController;
  final TextEditingController coaching1Controller;
  const PlaningLeasonWidget({super.key, required this.capacitiesController, required this.descriptionController, required this.coaching1Controller});

  @override
  State<PlaningLeasonWidget> createState() => _PlaningLeasonWidgetState();
}

class _PlaningLeasonWidgetState extends State<PlaningLeasonWidget> {

  int indice = 0;

  Future _getFileFromGallery(FilePickerResult? selectedFiles) async {
    final result = await FilePicker.platform
        .pickFiles(withData: true); // allowMultiple is false by default
    if (result == null) {
      // User canceled the picker
    } else {
      setState(() {
        selectedFiles = result;
        // Assign the single selected file
      });
    }
    if (indice == 1) {
      selectedFiles1 = selectedFiles;
    }
    if (indice == 2) {
      selectedFiles2 = selectedFiles;
    }
    if (indice == 3) {
      selectedFiles3 = selectedFiles;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: CustomTextField(
                        hintText: 'Capacities',
                        labelText: 'Capacities',
                        controller: widget.capacitiesController,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: CustomTextField(
                        hintText: 'Organization',
                        labelText: 'Organization',
                        controller: widget.descriptionController,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: TextButton(
                          onPressed: () async {
                            setState(() {
                              indice = 1;
                            });
                            await _getFileFromGallery(selectedFiles1);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Select A file',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.upload_file,
                                  color: Colors.white, size: 20)
                            ],
                          )),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(selectedFiles1 != null
                            ? selectedFiles1!.files.first.name
                            : "No File Selected")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: CustomTextField(
                        hintText: 'Coaching',
                        labelText: 'Coaching',
                        controller: _ThemeController,
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: CustomInput(
                            controller: duration1Controller,
                            inputType: InputType.time))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 */