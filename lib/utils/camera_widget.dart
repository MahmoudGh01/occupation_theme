import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:job_seeker/services/camera_service.dart';

class CameraPreviewWidget extends StatefulWidget {
  final Function(bool)? onCameraInitialized;
  final CameraService cameraService;
  const CameraPreviewWidget(
      {Key? key, required this.cameraService, this.onCameraInitialized})
      : super(key: key);

  @override
  _CameraPreviewWidgetState createState() => _CameraPreviewWidgetState();
}

class _CameraPreviewWidgetState extends State<CameraPreviewWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    // Get the front-facing camera.
    final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    _controller = CameraController(
      frontCamera, // Use the front-facing camera here
      ResolutionPreset.medium,
      enableAudio: true,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    _initializeControllerFuture.then((_) {
      if (!mounted) return;
      setState(() {});
      if (widget.onCameraInitialized != null) {
        widget.onCameraInitialized!(_controller.value.isInitialized);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    // To display the camera preview, you must create a CameraPreview widget.
    return CameraPreview(_controller);
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }
}
