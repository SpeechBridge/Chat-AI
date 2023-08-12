import 'package:ai_chat_flutter/common/utils/app_bloc_observer.dart';
import 'package:ai_chat_flutter/firebase_options.dart';
import 'package:ai_chat_flutter/presentation/app.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  cameras = await availableCameras();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
