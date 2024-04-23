import 'package:camera/camera.dart';

class CameraService {
  late CameraController controller;
  late List<CameraDescription> cameras;
  bool isInitialized = false;
  bool _isCameraEnabled = true;

  bool get isCameraEnabled => _isCameraEnabled;
  set isCameraEnabled(bool isEnabled) {
    if (isEnabled != _isCameraEnabled) {
      _isCameraEnabled = isEnabled;
      if (_isCameraEnabled) {
        initializeCamera(); // Re-initialize camera if turning on
      } else {
        dispose(); // Dispose camera if turning off
      }
    }
  }

  Future<void> initializeCamera() async {
    // Obtain a list of available cameras on the device.
    final cameras = await availableCameras();
    // Get the first camera from the list (typically the rear camera).
    final firstCamera = cameras.first;

    // Create and initialize the controller for the current camera.
    controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
      enableAudio:
          true, // Set this to true if you plan to record videos with audio.
    );

    // Next, initialize the controller. This returns a Future.
    await controller.initialize().then((_) {
      isInitialized = true;
    });
  }

  Future<XFile?> takePicture() async {
    if (!isInitialized) return null;

    // Ensure the camera is initialized.
    if (controller.value.isInitialized) {
      // Attempt to take a picture and return the file where it was saved.
      return await controller.takePicture();
    }

    return null;
  }

  void dispose() {
    // Dispose of the controller when it's no longer needed.
    controller.dispose();
  }
}
