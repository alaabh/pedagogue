import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioWidget extends StatefulWidget {
  final String source;
  const AudioWidget({super.key, required this.source});

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;
  bool isMuted = false;
  double playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    FlutterDownloader.initialize();
    setupAudio();
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    audioPlayer.onPlayerComplete.listen((_) async {
      setState(() {
        position = Duration.zero;
        setupAudio();
        isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void setupAudio() async {
    try {
      await audioPlayer.setSourceUrl(widget.source);
    } catch (e) {
      print("Error setting up audio: $e");
    }
  }

  void playPause() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      // Check if audio is complete
      if (position == duration) {
        // Seek to the beginning and resume
        await audioPlayer.seek(Duration.zero);
      }
      await audioPlayer.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void mute() {
    setState(() {
      isMuted = !isMuted;
      audioPlayer.setVolume(isMuted ? 0.0 : 1.0);
    });
  }

  void seekTo(double value) async {
    final newPosition = Duration(
        seconds: value
            .clamp(0, duration.inSeconds - 1)
            .toInt()); // Clamp value to valid range
    await audioPlayer.seek(newPosition);
    setState(() {
      position = newPosition;
    });
  }

  void downloadAudio() async {
    final taskId = await FlutterDownloader.enqueue(
      url: widget.source,
      savedDir: (await getExternalStorageDirectory())!.path,
      showNotification: true,
      fileName: Uri.parse(widget.source).path.split('/').last,
    );

    print('Downloading audio with task ID: $taskId');
  }

  Future<void> downloadFile(String url, String fileName) async {
    // Request storage permission if needed
    if (Platform.isAndroid) {
      final storageStatus = await Permission.storage.request();
      if (!storageStatus.isGranted) {
        throw Exception('Storage permission denied');
      }
    }

    final dio = Dio();
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';

    try {
      final response = await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          // Optional: Update UI with download progress
          print('Download progress: ${(received / total) * 100}%');
        },
      );

      if (response.statusCode == 200) {
        print('Download completed: $filePath');
        // Handle successful download (e.g., show a success message)
      } else {
        print('Download failed with status code: ${response.statusCode}');
        // Handle download failure (e.g., show an error message)
      }
    } on DioError catch (e) {
      print('Download error: $e');
      // Handle download errors (e.g., network issues, invalid URL)
    }
  }

  @override
  Widget build(BuildContext context) {
    return duration.inSeconds == 0
        ? LoadingWidget()
        : Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: playPause,
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    ),
                    Slider(
                      value: position.inSeconds.toDouble(),
                      min: 0.0,
                      max: duration.inSeconds.toDouble(),
                      onChanged: (value) => seekTo(value),
                    ),
                    IconButton(
                      onPressed: mute,
                      icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                    ),
                    IconButton(
                      onPressed: () {
                        downloadFile(widget.source,
                            Uri.parse(widget.source).path.split('/').last);
                      },
                      icon: Icon(Icons.download),
                    ),
                  ],
                ),
              ),
              Text(
                '${position.inMinutes}:${position.inSeconds % 60}\t-\t${duration.inMinutes}:${duration.inSeconds % 60}',
                style: TextStyle(fontSize: 12),
              ),
            ],
          );
  }
}
