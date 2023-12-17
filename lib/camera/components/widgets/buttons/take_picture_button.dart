import 'package:flutter/material.dart';

import '../../../controller/camera_controller_provider.dart';

class TakePictureButton extends StatelessWidget {
  final ValueSetter<String> onPictureTaken;
  final CameraControllerProvider cameraControllerProvider;

  const TakePictureButton(
      {super.key,
      required this.onPictureTaken,
      required this.cameraControllerProvider});

  Future<void> _takePhoto(BuildContext context,
      CameraControllerProvider cameraControllerProvider) async {
    final photo = await cameraControllerProvider.takePicture();

    if (photo != null) {
      cameraControllerProvider.setImagePath(photo.path);
      onPictureTaken(photo.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'button1',
      onPressed: () async {
        await _takePhoto(context, cameraControllerProvider);
        final imagePath = cameraControllerProvider.imagePath;
        if (imagePath != null) {
          if (context.mounted) {
            Navigator.pop(context, imagePath);
          }
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const Icon(Icons.camera_rounded),
    );
  }
}
