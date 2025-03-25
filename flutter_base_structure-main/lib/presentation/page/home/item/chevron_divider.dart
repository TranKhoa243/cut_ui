import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/base/base_page.dart';

class ChevronDivider extends StatelessWidget {
  const ChevronDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: CustomPaint(
        painter: ChevronPainter(),
      ),
    );
  }
}

class ChevronPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Vẽ nền màu F6F6F6
    Paint backgroundPaint = Paint()..color = AppColors.colorFFF6F6F6;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Vẽ đường kẻ hình chữ V
    Paint paint = Paint()
      ..color = AppColors.colorFFF6F6F6 // Màu của đường kẻ
      ..strokeWidth = 1 // Độ dày của đường kẻ
      ..style = PaintingStyle.stroke;

    Path path = Path();
    double midX = size.width / 2;
    double midY = size.height;

    path.moveTo(0, 0); // Bên trái trên
    path.lineTo(midX, midY); // Đỉnh giữa
    path.lineTo(size.width, 0); // Bên phải trên

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}