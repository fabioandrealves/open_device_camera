import 'package:flutter/material.dart';
import 'package:open_device_camera/camera/controller/camera_controller_provider.dart';

class ToggleCameraButton extends StatelessWidget {
  final CameraControllerProvider cameraControllerProvider;
  const ToggleCameraButton({super.key, required this.cameraControllerProvider});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'button2',
      onPressed: () {
        cameraControllerProvider.toggleCamera();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Icon(
        cameraControllerProvider.selectedCameraIndex == 0
            ? Icons.camera_front
            : Icons.camera_rear,
      ),
    );
  }
}
