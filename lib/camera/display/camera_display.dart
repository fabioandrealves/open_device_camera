import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../components/widgets/button_widget.dart';
import '../controller/camera_controller_provider.dart';

class CameraDisplay extends StatelessWidget {
  final CameraControllerProvider cameraControllerProvider;

  const CameraDisplay({super.key, required this.cameraControllerProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: cameraControllerProvider.cameraController!.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Camera not initialized.'),
              );
            } else if (!cameraControllerProvider
                .cameraController!.value.isInitialized) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child:
                    CameraPreview(cameraControllerProvider.cameraController!),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: ButtonWidget(
        onPictureTaken: (photo) {
          //cameraControllerProvider.setImagePath();
        },
        cameraControllerProvider: cameraControllerProvider,
      ),
    );
  }
}
