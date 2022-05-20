import 'package:flutter/material.dart';

class FadeTransitionScreen extends StatefulWidget {
  const FadeTransitionScreen({Key? key}) : super(key: key);
  @override
  State<FadeTransitionScreen> createState() => _FadeTransitionScreenState();
}

class _FadeTransitionScreenState extends State<FadeTransitionScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AnimationController:
    controller!.forward();
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade Transition Recipe'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: animation!,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
