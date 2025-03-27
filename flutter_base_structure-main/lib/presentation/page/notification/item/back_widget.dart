
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/resources/icons/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FBackWidget extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final Color backgroundColor;
  final double sizeIcon;
  final Color iconColor;
  final double borderSize;
  final String assets;

  const FBackWidget({
    super.key,
    this.size = 39.0,
    this.onTap = _defaultOnTap,
    this.backgroundColor = Colors.white,
    this.sizeIcon = 16.0,
    this.iconColor = Colors.red,
    this.borderSize = 8.0,
    this.assets = AppImages.icChevronLeft,
  });

  static void _defaultOnTap() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: const Color(0xFFD7D7D7), width: 1),
          borderRadius: BorderRadius.circular(borderSize),
        ),
        child: Center(
          child: SizedBox(
            width: sizeIcon,
            height: sizeIcon,
            child: SvgPicture.asset(
              assets,
              color: iconColor,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

