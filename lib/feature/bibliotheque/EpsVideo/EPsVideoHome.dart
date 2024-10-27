import 'package:flutter/material.dart';

import '../../../l10n/localization.dart';
import '../../../shared/style/dimensions.dart';
import '../FormationVideo/FormationVideoHome.dart';
import 'Gym/Gym_screen.dart';
import 'Natation/natation_screen.dart';
import 'jeux/jeux_screen.dart';
import 'kids/kids_screen.dart';
import 'warmingUp/warming_screen.dart';

class EpsVideo {
  final String title;
  final Widget destinationPage;

  EpsVideo(this.title, this.destinationPage);
}

class EpsVideoHome extends StatelessWidget {
  const EpsVideoHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste des vidéos avec leur destination
    final List<FormationVideo> videos = [
      FormationVideo(intl.epsVideosTitle1, WarmingUpscreen()),
      FormationVideo(intl.epsVideosTitle2, gymEps_screen()),
      FormationVideo(intl.epsVideosTitle3, JeuxEps_screen()),
      FormationVideo(intl.epsVideosTitle4, Kids_screen()),
      FormationVideo(intl.epsVideosTitle5, Natationscreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.epsVideos),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dimensions.paddingLarge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: videos
                .map((video) => Card(
                      child: ListTile(
                        title: Text(video.title),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => video.destinationPage));
                        },
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class EPSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EPS VIDEO'),
      ),
      body: const Center(
        child: Text('Content for Eps VIDEO'),
      ),
    );
  }
}
