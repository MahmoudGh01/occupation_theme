// import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

class AudioRecorderService {
  late FlutterSoundRecorder _recorder;
  bool _isRecording = false;
  late String _filePath;

  Future<void> init() async {
    _recorder = FlutterSoundRecorder();
    await _recorder.openAudioSession();
    _isRecording = false;

    final directory = await getTemporaryDirectory();
    _filePath = '${directory.path}/interview_recording.aac';
  }

  Future<void> startRecording(String filePath) async {
    await _recorder.startRecorder(toFile: _filePath);
    _isRecording = true;
  }

  Future<String> stopRecording() async {
    await _recorder.stopRecorder();
    _isRecording = false;
    return _filePath; // Return the path where the recording is saved.
  }

  Future<void> dispose() async {
    await _recorder.closeAudioSession();
  }

  bool get isRecording => _isRecording;
}
