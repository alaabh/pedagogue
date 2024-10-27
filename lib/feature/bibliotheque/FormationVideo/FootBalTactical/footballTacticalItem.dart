import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../model/library/footballTactical.dart';

class FootballTacticalCard extends StatefulWidget {
  final FootballTactical? footballTactical;
  final Function() loadDataFunction;


  const FootballTacticalCard({Key? key, this.footballTactical, required this.loadDataFunction}) : super(key: key);

  @override
  State<FootballTacticalCard> createState() => _FootballTacticalCardState();
}

class _FootballTacticalCardState extends State<FootballTacticalCard> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Ensure videoId is not null or empty before initializing the controller
    if (widget.footballTactical?.videoId != null && widget.footballTactical!.videoId!.isNotEmpty) {
      _controller = YoutubePlayerController(
        initialVideoId: widget.footballTactical!.videoId!,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    } else {
      print("Error: videoId is empty or null.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(widget.footballTactical?.title ?? "Title not available"),
          Text(widget.footballTactical?.publishedAt ?? "Date not available"),
          if (widget.footballTactical?.videoId != null && widget.footballTactical!.videoId!.isNotEmpty)
            YoutubePlayer(controller: _controller),
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
