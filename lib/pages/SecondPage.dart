import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:video_player/video_player.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  VideoPlayerController _controller =
      new VideoPlayerController.asset("assets/images/first_page.mp4");

      @override
  void initState() {
    super.initState();
    _controller
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        VideoPlayer(_controller),
      ],)
    );
  }
}