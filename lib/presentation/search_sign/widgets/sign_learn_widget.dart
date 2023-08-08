import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SignDetailPage extends StatefulWidget {
  final String text;
  final String link;

  const SignDetailPage({Key? key, required this.text, required this.link})
      : super(key: key);

  @override
  _SignDetailPageState createState() => _SignDetailPageState();
}

class _SignDetailPageState extends State<SignDetailPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.link),
    )..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(_videoPlayerListener);
  }

  void _videoPlayerListener() {
    if (_controller.value.isInitialized &&
        !_controller.value.isPlaying &&
        _controller.value.position == _controller.value.duration) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoPlayerListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.transparent,
        // ),
        centerTitle: true,
        title: Text(
          widget.text,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_controller.value.isInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (!_controller.value.isPlaying) {
                    _controller.play();
                  }
                });
              },
              child: Icon(
                _controller.value.isPlaying &&
                        _controller.value.position < _controller.value.duration
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
