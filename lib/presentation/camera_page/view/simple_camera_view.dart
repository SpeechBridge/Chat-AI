import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:ai_chat_flutter/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Throttler {
  Throttler({required this.milliSeconds});

  final int milliSeconds;

  int? lastActionTime;

  void run(VoidCallback action) {
    if (lastActionTime == null) {
      action();
      lastActionTime = DateTime.now().millisecondsSinceEpoch;
    } else {
      if (DateTime.now().millisecondsSinceEpoch - lastActionTime! >
          (milliSeconds)) {
        action();
        lastActionTime = DateTime.now().millisecondsSinceEpoch;
      }
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? serverMessage;
  late CameraController controller;
  late Throttler throttler;
  late StreamSubscription<int> timer;
  @override
  void initState() {
    super.initState();

    throttler = Throttler(milliSeconds: 250);
    print('Сработал init trottler на 0.5 секунды');
    final cameraDescription = cameras.first;

    controller = CameraController(cameraDescription, ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: Platform.isIOS
            ? ImageFormatGroup.bgra8888
            : ImageFormatGroup.yuv420);

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      Future.delayed(const Duration(milliseconds: 250));

      controller.startImageStream(
        (image) async {
          throttler.run(() async {
            try {
              // Prepare data for Android
              List<int> strides = Int32List(image.planes.length * 2);
              int index = 0;
              final bytes = image.planes.map((plane) {
                strides[index] = (plane.bytesPerRow);
                index++;
                strides[index] = (plane.bytesPerPixel)!;
                index++;
                return plane.bytes;
              }).toList();

              final result = await const MethodChannel('com.benamorn.liveness')
                  .invokeMethod<Uint8List>("checkLiveness", {
                'platforms': bytes,
                'height': image.height,
                'width': image.width,
                'strides': strides
              });
              print(result);

              // Отправляем результат на сервер через веб-сокет
              channel.sink.add(result);
            } on PlatformException catch (e) {
              debugPrint(
                  "==== checkLiveness Method is not implemented ${e.message}");
            }
          });
        },
      );
      //}
      channel.stream.listen((message) {
        // Обрабатываем сообщение от сервера
        print('SERVER MESSAGE ========== $message');
        setState(() {
          serverMessage = message;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: [
          Center(child: CameraPreview(controller)),
          if (serverMessage != null && serverMessage!.isNotEmpty)
            Positioned(
              bottom: 40,
              left: 10,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  maxLines: 4, // Ограничить количество строк до 4
                  overflow: TextOverflow
                      .ellipsis, // Добавить многоточие, если текст слишком длинный
                  serverMessage ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
