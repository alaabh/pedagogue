import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedagogue/feature/splash/features_pedagogue/features_pedagogue2.dart';
import 'package:pedagogue/feature/splash/features_pedagogue/features_pedagogue4.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';
import 'package:video_player/video_player.dart';

class Features3 extends StatefulWidget {
  const Features3({super.key});

  @override
  State<Features3> createState() => _Features3State();
}

class _Features3State extends State<Features3> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://sportspedagogue.com/wp-content/uploads/2023/03/Calculateur.mp4'))
      ..initialize().then((_) {
       
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
@override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  bool _displayPauseIcon = true;
  Timer? _iconVisibilityTimer;
  void _togglePlay() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _displayPauseIcon = true; // Show the pause icon when pausing
        _iconVisibilityTimer?.cancel(); // Cancel any existing timer
      } else {
        _controller.play();
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
  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Dimensions.verticalSpacingExtraLarge,
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  "SPORTS PEDAGOGUE",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Dimensions.verticalSpacingExtraLarge,
                _controller.value.isInitialized
                    ? GestureDetector(
                        onTap: _togglePlay,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              VideoPlayer(_controller),
                              if (_displayPauseIcon)
                                Icon(
                                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                  size: 50,
                                  color: Colors.white,
                                ),
                            ],
                          ),
                        ),
                      )
                    : LoadingWidget(),
                Dimensions.verticalSpacingExtraLarge,
                Text(
                  intl.features1Title3,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Dimensions.verticalSpacingExtraLarge,
                Text(
               intl.features1Par3,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
