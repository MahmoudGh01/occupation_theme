import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../services/audio_recorder_service.dart';

class MicroWidget extends StatefulWidget {
  final AudioRecorderService audioRecorderService;

  const MicroWidget({Key? key, required this.audioRecorderService})
      : super(key: key);

  @override
  _MicroWidgetState createState() => _MicroWidgetState();
}

class _MicroWidgetState extends State<MicroWidget> {
  bool _isMicroOn = false;

  void _toggleMicro() async {
    if (_isMicroOn) {
      final path = await widget.audioRecorderService.stopRecording();
      print("Audio recording saved to $path");
    } else {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/my_audio_recording.aac';
      await widget.audioRecorderService.startRecording(filePath);
    }
    setState(() {
      _isMicroOn = !_isMicroOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isMicroOn ? Icons.mic : Icons.mic_off),
      onPressed: _toggleMicro,
      color: _isMicroOn ? Colors.green : Colors.red,
    );
  }
}
