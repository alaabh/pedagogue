import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:native_video_view/native_video_view.dart';
import 'package:pedagogue/shared/widget/video_player_view.dart';

import '../style/app_color.dart';
import '../style/dimensions.dart';
import 'loading_widget.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String? filename;
  final String? baseUrl;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool showControls;
  final bool videoViewerOnTap;
  final double volume;

  const VideoPlayerWidget({
    super.key,
    required this.filename,
    this.baseUrl,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.showControls = true,
    this.videoViewerOnTap = false,
    this.volume = 1.0,
  });

  @override
  VideoPlayerWidgetState createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
// --------------------------- BUILD METHODS -----------------------------  //

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.maxFinite,
      height: widget.height ?? 300,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColors.primaryDarkColor,
        borderRadius: widget.borderRadius != null
            ? BorderRadius.all(Radius.circular(widget.borderRadius!))
            : Dimensions.smallBorderRadius,
      ),
      child: widget.filename == null
          ? _buildPlaceholderVideo()
          : _buildVideoWidget(),
    );
  }

  Widget _buildVideoWidget() {
    final url = widget.baseUrl == null
        ? '${widget.filename}'
        : '${widget.baseUrl}/${widget.filename}';

    return FutureBuilder(
      future: DefaultCacheManager().getSingleFile(url),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Stack(
            children: [
              SizedBox(
                width: widget.width,
                height: widget.height,
                child: NativeVideoView(
                  keepAspectRatio: false,
                  showMediaController: widget.showControls,
                  useExoPlayer: false,
                  onCreated: (controller) {
                    controller.setVolume(widget.volume);
                    controller.setVideoSource(
                      snapshot.data!.path,
                      sourceType: VideoSourceType.file,
                    );
                  },
                  onPrepared: (controller, info) {
                    controller.play();
                  },
                  onCompletion: (controller) {
                    controller.play();
                  },
                  onError: (controller, what, extra, message) {
                    if (kDebugMode) {
                      print('Player Error ($what | $extra | $message)');
                    }
                  },
                ),
              ),
              if (widget.videoViewerOnTap)
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerView(
                        filename: snapshot.data!.path,
                        baseUrl: widget.baseUrl,
                        backgroundColor: widget.backgroundColor,
                        foregroundColor: widget.foregroundColor,
                      ),
                    ),
                  ),
                ),
            ],
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  Widget _buildPlaceholderVideo() {
    return Center(
      child: Icon(
        Icons.video_collection,
        color: widget.foregroundColor ?? AppColors.textColorInverted,
        size: 60,
      ),
    );
  }
}
