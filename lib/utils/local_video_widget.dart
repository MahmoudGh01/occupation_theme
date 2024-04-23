import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LocalVideoWidget extends StatefulWidget {
  final String videoPath;

  const LocalVideoWidget({Key? key, required this.videoPath}) : super(key: key);

  @override
  _LocalVideoWidgetState createState() => _LocalVideoWidgetState();
}

class _LocalVideoWidgetState extends State<LocalVideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {}); // When the controller is initialized, update the UI.
        _controller.play(); // Play the video!
      });
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
