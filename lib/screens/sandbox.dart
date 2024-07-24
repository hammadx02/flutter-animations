import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 210;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(
          seconds: 1,
        ),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _margin = 30;
                  },
                );
              },
              child: const Text(
                'Animate margin',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _width = 420;
                  },
                );
              },
              child: const Text(
                'Animate width',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _color = Colors.purple;
                  },
                );
              },
              child: const Text(
                'Animate color',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _opacity = 0;
                  },
                );
              },
              child: const Text(
                'Animate opicity',
              ),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: const Text(
                'Hide me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
