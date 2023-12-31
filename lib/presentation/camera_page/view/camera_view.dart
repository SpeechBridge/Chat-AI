// import 'dart:async';

// import 'package:ai_chat_flutter/common/utils/throttler.dart';
// import 'package:flutter/material.dart';

// import 'package:ai_chat_flutter/main.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:video_player/video_player.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// int currentCameraIndex = 0;

// /// Camera example home widget.
// class CameraExampleHome extends StatefulWidget {
//   /// Default Constructor
//   const CameraExampleHome({super.key});

//   @override
//   State<CameraExampleHome> createState() {
//     return _CameraExampleHomeState();
//   }
// }

// /// Returns a suitable camera icon for [direction].
// IconData getCameraLensIcon(CameraLensDirection direction) {
//   switch (direction) {
//     case CameraLensDirection.back:
//       return Icons.camera_rear;
//     case CameraLensDirection.front:
//       return Icons.camera_front;
//     case CameraLensDirection.external:
//       return Icons.camera;
//   }
//   // This enum is from a different package, so a new value could be added at
//   // any time. The example should keep working if that happens.
//   // ignore: dead_code
//   return Icons.camera;
// }

// void _logError(String code, String? message) {
//   // ignore: avoid_print
//   print('Error: $code${message == null ? '' : '\nError Message: $message'}');
// }

// class _CameraExampleHomeState extends State<CameraExampleHome>
//     with WidgetsBindingObserver, TickerProviderStateMixin {
//   CameraController? controller;
//   XFile? imageFile;
//   XFile? videoFile;
//   VideoPlayerController? videoController;
//   VoidCallback? videoPlayerListener;
//   bool enableAudio = true;
//   double _minAvailableExposureOffset = 0.0;
//   double _maxAvailableExposureOffset = 0.0;
//   double _currentExposureOffset = 0.0;
//   late AnimationController _flashModeControlRowAnimationController;
//   late Animation<double> _flashModeControlRowAnimation;
//   late AnimationController _exposureModeControlRowAnimationController;
//   late Animation<double> _exposureModeControlRowAnimation;
//   late AnimationController _focusModeControlRowAnimationController;
//   late Animation<double> _focusModeControlRowAnimation;
//   double _minAvailableZoom = 1.0;
//   double _maxAvailableZoom = 1.0;
//   double _currentScale = 1.0;
//   double _baseScale = 1.0;

//   // Counting pointers (number of user fingers on screen)
//   int _pointers = 0;
//   late WebSocketChannel channel;
//   late Throttler throttler;
//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addObserver(this);
//     onNewCameraSelected(cameras[0]);
//     _flashModeControlRowAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _flashModeControlRowAnimation = CurvedAnimation(
//       parent: _flashModeControlRowAnimationController,
//       curve: Curves.easeInCubic,
//     );
//     _exposureModeControlRowAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _exposureModeControlRowAnimation = CurvedAnimation(
//       parent: _exposureModeControlRowAnimationController,
//       curve: Curves.easeInCubic,
//     );
//     _focusModeControlRowAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _focusModeControlRowAnimation = CurvedAnimation(
//       parent: _focusModeControlRowAnimationController,
//       curve: Curves.easeInCubic,
//     );

//     throttler = Throttler(milliSeconds: 500);
//     channel = WebSocketChannel.connect(
//       Uri.parse('wss://speech-back.onrender.com/ws'),
//     );

//     channel.stream.listen((message) {
//       // Обрабатываем сообщение от сервера
//       print('SERVER MESSAGE ========== $message');
//     });
//   }

//   @override
//   void dispose() {
//     channel.sink.close();
//     WidgetsBinding.instance.removeObserver(this);
//     _flashModeControlRowAnimationController.dispose();
//     _exposureModeControlRowAnimationController.dispose();
//     super.dispose();
//   }

//   // #docregion AppLifecycle
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     final CameraController? cameraController = controller;

//     // App state changed before we got the chance to initialize.
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       return;
//     }

//     if (state == AppLifecycleState.inactive) {
//       cameraController.dispose();
//     } else if (state == AppLifecycleState.resumed) {
//       _initializeCameraController(cameraController.description);
//     }
//   }
//   // #enddocregion AppLifecycle

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Padding(
//         padding: EdgeInsets.only(top: 15.h),
//         child: CircleAvatar(
//           radius: 45.h / 2,
//           backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
//           child: IconButton(
//             icon: const Icon(Icons.chevron_left),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: _cameraPreviewWidget(),
//               ),
//             ),
//             _modeControlRowWidget(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _cameraPreviewWidget() {
//     if (controller == null || !controller!.value.isInitialized) {
//       return const Text('Камера не инициализирована');
//     }

//     final aspectRatio =
//         1 / controller!.value.aspectRatio; // Инвертируем соотношение сторон

//     return Listener(
//       onPointerDown: (_) => _pointers++,
//       onPointerUp: (_) => _pointers--,
//       child: AspectRatio(
//         aspectRatio: aspectRatio,
//         child: CameraPreview(
//           controller!,
//           child: LayoutBuilder(
//             builder: (BuildContext context, BoxConstraints constraints) {
//               return GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onScaleStart: _handleScaleStart,
//                 onScaleUpdate: _handleScaleUpdate,
//                 onTapDown: (TapDownDetails details) =>
//                     onViewFinderTap(details, constraints),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   void _handleScaleStart(ScaleStartDetails details) {
//     _baseScale = _currentScale;
//   }

//   Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
//     // When there are not exactly two fingers on screen don't scale
//     if (controller == null || _pointers != 2) {
//       return;
//     }

//     _currentScale = (_baseScale * details.scale)
//         .clamp(_minAvailableZoom, _maxAvailableZoom);

//     await controller!.setZoomLevel(_currentScale);
//   }

//   /// Display a bar with buttons to change the flash and exposure modes
//   Widget _modeControlRowWidget() {
//     return Column(
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.flash_on),
//               onPressed: controller != null ? onFlashModeButtonPressed : null,
//             ),
//             // The exposure and focus mode are currently not supported on the web.
//             ...!kIsWeb
//                 ? <Widget>[
//                     IconButton(
//                       icon: const Icon(Icons.exposure),
//                       onPressed: controller != null
//                           ? onExposureModeButtonPressed
//                           : null,
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.filter_center_focus),
//                       onPressed:
//                           controller != null ? onFocusModeButtonPressed : null,
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.cameraswitch),
//                       onPressed: () {
//                         currentCameraIndex =
//                             (currentCameraIndex + 1) % cameras.length;
//                         CameraDescription description =
//                             cameras[currentCameraIndex];
//                         onNewCameraSelected(description);
//                       },
//                     ),
//                   ]
//                 : <Widget>[],
//           ],
//         ),
//         _flashModeControlRowWidget(),
//         _exposureModeControlRowWidget(),
//         _focusModeControlRowWidget(),
//         //SizedBox(height: 10.h),
//       ],
//     );
//   }

//   Widget _flashModeControlRowWidget() {
//     return SizeTransition(
//       sizeFactor: _flashModeControlRowAnimation,
//       child: ClipRect(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.flash_off),
//               color: controller?.value.flashMode == FlashMode.off
//                   ? Theme.of(context).colorScheme.inversePrimary
//                   : Theme.of(context).colorScheme.onSurfaceVariant,
//               onPressed: controller != null
//                   ? () => onSetFlashModeButtonPressed(FlashMode.off)
//                   : null,
//             ),
//             IconButton(
//               icon: const Icon(Icons.flash_auto),
//               color: controller?.value.flashMode == FlashMode.auto
//                   ? Theme.of(context).colorScheme.inversePrimary
//                   : Theme.of(context).colorScheme.onSurfaceVariant,
//               onPressed: controller != null
//                   ? () => onSetFlashModeButtonPressed(FlashMode.auto)
//                   : null,
//             ),
//             IconButton(
//               icon: const Icon(Icons.flash_on),
//               color: controller?.value.flashMode == FlashMode.always
//                   ? Theme.of(context).colorScheme.inversePrimary
//                   : Theme.of(context).colorScheme.onSurfaceVariant,
//               onPressed: controller != null
//                   ? () => onSetFlashModeButtonPressed(FlashMode.always)
//                   : null,
//             ),
//             IconButton(
//               icon: const Icon(Icons.highlight),
//               color: controller?.value.flashMode == FlashMode.torch
//                   ? Theme.of(context).colorScheme.inversePrimary
//                   : Theme.of(context).colorScheme.onSurfaceVariant,
//               onPressed: controller != null
//                   ? () => onSetFlashModeButtonPressed(FlashMode.torch)
//                   : null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _exposureModeControlRowWidget() {
//     final ButtonStyle styleAuto = TextButton.styleFrom(
//       foregroundColor: controller?.value.exposureMode == ExposureMode.auto
//           ? Theme.of(context).colorScheme.inversePrimary
//           : Theme.of(context).colorScheme.onSurfaceVariant,
//     );
//     final ButtonStyle styleLocked = TextButton.styleFrom(
//       foregroundColor: controller?.value.exposureMode == ExposureMode.locked
//           ? Theme.of(context).colorScheme.inversePrimary
//           : Theme.of(context).colorScheme.onSurfaceVariant,
//     );

//     return SizeTransition(
//       sizeFactor: _exposureModeControlRowAnimation,
//       child: ClipRect(
//         child: Column(
//           children: <Widget>[
//             const Center(
//               child: Text('Режим экспозиции'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 TextButton(
//                   style: styleAuto,
//                   onPressed: controller != null
//                       ? () => onSetExposureModeButtonPressed(ExposureMode.auto)
//                       : null,
//                   onLongPress: () {
//                     if (controller != null) {
//                       controller!.setExposurePoint(null);
//                       showInSnackBar('Сброс точки экспозиции');
//                     }
//                   },
//                   child: const Text('АВТО'),
//                 ),
//                 TextButton(
//                   style: styleLocked,
//                   onPressed: controller != null
//                       ? () =>
//                           onSetExposureModeButtonPressed(ExposureMode.locked)
//                       : null,
//                   child: const Text('ЗАБЛОКИРОВАНО'),
//                 ),
//                 TextButton(
//                   style: styleLocked,
//                   onPressed: controller != null
//                       ? () => controller!.setExposureOffset(0.0)
//                       : null,
//                   child: const Text('СБРОСИТЬ СМЕЩЕНИЕ'),
//                 ),
//               ],
//             ),
//             const Center(
//               child: Text('СМЕЩЕНИЕ ЭКСПОЗИЦИИ'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Text(_minAvailableExposureOffset.toString()),
//                 Slider(
//                   value: _currentExposureOffset,
//                   min: _minAvailableExposureOffset,
//                   max: _maxAvailableExposureOffset,
//                   label: _currentExposureOffset.toString(),
//                   onChanged:
//                       _minAvailableExposureOffset == _maxAvailableExposureOffset
//                           ? null
//                           : setExposureOffset,
//                 ),
//                 Text(_maxAvailableExposureOffset.toString()),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _focusModeControlRowWidget() {
//     final ButtonStyle styleAuto = TextButton.styleFrom(
//       foregroundColor: controller?.value.focusMode == FocusMode.auto
//           ? Theme.of(context).colorScheme.inversePrimary
//           : Theme.of(context).colorScheme.onSurfaceVariant,
//     );
//     final ButtonStyle styleLocked = TextButton.styleFrom(
//       foregroundColor: controller?.value.focusMode == FocusMode.locked
//           ? Theme.of(context).colorScheme.inversePrimary
//           : Theme.of(context).colorScheme.onSurfaceVariant,
//     );

//     return SizeTransition(
//       sizeFactor: _focusModeControlRowAnimation,
//       child: ClipRect(
//         child: Column(
//           children: <Widget>[
//             const Center(
//               child: Text('РЕЖИМ ФОКУСА'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 TextButton(
//                   style: styleAuto,
//                   onPressed: controller != null
//                       ? () => onSetFocusModeButtonPressed(FocusMode.auto)
//                       : null,
//                   onLongPress: () {
//                     if (controller != null) {
//                       controller!.setFocusPoint(null);
//                     }
//                     showInSnackBar('Сброс точки фокуса');
//                   },
//                   child: const Text('АВТО'),
//                 ),
//                 TextButton(
//                   style: styleLocked,
//                   onPressed: controller != null
//                       ? () => onSetFocusModeButtonPressed(FocusMode.locked)
//                       : null,
//                   child: const Text('ЗАБЛОКИРОВАНО'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

//   void showInSnackBar(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
//     if (controller == null) {
//       return;
//     }

//     final CameraController cameraController = controller!;

//     final Offset offset = Offset(
//       details.localPosition.dx / constraints.maxWidth,
//       details.localPosition.dy / constraints.maxHeight,
//     );
//     cameraController.setExposurePoint(offset);
//     cameraController.setFocusPoint(offset);
//   }

//   Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
//     if (controller != null) {
//       return controller!.setDescription(cameraDescription);
//     } else {
//       return _initializeCameraController(cameraDescription);
//     }
//   }

//   Future<void> _startImageStream() async {
//     controller?.startImageStream(
//       (image) async {
//         throttler.run(() async {
//           try {
//             // Prepare data for Android
//             List<int> strides = Int32List(image.planes.length * 2);
//             int index = 0;
//             final bytes = image.planes.map((plane) {
//               strides[index] = (plane.bytesPerRow);
//               index++;
//               strides[index] = (plane.bytesPerPixel)!;
//               index++;
//               return plane.bytes;
//             }).toList();

//             final result = await const MethodChannel('com.benamorn.liveness')
//                 .invokeMethod<Uint8List>("checkLiveness", {
//               'platforms': bytes,
//               'height': image.height,
//               'width': image.width,
//               'strides': strides
//             });
//             print(result);

//             // Отправляем результат на сервер через веб-сокет
//             channel.sink.add(result);
//           } on PlatformException catch (e) {
//             debugPrint(
//                 "==== checkLiveness Method is not implemented ${e.message}");
//           }
//         });
//       },
//     );
//   }

//   Future<void> _initializeCameraController(
//       CameraDescription cameraDescription) async {
//     final CameraController cameraController = CameraController(
//       cameraDescription,
//       kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
//       enableAudio: enableAudio,
//       imageFormatGroup: ImageFormatGroup.jpeg,
//     );

//     controller = cameraController;

//     // If the controller is updated then update the UI.
//     cameraController.addListener(() {
//       if (mounted) {
//         setState(() {});
//       }
//       if (cameraController.value.hasError) {
//         showInSnackBar(
//             'Camera error ${cameraController.value.errorDescription}');
//       }
//     });

//     try {
//       await cameraController.initialize();
//       await Future.wait(<Future<Object?>>[
//         // The exposure mode is currently not supported on the web.
//         ...!kIsWeb
//             ? <Future<Object?>>[
//                 cameraController.getMinExposureOffset().then(
//                     (double value) => _minAvailableExposureOffset = value),
//                 cameraController
//                     .getMaxExposureOffset()
//                     .then((double value) => _maxAvailableExposureOffset = value)
//               ]
//             : <Future<Object?>>[],
//         cameraController
//             .getMaxZoomLevel()
//             .then((double value) => _maxAvailableZoom = value),
//         cameraController
//             .getMinZoomLevel()
//             .then((double value) => _minAvailableZoom = value),
//       ]);
//     } on CameraException catch (e) {
//       switch (e.code) {
//         case 'CameraAccessDenied':
//           showInSnackBar('Вы ограничили доступ к камеры.');
//           break;
//         case 'CameraAccessDeniedWithoutPrompt':
//           // iOS only
//           showInSnackBar(
//               'Пожалуйста, перейдите в приложение «Настройки», чтобы включить доступ к камере.');
//           break;
//         case 'CameraAccessRestricted':
//           // iOS only
//           showInSnackBar('Вы ограничили доступ к камере.');
//           break;
//         case 'AudioAccessDenied':
//           showInSnackBar('Вы отклонили доступ аудио.');
//           break;
//         case 'AudioAccessDeniedWithoutPrompt':
//           // iOS only
//           showInSnackBar(
//               'Пожалуйста, перейдите в приложение «Настройки», чтобы включить доступ к аудио.');
//           break;
//         case 'AudioAccessRestricted':
//           // iOS only
//           showInSnackBar('Доступ к аудио ограничен.');
//           break;
//         default:
//           _showCameraException(e);
//           break;
//       }
//     }

//     if (mounted) {
//       setState(() {});
//       _startImageStream();
//     }
//   }

//   void onFlashModeButtonPressed() {
//     if (_flashModeControlRowAnimationController.value == 1) {
//       _flashModeControlRowAnimationController.reverse();
//     } else {
//       _flashModeControlRowAnimationController.forward();
//       _exposureModeControlRowAnimationController.reverse();
//       _focusModeControlRowAnimationController.reverse();
//     }
//   }

//   void onExposureModeButtonPressed() {
//     if (_exposureModeControlRowAnimationController.value == 1) {
//       _exposureModeControlRowAnimationController.reverse();
//     } else {
//       _exposureModeControlRowAnimationController.forward();
//       _flashModeControlRowAnimationController.reverse();
//       _focusModeControlRowAnimationController.reverse();
//     }
//   }

//   void onFocusModeButtonPressed() {
//     if (_focusModeControlRowAnimationController.value == 1) {
//       _focusModeControlRowAnimationController.reverse();
//     } else {
//       _focusModeControlRowAnimationController.forward();
//       _flashModeControlRowAnimationController.reverse();
//       _exposureModeControlRowAnimationController.reverse();
//     }
//   }

//   void onSetFlashModeButtonPressed(FlashMode mode) {
//     setFlashMode(mode).then((_) {
//       if (mounted) {
//         setState(() {});
//       }
//       showInSnackBar(
//           'Режим вспышки установлен в ${mode.toString().split('.').last}');
//     });
//   }

//   void onSetExposureModeButtonPressed(ExposureMode mode) {
//     setExposureMode(mode).then((_) {
//       if (mounted) {
//         setState(() {});
//       }
//       showInSnackBar(
//           'Режим экспозиции установлен в ${mode.toString().split('.').last}');
//     });
//   }

//   void onSetFocusModeButtonPressed(FocusMode mode) {
//     setFocusMode(mode).then((_) {
//       if (mounted) {
//         setState(() {});
//       }
//       showInSnackBar(
//           'Режим фокуса установлен в ${mode.toString().split('.').last}');
//     });
//   }

//   Future<void> setFlashMode(FlashMode mode) async {
//     if (controller == null) {
//       return;
//     }

//     try {
//       await controller!.setFlashMode(mode);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }

//   Future<void> setExposureMode(ExposureMode mode) async {
//     if (controller == null) {
//       return;
//     }

//     try {
//       await controller!.setExposureMode(mode);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }

//   Future<void> setExposureOffset(double offset) async {
//     if (controller == null) {
//       return;
//     }

//     setState(() {
//       _currentExposureOffset = offset;
//     });
//     try {
//       offset = await controller!.setExposureOffset(offset);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }

//   Future<void> setFocusMode(FocusMode mode) async {
//     if (controller == null) {
//       return;
//     }

//     try {
//       await controller!.setFocusMode(mode);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }

//   void _showCameraException(CameraException e) {
//     _logError(e.code, e.description);
//     showInSnackBar('Ошибка: ${e.code}\n${e.description}');
//   }
// }

// /// CameraApp is the Main Application.
// class CameraApp extends StatelessWidget {
//   /// Default Constructor
//   const CameraApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CameraExampleHome();
//   }
// }
