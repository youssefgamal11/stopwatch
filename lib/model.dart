import 'dart:async';
import 'package:flutter/material.dart';

class Model with ChangeNotifier {
  bool startisactive = true;
  bool endisactive = true;
  bool resetisactive = true;
  String timerdisplay = " 00 : 00 : 00  ";
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);

  void running() {
    if (swatch.isRunning) {
      starttimer();
    }
    timerdisplay = swatch.elapsed.inHours.toString().padLeft(2, "0") +
        ":" +
        (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
        ":" +
        (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    notifyListeners();
  }

  void starttimer() {
    Timer(dur, running);
    notifyListeners();
  }

  void startsw() {
    startisactive = false;
    endisactive = false;
    swatch.start();
    starttimer();
    notifyListeners();
  }

  void endsw() {
    swatch.stop();
    endisactive = true;
    resetisactive = false;
    notifyListeners();
  }

  void resetsw() {
    swatch.reset();
    timerdisplay = " 00 : 00 : 00  ";
    startisactive = true;
    resetisactive = true;
    notifyListeners();
  }
}
