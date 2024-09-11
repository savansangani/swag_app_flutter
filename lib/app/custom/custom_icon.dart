import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  final Color? color;
  final String icon;
  final double? height;
  final double? width;
  final double? padding;
  final Function()? onTap;

  const CustomIcon({
    super.key,
    this.color,
    required this.icon,
    this.height,
    this.width,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 0),
        child: SvgPicture.asset(
          icon,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
