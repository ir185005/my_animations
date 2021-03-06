import 'dart:ui';

import 'package:flutter/material.dart';

class ShapeAnimation extends StatefulWidget {
  const ShapeAnimation({Key? key}) : super(key: key);
  @override
  State<ShapeAnimation> createState() => _ShapeAnimationState();
}

class _ShapeAnimationState extends State<ShapeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double posTop = 0;
  double posLeft = 0;
  double maxTop = 0;
  double maxLeft = 0;
  Animation<double>? animationTop;
  Animation<double>? animationLeft;
  Animation<double>? animation;
  final int ballSize = 100;

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeInOut);
    animation!.addListener(() {
      moveBall();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Controller'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          maxLeft = constraints.maxWidth - ballSize;
          maxTop = constraints.maxHeight - ballSize;
          return Stack(
            children: [
              AnimatedBuilder(
                  animation: controller!,
                  builder: (BuildContext context, Widget? child) {
                    moveBall();
                    return Positioned(
                        left: posLeft, top: posTop, child: Ball());
                  },
                  child: Positioned(
                    left: posLeft,
                    top: posTop,
                    child: Ball(),
                  )),
            ],
          );
        }),
      ),
    );
  }

  void moveBall() {
    posTop = animation!.value * maxTop;
    posLeft = animation!.value * maxLeft;
  }
}

class Ball extends StatelessWidget {
  const Ball({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration:
          const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
    );
  }
}
