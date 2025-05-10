import 'package:flutter/material.dart';

class RotationAnimated extends StatefulWidget {
  const RotationAnimated({super.key});

  @override
  State<StatefulWidget> createState() => _RotationAnimatedState();
}

class _RotationAnimatedState extends State<RotationAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    )..repeat();
    super.initState();
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
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.14159, // 0~2π 旋转
          child: child,
        );
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
