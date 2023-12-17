import 'package:flutter/material.dart';
import 'package:open_device_camera/camera/components/widgets/buttons/take_picture_button.dart';
import 'package:open_device_camera/camera/components/widgets/buttons/toggle_camera_button.dart';

import '../../controller/camera_controller_provider.dart';

class ButtonWidget extends StatelessWidget {
  final ValueSetter<String> onPictureTaken;
  final CameraControllerProvider cameraControllerProvider;

  const ButtonWidget(
      {Key? key,
      required this.onPictureTaken,
      required this.cameraControllerProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TakePictureButton(
            onPictureTaken: onPictureTaken,
            cameraControllerProvider: cameraControllerProvider),
        ToggleCameraButton(cameraControllerProvider: cameraControllerProvider),
      ],
    );
  }
}
