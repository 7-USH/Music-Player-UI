// ignore: unused_import
import 'package:beta_test/widgets/button.dart';
import 'package:beta_test/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:video_player/video_player.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  late AnimationController _newController;
  // ignore: unused_field
  VideoPlayerController _controller =
      new VideoPlayerController.asset("assets/images/first_page.mp4");

  @override
  void initState() {
    super.initState();

    _newController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 50),
        lowerBound: 0.0,
        upperBound: 0.2)
      ..addListener(() {
        setState(() {});
      });

    _controller
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var scale = 1 + _newController.value;
    return Scaffold(
      body: Stack(
        children: [
          Opacity(opacity: 0.85, child: VideoPlayer(_controller)),
          Container(
            color: Colors.transparent.withOpacity(0.5),
          ),
          Center(
            child: Container(
              width: 340,
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                  ),
                  Align(
                      alignment: Alignment(-1, 0),
                      child: Text(
                        "Discover\nworld with us",
                        style: MyColor.primaryText,
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text(
                      "Even the most foreign country or faraway places aren’t light years away.\nThe journey may appear long and intimidating, but when you take one step at a time, it’s manageable.",
                      style: MyColor.secondaryText,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Align(
                      alignment: Alignment(1, -1),
                      child: myButton(50, 120, scale)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// animated button added

  myButton(double h, double w, var scale) {
    double height = h;
    double width = w;
    var newScale = scale;
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUP,
      onTapCancel: onTapCancel,
      child: Transform.scale(
        scale: newScale,
        child: Container(
          decoration: BoxDecoration(
            color: MyColor.primaryDarkColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white, width: 1),
          ),
          height: height,
          width: width,
          child: Center(
              child: Text("Get Started",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 15))
                  .shimmer()),
        ),
      ),
    );
  }

  onTapDown(TapDownDetails details) {
    _newController.forward();
  }

  onTapUP(TapUpDetails details) {
    _newController.reverse();
  Get.toNamed("/secondPage");
  }

  onTapCancel() {
    _newController.reverse();
  }
}
