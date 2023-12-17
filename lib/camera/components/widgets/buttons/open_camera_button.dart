import 'package:flutter/material.dart';
import 'package:open_device_camera/camera/controller/camera_controller_provider.dart';

import '../../../display/camera_display.dart';

class OpenCameraButton extends StatelessWidget {
  final CameraControllerProvider cameraControllerProvider;

  const OpenCameraButton({super.key, required this.cameraControllerProvider});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CameraDisplay(
              cameraControllerProvider: cameraControllerProvider,
            ),
          ),
        );
      },
      child: const Icon(Icons.camera),
    );
  }
}
