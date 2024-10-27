import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../model/library/tacticaLZone_model.dart';

class TacticalZoneCard extends StatefulWidget {
  final TacticalZone? tacticalZone;
  final Function() loadDataFunction;

  const TacticalZoneCard({
    Key? key,
    required this.loadDataFunction, required this.tacticalZone,
  }) : super(key: key);

  @override
  State<TacticalZoneCard> createState() => _TacticalZoneCardState();
}

class _TacticalZoneCardState extends State<TacticalZoneCard> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final String videoId = widget.tacticalZone?.videoId?.isNotEmpty == true ? widget.tacticalZone!.videoId! : 'dQw4w9WgXcQ'; // Updated logic
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
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
              widget.tacticalZone!.title ?? 'Default Title', // Safe fallback for title
              style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.blueAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Published at: ${widget.tacticalZone!.publishedAt }', // Safe fallback for published date
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
                _controller.play();
                print(_controller);

                print('Player is ready.');
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
