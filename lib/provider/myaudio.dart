import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

class MyAudio extends ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration totalDuration = Duration();
  Duration position = Duration();
  String audioState = "";

  DateTime now = DateTime.now();

  MyAudio() {
    initAudio();
    // ignore: unused_local_variable
    String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);
    // ignore: unused_local_variable
    var newDate = int.parse(formattedDate[0] + formattedDate[1]);

    if (newDate < 12) {
      audioState = "Good Morning !";
    } else if (newDate > 12 && newDate < 18) {
      audioState = "Good Afternoon";
    } else {
      audioState = "Good Evening";
    }
  }

  initAudio() {
    audioPlayer.onDurationChanged.listen((updatedDuration) {
      totalDuration = updatedDuration;
      notifyListeners();
    });

    audioPlayer.onAudioPositionChanged.listen((updatePosition) {
      position = updatePosition;
      notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == PlayerState.PLAYING) {
        audioState = "Now Playing !";
      }
      if (playerState == PlayerState.STOPPED) {
        audioState = "Stopped !";
      }
      if (playerState == PlayerState.PAUSED) {
        audioState = "Paused !";
      }
      notifyListeners();
    });
  }

  playAudio() {
    audioPlayer.play(
        'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4');
  }

  stopAudio() {
    audioPlayer.stop();
  }

  pauseAudio() {
    audioPlayer.pause();
  }

  seekAudio(Duration durationToSeek) {
    audioPlayer.seek(durationToSeek);
  }
}
