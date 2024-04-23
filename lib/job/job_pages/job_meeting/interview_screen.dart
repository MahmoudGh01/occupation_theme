import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/services/FileManager.dart';
import 'package:job_seeker/services/audio_recorder_service.dart';
import 'package:job_seeker/services/camera_service.dart';
import 'package:job_seeker/utils/camera_widget.dart';
import 'package:job_seeker/utils/local_video_widget.dart';
import 'package:path_provider/path_provider.dart';

class InterviewMeetingPage extends StatefulWidget {
  @override
  _InterviewMeetingPageState createState() => _InterviewMeetingPageState();
}

class _InterviewMeetingPageState extends State<InterviewMeetingPage> {
  late CameraService _cameraService;
  late AudioRecorderService _audioRecorderService;
  bool _isRecordingVideo = false;
  bool _isRecordingAudio = false;

  @override
  void initState() {
    super.initState();
    _cameraService = CameraService();
    _audioRecorderService = AudioRecorderService();
    initialize();
  }

  void initialize() async {
    await _cameraService.initializeCamera();
    await _audioRecorderService.init();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _cameraService.dispose();
    if (_isRecordingAudio) {
      _audioRecorderService.stopRecording();
    }
    _audioRecorderService.dispose();
    super.dispose();
  }

  void _toggleCamera() {
    setState(() {
      _cameraService.isCameraEnabled = !_cameraService.isCameraEnabled;
    });
  }

  void _toggleMicrophone() async {
    if (_isRecordingAudio) {
      await _audioRecorderService.stopRecording();
    } else {
      final directory = await getApplicationDocumentsDirectory();
      final audioPath = '${directory.path}/interview_audio.aac';
      await _audioRecorderService.startRecording(audioPath);
    }
    setState(() {
      _isRecordingAudio = !_isRecordingAudio;
    });
  }

  void _onRecordButtonPressed() async {
    if (_isRecordingVideo && _isRecordingAudio) {
      await _cameraService.controller.stopVideoRecording();
      await _audioRecorderService.stopRecording();
      await getDirectoryfiles();
      setState(() {
        _isRecordingVideo = false;
        _isRecordingAudio = false;
      });
    } else {
      final directory = await getTemporaryDirectory();
      final videoPath = '${directory.path}/interview_video.mp4';
      final audioPath = '${directory.path}/interview_audio.aac';

      await _cameraService.controller.startVideoRecording();
      await _audioRecorderService.startRecording(audioPath);
      setState(() {
        _isRecordingVideo = true;
        _isRecordingAudio = true;
      });
    }
  }

  Future<void> getDirectoryfiles() async {
    // Step 1: Let the user pick a file
    FilePickerResult? result = await FileManager.pickFile();

    if (result != null) {
      // Step 2: Get the file from the result
      PlatformFile file = result.files.first;
      print('File Picked :$file.name');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interview Meeting')),
      body: Column(
        children: [
          const Expanded(
            child: LocalVideoWidget(
                videoPath: 'assets/videos/interview_video.mp4'),
          ),
          if (_cameraService.isInitialized)
            CameraPreviewWidget(cameraService: _cameraService),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(_cameraService.isCameraEnabled
                    ? Icons.videocam
                    : Icons.videocam_off),
                onPressed: _toggleCamera,
              ),
              IconButton(
                icon: Icon(_isRecordingAudio ? Icons.mic : Icons.mic_off),
                onPressed: _toggleMicrophone,
              ),
              ElevatedButton(
                onPressed: _onRecordButtonPressed,
                child: Text(_isRecordingVideo && _isRecordingAudio
                    ? 'Stop Recording'
                    : 'Start Recording'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
