import 'package:flutter/material.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:stepper_a/stepper_a.dart';

import 'stepOne.dart';
import 'stepTrie.dart';
import 'stepTwo.dart';

class HomeVideoRecorder extends StatefulWidget {
  @override
  State<HomeVideoRecorder> createState() => _HomeVideoRecorderState();
}

class _HomeVideoRecorderState extends State<HomeVideoRecorder> {
  StepperAController controller = StepperAController();
  String? selectedTerrainImage;
  String? videoUrl; // Added to store the video URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            bottom: 0,
            child: StepperA(
              stepperSize: Size(MediaQuery.of(context).size.width * 0.9,
                  MediaQuery.of(context).size.height * 0.12),
              borderShape: BorderShape.circle,
              borderType: BorderType.straight,
              stepperAxis: Axis.horizontal,
              lineType: LineType.dotted,
              stepperBackgroundColor: Colors.transparent,
              stepperAController: controller,
              stepHeight: 40,
              stepWidth: 40,
              stepBorder: true,
              pageSwipe: true,
              formValidation: false,
              previousButton: (int index) => StepperAButton(
                width: 40,
                height: 40,
                onTap: (int currentIndex) {
                  debugPrint("Previous Button Current Index $currentIndex");
                },
                buttonWidget: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              forwardButton: (index) => StepperAButton(
                onComplete: () {
                  debugPrint("Forward Button click complete step call back!");
                },
                width: 40,
                height: 40,
                onTap: (int currentIndex) {
                  // Add the parameter type
                  debugPrint("Forward Button Current Index $currentIndex");
                },
                boxDecoration: BoxDecoration(
                    color: index == 3 ? Colors.indigo : Colors.green,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                buttonWidget: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
              customSteps: [
                CustomSteps(stepsIcon: Icons.login, title: "${intl.uriVideo}"),
                CustomSteps(stepsIcon: Icons.home, title: "${intl.terrain}"),
                CustomSteps(
                    stepsIcon: Icons.account_circle, title: "${intl.analyse}"),
              ],
              step: const StepA(
                  currentStepColor: Colors.green,
                  completeStepColor: Colors.indigo,
                  inactiveStepColor: Colors.black45,
                  margin: EdgeInsets.all(5)),
              stepperBodyWidget: [
                // Inside HomeVideoRecorder
                StepOneVideoRecorder(onUrlUpdate: (url) {
                  setState(() {
                    videoUrl = url; // Update video URL when entered in step one
                  });
                }),

                StepTwoVideoRecorder(
                  onSelectImage: (image) {
                    setState(() {
                      selectedTerrainImage = image;
                    });
                    controller.next(onTap: (int currentIndex) {});
                  },
                  videoUrl:
                      videoUrl, // Pass the video URL to StepTwoVideoRecorder
                ),
                StepTrieVideoRecorder(
                  selectedTerrainImage: selectedTerrainImage,
                  videoUrl: videoUrl, // Pass the video URL
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
