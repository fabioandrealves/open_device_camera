import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'camera/controller/camera_controller_provider.dart';
import 'camera/open_camera.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MultiProvider(providers: [
    Provider<List<CameraDescription>>.value(value: cameras),
    ChangeNotifierProvider(
      create: (context) => CameraControllerProvider(cameras: cameras),
    ),
  ], child: MyApp(cameras)));
}
