import 'package:flutter/material.dart';
import 'package:my_animations/animated_list.dart';
import 'package:my_animations/dismissible.dart';
import 'package:my_animations/fade_transition.dart';
import 'package:my_animations/list_screen.dart';
import 'package:my_animations/shape_animation.dart';

import 'my_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Demo',
      home: DismissibleScreen(),
    );
  }
}
