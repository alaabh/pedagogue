import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pedagogue/shared/widget/custom_button.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';
import 'package:video_player/video_player.dart';

import '../../l10n/localization.dart';
import '../../shared/style/app_color.dart';
import '../../shared/style/dimensions.dart';
import '../../utils/resources/api/token_manager.dart';
import '../espqceEPS/ficheDePresence/save_file_mobile.dart';
import '../home/tabs/home/statistics_game_live/widgets/video_picker_idget.dart';

class TennisAi extends StatefulWidget {
  const TennisAi({super.key});

  @override
  State<TennisAi> createState() => _TennisAiState();
}

class _TennisAiState extends State<TennisAi> {
  VideoPlayerController videoController =
      VideoPlayerController.networkUrl(Uri());
  Future<void> uploadVideo(BuildContext context, XFile videoFile) async {
    bool authIsRequired = true;
    Map<String, String> headers = {};

    // Load and attach the token if required
    if (authIsRequired) {
      await TokenManager.loadToken();
      headers.addAll({'Authorization': 'Bearer ${TokenManager.storedToken}'});
    }

    final uri =
        Uri.parse('https://4a6d-196-203-166-66.ngrok-free.app/upload_video');

    // Create multipart request
    var request = http.MultipartRequest('POST', uri)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('file', videoFile.path,
          contentType: MediaType('video', 'mp4')));

    // Send the request
    var streamedResponse = await request.send();

    // Await the response
    final response = await http.Response.fromStream(streamedResponse);

    print(response.statusCode);
    if (response.statusCode == 200) {
      var documentDirectory = await getApplicationDocumentsDirectory();
      var filePath = '${documentDirectory.path}/downloaded_video.mp4';

      // Save the video file
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      print("ahaaaaaaaaaaawwwwwwwwwwwaaaaaaaaaaaaaaaaaaaaa");
      print(file);
      videoController = VideoPlayerController.file(file)
        ..initialize().then((_) {
          setState(() {
            analyzeVideoLoader = false;
            fileLoader = false;
            ready = true;
          });
          // Ensure the first frame is shown after the video is initialized
        });
      getResult(context);

      print("data");
    } else {
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

  bool ready = false;
  XFile? selectedImage1Path;
  bool _displayPauseIcon = true;
  Timer? _iconVisibilityTimer;
  void _togglePlay() {
    setState(() {
      if (videoController.value.isPlaying) {
        videoController.pause();
        _displayPauseIcon = true; // Show the pause icon when pausing
        _iconVisibilityTimer?.cancel(); // Cancel any existing timer
      } else {
        videoController.play();
        _displayPauseIcon =
            true; // Ensure the icon is visible when starting to play
        _iconVisibilityTimer?.cancel(); // Cancel any existing timer
        _iconVisibilityTimer = Timer(const Duration(seconds: 1), () {
          setState(() {
            _displayPauseIcon = false; // Hide the pause icon after 1 second
          });
        });
      }
    });
  }

  Future<void> getResult(BuildContext context) async {
    Map<String, String>? headers;
    headers ??= {};

    final url = Uri.parse(
        'https://4a6d-196-203-166-66.ngrok-free.app/csv/speed_data.csv');
    final response = await http.get(
      url,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = response.body;
      saveFile(data);
      print(data);
    } else {
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

  bool videoUploaded = false;

  Future<void> saveFile(String csvData) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/downloaded_file.csv');

    await file.writeAsString(csvData);
    setState(() {
      csvFile = file.path;
    });
    print('File saved at ${file.path}');
  }

  String csvFile = "";

  void processFile(String path) async {
    List<int> fileData = await fileToList(path);
    // You can now work with the file data as a List<int>
    print('File has ${fileData.length} bytes.');
  }

  Future<List<int>> fileToList(String filePath) async {
    try {
      File file = File(filePath);
      List<int> bytes = await file.readAsBytes();
      saveAndLaunchFile(bytes, "Tennis Ai");
      return bytes;
    } catch (e) {
      print('Error reading file: $e');
      return []; // Return an empty list in case of error
    }
  }

  bool fileLoader = true;
  bool analyzeVideoLoader = false;
  bool fullScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${intl.tennis} Ai")),
      body: SingleChildScrollView(
        padding: Dimensions.paddingMedium,
        child: Column(
          children: [
            VideoPickerElementWidget(
              commentVisibility: 0,
              title: "",
              comment: intl.uploadvideoTennisComment,
              titleBackgroundColor: AppColors.primaryLightColor,
              onVideoPicked: (videoPath) => selectedImage1Path = videoPath,
            ),
            Dimensions.verticalSpacingSmall,
            analyzeVideoLoader
                ? LoadingWidget()
                : CustomButton(
                    text: intl.videoAnalysis,
                    onPressed: () {
                      if (selectedImage1Path == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // Return an AlertDialog with success message
                            return AlertDialog(
                              // title: Text('failed'),
                              content: Text(intl.videouploadWarning),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(intl.ok),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        setState(() {
                          analyzeVideoLoader = true;
                        });
                        uploadVideo(context, XFile(selectedImage1Path!.path));

                        print(selectedImage1Path!.path);
                      }
                    }),
            Dimensions.verticalSpacingSmall,
            (videoController.value.isInitialized == true && ready == true)
                ? RotatedBox(
                    quarterTurns: fullScreen ? 1 : 0,
                    child: GestureDetector(
                      onTap: _togglePlay,
                      child: AspectRatio(
                        aspectRatio: videoController.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            VideoPlayer(videoController),
                            if (_displayPauseIcon)
                              Icon(
                                videoController.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 50,
                                color: Colors.white,
                              ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: IconButton(
                                icon: Icon(
                                  Icons.fullscreen,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    fullScreen = !fullScreen;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
            Dimensions.verticalSpacingSmall,
            Dimensions.verticalSpacingExtraLarge,
            fileLoader
                ? Container()
                : CustomButton(
                    text: intl.getTheFile,
                    onPressed: () {
                      print(csvFile);
                      fileToList(csvFile);
                      //uploadVideo(context, XFile(selectedImage1Path!.path));

                      // print(selectedImage1Path!.path);
                    }),
          ],
        ),
      ),
    );
  }
}
