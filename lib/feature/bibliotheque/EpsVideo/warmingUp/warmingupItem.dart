import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../model/library/warmingup_model.dart';

class WrmingUpCard extends StatefulWidget {
  final WarmingUp warmingUp;
  final Function() loadDataFunction;

  const WrmingUpCard({
    Key? key,
    required this.loadDataFunction, required this.warmingUp,
  }) : super(key: key);

  @override
  State<WrmingUpCard> createState() => _WarmingCardState();
}
class _WarmingCardState extends State<WrmingUpCard> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.warmingUp.videoId, // Assuming videoId is just the ID, not the full URL
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
             ' ${widget.warmingUp.title}',
              style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.blueAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Published at: ${widget.warmingUp.publishedAt}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4.0)),
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Theme.of(context).primaryColor,
              onReady: () {
                print("Player is ready.");
                _controller.play();
                _controller.addListener(listener);


              },
              onEnded: (error) {
                print('Video has ended.');

                print('Error: $error');
              },
            ),


          ),
        ],
      ),
    );
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
      });
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


}
