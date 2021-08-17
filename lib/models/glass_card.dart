import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    Key? key,
    required this.color,
    this.child,
    this.onPress,
    this.padding,
    this.borderRadius,
    this.blurX,
    this.blurY,
    this.borderWidth,
    this.borderColor,
  }) : super(key: key);

  final Color color;
  final Widget? child;
  final void Function()? onPress;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? blurX;
  final double? blurY;
  final double? borderWidth;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: padding ?? EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurX ?? 6, sigmaY: blurY ?? 12),
            child: Container(
              decoration: BoxDecoration(
                color: color, // Colors.white.withOpacity(0.1),
                borderRadius: borderRadius ?? BorderRadius.circular(0),
                border: Border.all(
                  width: borderWidth ?? 0,
                  color: borderColor ?? Colors.transparent,
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
