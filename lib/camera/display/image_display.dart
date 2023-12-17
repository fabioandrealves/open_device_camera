import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_device_camera/camera/components/widgets/buttons/open_camera_button.dart';
import 'package:provider/provider.dart';

import '../controller/camera_controller_provider.dart';

class ImageDisplay extends StatelessWidget {
  const ImageDisplay({Key? key, required this.imagePath}) : super(key: key);

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final cameraControllerProvider =
        Provider.of<CameraControllerProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: OpenCameraButton(
        cameraControllerProvider: cameraControllerProvider,
      ),
      body: Center(
        child: cameraControllerProvider.imagePath == null
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera,
                    size: 64,
                  ),
                  Center(
                    child: Text(
                      'Click the button to take a picture.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            : Image.file(File(cameraControllerProvider.imagePath!)),
      ),
    );
  }
}
