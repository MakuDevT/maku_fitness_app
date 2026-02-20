import 'package:flutter/material.dart';

class RippleEffect extends StatefulWidget {
  const RippleEffect({super.key});

  @override
  State<RippleEffect> createState() => _RippleEffectState();
}

class _RippleEffectState extends State<RippleEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(painter: RipplePainter(_controller.value));
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class RipplePainter extends CustomPainter {
  final double progress;

  RipplePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 3; i++) {
      final paint = Paint()
        ..color = Color.fromRGBO(225, 6, 0, 1 - progress)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      final width = (progress * 300) + (i * 100);
      final height = (progress * 40) + (i * 10);
      final rect = Rect.fromCenter(
        center: center,
        width: width,
        height: height,
      );

      canvas.drawOval(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
