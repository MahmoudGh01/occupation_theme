import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<void> requestCameraPermissions() async {
    await [Permission.camera, Permission.microphone].request();
  }
}
