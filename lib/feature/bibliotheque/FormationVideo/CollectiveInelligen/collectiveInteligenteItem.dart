import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../model/library/collectiveintelligence_model.dart';


class collectiveIntelligenceCard extends StatefulWidget {
  final CollectiveIntelligence collectiveIntelligence;
  final Function() loadDataFunction;

  const collectiveIntelligenceCard({
    Key? key,
    required this.loadDataFunction, required this.collectiveIntelligence,
  }) : super(key: key);

  @override
  State<collectiveIntelligenceCard> createState() => _FootballExerciceCardState();
}

class _FootballExerciceCardState extends State<collectiveIntelligenceCard> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final String videoId = widget.collectiveIntelligence.videoId; // Correct property for video ID.
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
              widget.collectiveIntelligence.title,
              style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.blueAccent), // Highlight the title
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Published at: ${widget.collectiveIntelligence.publishedAt}', // Added label for clarity
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
                _controller.play();

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
