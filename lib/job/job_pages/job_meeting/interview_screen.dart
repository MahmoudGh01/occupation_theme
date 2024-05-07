import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:job_seeker/providers/userprovider.dart';
import 'package:job_seeker/services/FileManager.dart';
import 'package:job_seeker/services/audio_recorder_service.dart';
import 'package:job_seeker/services/camera_service.dart';
import 'package:job_seeker/utils/camera_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/constants.dart';

class InterviewMeetingPage extends StatefulWidget {
  @override
  _InterviewMeetingPageState createState() => _InterviewMeetingPageState();
}

class _InterviewMeetingPageState extends State<InterviewMeetingPage> {
  late CameraService _cameraService;
  bool _isRecordingVideo = false;
  bool _isRecordingAudio = false;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _cameraService = CameraService();

    // For a network video
    _controller = VideoPlayerController.network(
        '${Constants.uri}/video?video_name=Video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    initialize();
  }

  void initialize() async {
    await _cameraService.initializeCamera();
    _cameraService.controller.enableAudio;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _cameraService.dispose();
    _controller?.dispose();
    super.dispose();
  }

  void _toggleCamera() {
    setState(() {
      _cameraService.isCameraEnabled = !_cameraService.isCameraEnabled;
    });
  }

  void _toggleMicrophone() async {
    if (_isRecordingAudio) {
    } else {}
    setState(() {
      _isRecordingAudio = !_isRecordingAudio;
    });
  }

  void _onRecordButtonPressed() async {
    if (_isRecordingVideo && _isRecordingAudio) {
      try {
        // Stop the video recording and get the file
        XFile videoFile = await _cameraService.controller.stopVideoRecording();

        // Stop the audio recording

        // Create a PlatformFile from the XFile to upload
        int fileSize = await videoFile.length();
        PlatformFile platformFile = PlatformFile(
          name: videoFile.name,
          path: videoFile.path,
          size: fileSize,
          bytes: await videoFile.readAsBytes(),
        );

        // Define the upload URL
        String uploadUrl = '${Constants.uri}/upload';

        // Upload the file
        await FileManager.uploadFile(uploadUrl, platformFile);

        // Update the UI state
        setState(() {
          _isRecordingVideo = false;
          _isRecordingAudio = false;
        });
      } catch (e) {
        // Handle errors, e.g., display a message or log the error
        print('Error during recording or file upload: $e');
        setState(() {
          _isRecordingVideo = false;
          _isRecordingAudio = false;
        });
      }
    } else {
      try {
        _cameraService.controller.enableAudio;
        // Start video and audio recordings
        await _cameraService.controller.startVideoRecording();

        // Update the UI state
        setState(() {
          _isRecordingVideo = true;
          _isRecordingAudio = true;
        });
      } catch (e) {
        // Handle possible errors during preparation or starting the recording
        print('Error starting recording: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interview Meeting')),
      body: Stack(
        children: [
          // Background Video
          Positioned.fill(
            child: _controller?.value.isInitialized ?? false
                ? VideoPlayer(_controller!)
                : Center(child: CircularProgressIndicator()),
          ),
          // Camera Preview
          Positioned(
            right: 16,
            bottom: 120,
            child: _cameraService.isInitialized &&
                    _cameraService.isCameraEnabled
                ? Container(
                    width: 100,
                    height: 150,
                    child: CameraPreviewWidget(cameraService: _cameraService),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _toggleCamera,
            child: Icon(_cameraService.isCameraEnabled
                ? Icons.videocam
                : Icons.videocam_off),
            backgroundColor: Colors.blue,
          ),
          FloatingActionButton(
            onPressed: _onRecordButtonPressed,
            child: Icon(_isRecordingVideo ? Icons.call_end : Icons.video_call),
            backgroundColor: _isRecordingVideo ? Colors.red : Colors.green,
          ),
          FloatingActionButton(
            onPressed: _toggleMicrophone,
            child: Icon(_isRecordingAudio ? Icons.mic : Icons.mic_off),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
