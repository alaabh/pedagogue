import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pedagogue/feature/analyse_biomecanique_gestuelle/analyse_main.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:video_player/video_player.dart';

import '../../l10n/localization.dart';
import '../../shared/style/app_color.dart';

class PullUpVideoPross extends StatefulWidget {
  final String videoPath;
  const PullUpVideoPross({
    super.key,
    required this.videoPath,
  });

  @override
  State<PullUpVideoPross> createState() => _PullUpVideoProssState();
}

class _PullUpVideoProssState extends State<PullUpVideoPross> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    print("beeeeee5555555");
    print(widget.videoPath);
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized, if necessary
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AnalyseMain()),
            );
            /*  Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AnalyseMain()),
            ); */
          },
        ),
        title: Text('Video prossesed'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Dimensions.verticalSpacingSmall,
            Center(
              child: _controller.value.isInitialized
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
