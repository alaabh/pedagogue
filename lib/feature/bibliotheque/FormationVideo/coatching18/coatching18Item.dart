import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../model/library/coatching18_20.dart';


class Coatching18Card extends StatefulWidget {
  final Coaching18 coaching18;
  final Function() loadDataFunction;

  const Coatching18Card({
    Key? key,
    required this.loadDataFunction, required this.coaching18,
  }) : super(key: key);

  @override
  State<Coatching18Card> createState() => _Coatching18CardState();
}

class _Coatching18CardState extends State<Coatching18Card> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Assuming your model has a property named 'videoId' that actually contains the video ID.
    final String videoId = widget.coaching18.videoId; // Correct property for video ID.
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
              widget.coaching18.title,
              style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.blueAccent), // Highlight the title
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Published at: ${widget.coaching18.publishedAt}', // Added label for clarity
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
                _controller.play();
             print( _controller);
                print('Player is ready.');
              },
            ),
          ),
        ],
      ),
    );
  }


}
