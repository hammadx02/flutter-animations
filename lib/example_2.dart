import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }

    path.arcToPoint(
      offset,
      radius: Radius.elliptical(
        size.width / 2,
        size.height / 2,
      ),
      clockwise: clockwise,
    );

    path.close();
    return path;
  }
}

class HalfCircleCliper extends CustomClipper<Path> {
  final CircleSide side;

  HalfCircleCliper({
    super.reclip,
    required this.side,
  });

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: HalfCircleCliper(side: CircleSide.left),
              child: Container(
                color: const Color(0xff0057b7),
                width: 150,
                height: 150,
              ),
            ),
            ClipPath(
              clipper: HalfCircleCliper(side: CircleSide.right),
              child: Container(
                color: const Color(0xffffd700),
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
