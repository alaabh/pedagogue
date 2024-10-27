import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../model/library/kidsEps_model.dart';


class kidsCard extends StatefulWidget {
  final KidsEps kidsEps;
  final Function() loadDataFunction;

  const kidsCard({
    Key? key,
    required this.loadDataFunction, required this.kidsEps,
  }) : super(key: key);

  @override
  State<kidsCard> createState() => _JeuxCardState();
}

class _JeuxCardState extends State<kidsCard> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final String videoId = widget.kidsEps.videoId;
    if (videoId.isEmpty) {
      print("Error: videoId is empty");
    } else {
      _controller = YoutubePlayerController(
        initialVideoId: videoId, // Use the actual video ID
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Card( // Wrapping the content in a Card widget for elevated effect
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.kidsEps.title,
              style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.blueAccent), // Highlight the title
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Published at: ${widget.kidsEps.publishedAt}', // Added label for clarity
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ClipRRect( // Adding rounded corners to the video player
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4.0)),
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Theme.of(context).primaryColor,
              onReady: () {
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
