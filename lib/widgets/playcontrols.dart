import 'package:flutter/material.dart';
import 'package:my_app/provider/myaudio.dart';
import 'package:my_app/themes/colors.dart';
import 'package:provider/provider.dart';

class PlayerController extends StatelessWidget {
  const PlayerController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Controls(
            icon: Icons.repeat,
          ),
          Controls(
            icon: Icons.skip_previous,
          ),
          PlayControls(),
          Controls(icon: Icons.skip_next),
          Controls(icon: Icons.shuffle),
        ],
      ),
    );
  }
}

class PlayControls extends StatelessWidget {
  const PlayControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: MyColor.primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: MyColor.primaryDarkColor,
              offset: Offset(5, 10),
              spreadRadius: 3,
              blurRadius: 10),
          BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: Offset(-3, -4),
              spreadRadius: -2,
              blurRadius: 20)
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: MyColor.primaryDarkColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: MyColor.primaryDarkColor,
                      offset: Offset(5, 10),
                      spreadRadius: 3,
                      blurRadius: 10),
                  BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      offset: Offset(-3, -4),
                      spreadRadius: -2,
                      blurRadius: 20)
                ],
              ),
            ),
          ),
          Consumer<MyAudio>(
            builder: (_, myAudioModel, child) => InkWell(
              splashColor: MyColor.primaryDarkColor,
              borderRadius: BorderRadius.circular(43),
              onTap: () {
                myAudioModel.audioState == "Now Playing !"
                    ? myAudioModel.pauseAudio()
                    : myAudioModel.playAudio();
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: MyColor.primaryColor, shape: BoxShape.circle),
                  child: Center(
                      child: Icon(
                    myAudioModel.audioState == "Now Playing !"
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 50,
                    color: MyColor.primaryDarkColor,
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Controls extends StatelessWidget {
  final IconData icon;
  const Controls({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: MyColor.primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: MyColor.primaryDarkColor,
              offset: Offset(5, 10),
              spreadRadius: 3,
              blurRadius: 10),
          BoxShadow(
              color: Colors.white.withOpacity(0.4),
              offset: Offset(-3, -4),
              spreadRadius: -2,
              blurRadius: 20)
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: MyColor.primaryDarkColor,
                      offset: Offset(5, 10),
                      spreadRadius: 3,
                      blurRadius: 10),
                  BoxShadow(
                      color: Colors.white.withOpacity(0.4),
                      offset: Offset(-3, -4),
                      spreadRadius: -2,
                      blurRadius: 20)
                ],
              ),
            ),
          ),
          Center(
            child: Consumer<MyAudio>(
              builder: (_, myAudioModel, child) => InkWell(
                splashColor: MyColor.primaryDarkColor,
                borderRadius: BorderRadius.circular(25),
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: MyColor.primaryColor, shape: BoxShape.circle),
                  child: Center(
                      child: Icon(
                    icon,
                    size: 30,
                    color: MyColor.primaryDarkColor,
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
