import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

class CameraControllerProvider extends ChangeNotifier {
  final List<CameraDescription> cameras;
  late CameraController _controller;
  int selectedCameraIndex = 0;
  String? _imagePath;

  CameraControllerProvider({required this.cameras}) {
    initializeCamera(cameras);
  }

  CameraController? get cameraController => _controller;
  String? get imagePath => _imagePath;

  Future<void> initializeCamera(List<CameraDescription> cameras) async {
    _controller =
        CameraController(cameras[selectedCameraIndex], ResolutionPreset.max);
    try {
      await _controller.initialize();
      debugPrint('Camera initialized');
      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  Future<XFile?> takePicture() async {
    try {
      XFile? file = await _controller.takePicture();
      setImagePath(file.path);
      debugPrint('ImagePath: ${file.path}');
      return file;
    } catch (e) {
      debugPrint('Error taking a picture');
      return null;
    }
  }

  void setImagePath(String path) {
    _imagePath = path;
    notifyListeners();
  }

  void toggleCamera() async {
    selectedCameraIndex = (selectedCameraIndex + 1) % 2;
    await initializeCamera(cameras);
    notifyListeners();
  }
}
