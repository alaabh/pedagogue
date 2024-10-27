import 'package:flutter/material.dart';
import 'package:pedagogue/shared/style/theme/themes.dart';
import 'package:pedagogue/shared/widget/video_player_widget.dart';

import '../../l10n/localization.dart';
import '../style/app_color.dart';

class VideoPlayerView extends StatelessWidget {
  final String? filename;
  final String? baseUrl;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const VideoPlayerView({
    super.key,
    required this.filename,
    required this.baseUrl,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.videoPlayer),
        systemOverlayStyle: Themes.darkSystemUI,
      ),
      backgroundColor: AppColors.primaryDarkColor,
      body: Center(
        child: VideoPlayerWidget(
          filename: filename,
          baseUrl: baseUrl,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          showControls: true,
          videoViewerOnTap: false,
          volume: 1,
        ),
      ),
    );
  }
}
