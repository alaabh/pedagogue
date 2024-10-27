import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../l10n/localization.dart';

class VideoPickerElementWidget extends StatefulWidget {
  final String? title;
  final String comment;
  XFile? videoFile;
  int? commentVisibility;
  final Color? titleBackgroundColor;
  Function(XFile? videoPath)? onVideoPicked;

  VideoPickerElementWidget({
    super.key,
    this.title,
    this.titleBackgroundColor,
    this.onVideoPicked,
    this.videoFile,
    this.commentVisibility,
    required this.comment,
  });

  @override
  State<VideoPickerElementWidget> createState() =>
      _VideoPickerElementWidgetState();
}

class _VideoPickerElementWidgetState extends State<VideoPickerElementWidget> {
  String? selectedVideoPath;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.videoFile != null) {
      _controller = VideoPlayerController.file(File(widget.videoFile!.path))
        ..initialize().then((_) {
          setState(() {});
          _controller!.play();
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          if (widget.title != null)
            Container(
              width: double.infinity,
              color: widget.titleBackgroundColor,
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.title!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          widget.commentVisibility == 0
              ? Container()
              : Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'You can upload a video here.',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: _controller == null || !_controller!.value.isInitialized
                ? Text(widget
                    .comment) // Placeholder widget when no video is selected
                : AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () async {
                final XFile? pickedFile = await ImagePicker().pickVideo(
                  source: ImageSource.gallery,
                );

                if (pickedFile != null) {
                  setState(() {
                    selectedVideoPath = pickedFile.path;
                    _controller =
                        VideoPlayerController.file(File(pickedFile.path))
                          ..initialize().then((_) {
                            setState(() {});
                            _controller!.play();
                          });
                  });

                  widget.onVideoPicked!(pickedFile);
                }
              },
              child: Text(intl.chooseVideo),
            ),
          ),
        ],
      ),
    );
  }
}
