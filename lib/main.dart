import 'package:dynamic_keyboard/dynamic.dart';
import 'package:dynamic_keyboard/normal.dart';
import 'package:flutter/material.dart';
import 'home.dart'; //the address of home page code.

void main() {
  runApp(MaterialApp(
    title: 'Dynamic Keyboard Experiment',
    routes: {
      '/': (context) => Home(), // The page that application starts with
      '/dynamic': (context) => KeyboardDemo(),
      '/normal': (context) =>
          NormalKeyboard(), // the other page which is the Experiment
    },
  ));
}
