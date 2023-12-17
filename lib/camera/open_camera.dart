import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'display/image_display.dart';

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp(this.cameras, {super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Camera',
      home: ImageDisplay(
        imagePath: null,
      ),
    );
  }
}
