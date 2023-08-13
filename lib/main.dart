import 'package:ai_chat_flutter/common/utils/app_bloc_observer.dart';
import 'package:ai_chat_flutter/presentation/app.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// late List<CameraDescription> cameras;
late List<CameraDescription> cameras;
late WebSocketChannel channel;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  cameras = await availableCameras();
  channel = WebSocketChannel.connect(
    Uri.parse('wss://speech-back.onrender.com/ws'),
  );
  //cameras = await availableCameras();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
