import 'package:esell/pages/OrdertrackPage.dart';
// import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class AnimatingLine extends StatefulWidget {
  @override
  _AnimatingLineState createState() => _AnimatingLineState();
}

class _AnimatingLineState extends State<AnimatingLine> with TickerProviderStateMixin {
  AnimationController controller;
  Animation growAnimation;
  Color color = Colors.grey[600];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    controller.forward();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrdetrackPage(
      controller: controller,
    );
  }
}

