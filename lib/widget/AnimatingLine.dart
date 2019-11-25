import 'package:esell/pages/OrdertrackPage.dart';
import 'package:esell/widget/molecules/AppBar.dart';
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
    growAnimation = Tween<double>(begin: 0.0, end: 200.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
            setState(() {
              color = Colors.green;
            });
          },
      ),
       backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppBar(wishlist: true, cart: true),
      ),
      body: OrdetrackPage(controller: controller, color: color,)
    );
  }
}

