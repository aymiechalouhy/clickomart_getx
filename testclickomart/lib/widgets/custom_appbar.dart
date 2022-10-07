import 'dart:math';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      flexibleSpace: const CustomPaint(
        painter: MyCustomPainter(),
        size: Size.infinite,
      ),
      title:
         Center(
           child: Transform.translate(
            offset: const Offset(0, 2),
            child: Image.asset("assets/images/logo.png", height: 60, width: 60),
        ),
         ),
      // ),
      backgroundColor: const Color.fromARGB(246, 243, 240, 240),
      elevation: 0,
    );
  }
}


class MyCustomPainter extends CustomPainter {
  const MyCustomPainter({Listenable? repaint}) : super(repaint: repaint);

  static const circleSize = 90.0;
  static const gap = 15.0;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    var shadow = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue
      ..maskFilter = MaskFilter.blur(
        BlurStyle.inner,
        Shadow.convertRadiusToSigma(5),
      );

    var path = Path();
    path.lineTo(0, size.height - gap);
    path.lineTo(size.width / 2, size.height - gap);
    path.arcTo(
      Rect.fromLTWH(
        size.width / 2 - circleSize / 2,
        size.height - circleSize,
        circleSize,
        circleSize,
      ),
      pi,
      -pi,
      false,
    );
    path.lineTo(size.width / 2, size.height - gap);
    path.lineTo(size.width, size.height - gap);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, shadow);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return false;
  }
}
