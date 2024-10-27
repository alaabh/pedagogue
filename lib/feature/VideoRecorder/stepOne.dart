import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../l10n/localization.dart';

class StepOneVideoRecorder extends StatefulWidget {
  final Function(String) onUrlUpdate;

  const StepOneVideoRecorder({Key? key, required this.onUrlUpdate})
      : super(key: key);

  @override
  _YourVideoPlayerWidgetState createState() => _YourVideoPlayerWidgetState();
}

class _YourVideoPlayerWidgetState extends State<StepOneVideoRecorder> {
  late YoutubePlayerController _youtubePlayerController;
  final TextEditingController _urlVideoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final String videoId = _urlVideoController.text;
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId, // A default video ID
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void _loadAndPlayYoutubeVideo(String url) {
    // Extract video ID from URL.
    String? videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId != null) {
      _youtubePlayerController.load(videoId);
      _youtubePlayerController.play();
    } else {
      print("Error: Could not extract video ID from URL");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _urlVideoController,
            decoration: InputDecoration(
              labelText: intl.enterVideoURL,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onUrlUpdate(_urlVideoController.text);
              print('Loading video URL: ${_urlVideoController.text}');
              _loadAndPlayYoutubeVideo(_urlVideoController.text);
            },
            child: Text(intl.loadVideo),
          ),
          YoutubePlayer(
            controller: _youtubePlayerController,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    _urlVideoController.dispose();
    super.dispose();
  }
}
