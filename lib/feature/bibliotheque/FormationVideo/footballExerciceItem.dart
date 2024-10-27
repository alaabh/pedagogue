import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../model/FootBalExercice_model.dart';

class FootballExerciseCard extends StatefulWidget {
  final FootballExercise? footballExercise;
  final Function() loadDataFunction;

  const FootballExerciseCard({
    Key? key,
     this.footballExercise,
    required this.loadDataFunction,
  }) : super(key: key);

  @override
  State<FootballExerciseCard> createState() => _FootballExerciseCardState();
}

class _FootballExerciseCardState extends State<FootballExerciseCard> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final String? videoId = widget.footballExercise!.videoId ;
    _controller = YoutubePlayerController(
      initialVideoId: videoId!, // Fallback to a placeholder video if `videoId` is null
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
              widget.footballExercise?.title ?? 'Default Title', // Provide a default value
              style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.blueAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            // Fixed string interpolation syntax
            child: Text(
              'Published at: ${widget.footballExercise?.publishedAt ?? 'Unknown Date'}',
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
