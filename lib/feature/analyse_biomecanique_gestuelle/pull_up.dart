import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pedagogue/feature/analyse_biomecanique_gestuelle/pull_up_videoPross.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';
import 'package:video_player/video_player.dart';

import '../../l10n/localization.dart';
import '../../shared/style/dimensions.dart';
import '../home/tabs/home/statistics_game_live/widgets/video_picker_idget.dart';

class PullUp extends StatefulWidget {
  final String title;
  final String description;
  final String demo;
  final String url;
  const PullUp(
      {super.key,
      required this.title,
      required this.description,
      required this.demo,
      required this.url});

  @override
  State<PullUp> createState() => _PullUpState();
}

class _PullUpState extends State<PullUp> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  bool isControllerInitialized = false;
  bool isRecording = false;
  VideoPlayerController? videoController;

  Future<void> initCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        controller = CameraController(cameras![0], ResolutionPreset.high);
        await controller!.initialize();
        setState(() {
          isControllerInitialized = true;
        });
      } else {
        print('No cameras available');
      }
    } catch (e) {
      print('Failed to initialize camera: $e');
    }
  }

  Future<void> startVideoRecording() async {
    if (controller != null && isControllerInitialized) {
      await controller!.startVideoRecording();
      setState(() {
        isRecording = true;
      });
    }
  }

  Future<void> stopVideoRecording() async {
    if (controller != null && isRecording) {
      XFile videoFile = await controller!.stopVideoRecording();
      setState(() {
        isRecording = false;
        selectedImage1Path = videoFile;
        print(videoFile);
      });
      startVideoPlayer(videoFile);
    }
  }

  void startVideoPlayer(XFile videoFile) {
    if (videoController != null) {
      videoController!.dispose();
    }
    videoController = VideoPlayerController.file(File(videoFile.path))
      ..initialize().then((_) {
        setState(() {});
        videoController!.play();
      });
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    initCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    videoController?.dispose();
    super.dispose();
  }

  bool hideCamera = false;
  VideoPlayerController? _controller;
  void _showVideoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${intl.demo}'),
          content: Container(
            // You might need to adjust the height and width
            height: 300,
            width: 300,
            child: _controller!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(intl.play),
              onPressed: () {
                _controller!.play();
              },
            ),
            ElevatedButton(
              child: Text(intl.pause),
              onPressed: () {
                _controller!.pause();
              },
            ),
            ElevatedButton(
              child: Text(intl.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool uploadVideoLoading = false;
  bool pickVideo = true;
  bool takevideofromcamera = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: uploadVideoLoading
          ? LoadingWidget()
          : Column(
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Dimensions.verticalSpacingSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    widget.description,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Dimensions.verticalSpacingSmall,
                Dimensions.verticalSpacingSmall,
                ElevatedButton(
                    onPressed: () async {
                      _controller = await VideoPlayerController.asset(
                        widget.demo, // Replace with your video URL
                      )
                        ..initialize().then((_) {
                          setState(() {
                            _showVideoDialog();
                          });
                        });
                    },
                    child: Text("${intl.showDemo}")),
                Dimensions.verticalSpacingSmall,
                Dimensions.verticalSpacingSmall,
                hideCamera == true
                    ? Container()
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    pickVideo = false;
                                    takevideofromcamera = true;
                                  });
                                },
                                child: Text(
                                  "Use Camera",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: takevideofromcamera
                                          ? AppColors.primaryColor
                                          : Colors.black),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    pickVideo = true;
                                    takevideofromcamera = false;
                                  });
                                },
                                child: Text(
                                  "From Gallery",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: pickVideo
                                          ? AppColors.primaryColor
                                          : Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Dimensions.verticalSpacingSmall,
                          Visibility(
                            visible: takevideofromcamera,
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: isControllerInitialized &&
                                          controller != null
                                      ? CameraPreview(
                                          controller!,
                                        )
                                      : Center(
                                          child: CircularProgressIndicator()),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: isRecording
                                          ? null
                                          : startVideoRecording,
                                      child: Text(isRecording
                                          ? '${intl.recording}...'
                                          : '${intl.startrecording}'),
                                    ),
                                    SizedBox(width: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        isRecording
                                            ? stopVideoRecording()
                                            : null;
                                        setState(() {
                                          hideCamera = true;
                                        });
                                        // controller!.dispose();
                                      },
                                      child: Text('${intl.stoprecording}'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: pickVideo,
                            child: Column(
                              children: [
                                VideoPickerElementWidget(
                                  commentVisibility: 0,
                                  title: "",
                                  comment: "",
                                  titleBackgroundColor:
                                      AppColors.primaryLightColor,
                                  onVideoPicked: (videoPath) =>
                                      selectedImage1Path = videoPath,
                                ),
                                Dimensions.verticalSpacingSmall,
                                Dimensions.verticalSpacingSmall,
                                CustomButton(
                                    text: intl.videoAnalysis,
                                    onPressed: () {
                                      setState(() {
                                        uploadVideoLoading = true;
                                      });

                                      uploadVideo(context,
                                          XFile(selectedImage1Path!.path));
                                      //getResult(context);

                                      print(selectedImage1Path!.path);
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                Dimensions.verticalSpacingSmall,
                (videoController != null &&
                        videoController!.value.isInitialized &&
                        hideCamera == true)
                    ? Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: AspectRatio(
                                aspectRatio: videoController!.value.aspectRatio,
                                child: VideoPlayer(videoController!)),
                          ),
                          Dimensions.verticalSpacingSmall,
                          Dimensions.verticalSpacingSmall,
                          Column(
                            children: [
                              CustomButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  text: "${intl.takeanothervideo}",
                                  onPressed: () {
                                    setState(() {
                                      hideCamera = false;
                                    });
                                  }),
                              Dimensions.verticalSpacingSmall,
                              Dimensions.verticalSpacingSmall,
                              CustomButton(
                                  text: intl.videoAnalysis,
                                  onPressed: () {
                                    setState(() {
                                      uploadVideoLoading = true;
                                    });

                                    uploadVideo(context,
                                        XFile(selectedImage1Path!.path));
                                    //getResult(context);

                                    print(selectedImage1Path!.path);
                                  }),
                            ],
                          )
                        ],
                      )
                    : Container(),
                Dimensions.verticalSpacingSmall,
                Dimensions.verticalSpacingSmall,
                Dimensions.verticalSpacingSmall,
              ],
            ),
    );
  }

  String filename = "";
  Future<File> convertTempVideoToMp4(String tempFilePath) async {
    final File tempFile = File(tempFilePath);

    if (await tempFile.exists()) {
      // Create a new path with the same path but with .mp4 extension
      final String newPath = tempFilePath.replaceAll('.temp', '.mp4');
      final File newFile = await tempFile.rename(newPath);
      return newFile;
    } else {
      // Throw an exception or handle the error that the file does not exist
      throw Exception('The specified file does not exist.');
    }
  }

  Future<void> uploadVideo(BuildContext context, XFile videoFile) async {
    setState(() {});
    try {
      File mp4File = await convertTempVideoToMp4(videoFile.path);
      setState(() {
        selectedImage1Path = XFile(mp4File.path);
      });
      // Now you can use your mp4 file for whatever needs you have
    } catch (e) {
      print('Error converting file: $e');
    }
    Map<String, String> headers = {};

    // Load and attach the token if required

    final uri = Uri.parse('https://0131-196-203-166-66.ngrok-free.app/upload');

    // Create multipart request
    var request = http.MultipartRequest('POST', uri)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath(
          'file', selectedImage1Path!.path,
          contentType: MediaType('video', 'mp4')));

    // Send the request
    var streamedResponse = await request.send();

    // Await the response
    final response = await http.Response.fromStream(streamedResponse);

    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      setState(() {
        filename = data["filename"].toString();
        getResult(data["filename"].toString(), context);
      });
      print(data);
    } else {
      var data = jsonDecode(response.body);
      print(data);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with a failure message
          return AlertDialog(
            title: Text('Upload Failed'),
            content: Text('Check your internet connection or your input'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  String filePathVideo = "";
  String processed_video_url = "";
  bool ready = false;
  XFile? selectedImage1Path;
  Future<void> getResult(dynamic filename, BuildContext context) async {
    final url = Uri.parse('https://0131-196-203-166-66.ngrok-free.app/process');
    Map<String, String>? headers;

    headers ??= {};
    headers.addAll({'Content-Type': 'application/json; charset=utf-8'});
    final response = await http.post(url,
        headers: headers,
        body: jsonEncode({
          "filename": filename,
          "is_legs": true,
          "is_arms": true,
          "is_ankles": true,
          "is_leftLimb": true,
          "is_rightLimb": true,
          "min_degree": 0,
          "max_degree": 180,
          "counter_left": 0,
          "counter_right": 0
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        processed_video_url = data['processed_video_url'].toString();
        downloadAndSaveVideo(processed_video_url, "processedVideo");
      });

      print(data);
    } else {
      print(response.body);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Return an AlertDialog with success message
          return AlertDialog(
            title: Text('failed'),
            content: Text('Check your internet connection or your input'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> downloadAndSaveVideo(String url, String fileName) async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/$fileName.mp4';
      http.Response response = await http.get(Uri.parse("$url"));

      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      //startVideoPlayer(XFile(file.path));

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => PullUpVideoPross(
                  videoPath: file.path,
                )),
      );

      print('File downloaded and saved at $filePath');
    } catch (e) {
      setState(() {});
      print('An error occurred: $e');
    }
  }
}
