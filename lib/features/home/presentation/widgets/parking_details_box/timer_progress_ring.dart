import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerProgressRing extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final String timeText;

  const TimerProgressRing({
    super.key,
    required this.progress,
    required this.timeText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72.w,
      height: 72.w,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: progress),
        duration: const Duration(milliseconds: 800),
        builder: (context, value, _) {
          return CustomPaint(
            painter: _TimerProgressPainter(value),
            child: Center(
              child: Text(
                timeText,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TimerProgressPainter extends CustomPainter {
  final double progress;

  _TimerProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    double stroke = 6;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width / 2) - stroke;

    /// 1️⃣ Background Circle (white stroke)
    Paint backgroundPaint = Paint()
      ..color = Colors.white      // PURE WHITE
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    /// 2️⃣ Progress Arc (green stroke)
    Paint progressPaint = Paint()
      ..color = const Color(0xFF6CBF4E) // same green used everywhere
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double sweepAngle = 2 * 3.14159265 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14 / 2, // start from top center
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_TimerProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

