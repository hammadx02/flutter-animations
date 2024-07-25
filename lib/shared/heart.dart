import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _colorAnimation = ColorTween(
      begin: Colors.grey[400],
      end: Colors.red,
    ).animate(_controller);

    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          setState(
            () {
              isFav = true;
            },
          );
        }
        if (status == AnimationStatus.dismissed) {
          setState(
            () {
              isFav = false;
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: 30,
          ),
          onPressed: () {
            isFav ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}
