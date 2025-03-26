
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/resources/icons/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackWidget extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final double sizeIcon;
  final Color iconColor;
  final double borderSize;
  final  String assets;
  const BackWidget({
    super.key,
    this.size = 39.0,
    this.backgroundColor = Colors.white,
    this.sizeIcon = 16.0,
    this.iconColor = Colors.red,
    this.borderSize = 8,
    this.assets = AppImages.icChevronLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: const Color(0xFFD7D7D7),width: 1),
            borderRadius: BorderRadius.circular(borderSize)
        ),
        child: Center(
          child: SizedBox(
            width: sizeIcon,
            height: sizeIcon,
            child:
            SvgPicture.asset(
              assets,
              color: iconColor,
              fit: BoxFit.contain,
            ),
          ),
        )
    );
  }
}
