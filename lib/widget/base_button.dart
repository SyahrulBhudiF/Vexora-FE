import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  BaseButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.buttonColor,
    this.buttonTextColor,
    this.isDisabled,
    this.height,
    this.width,
    this.margin,
    this.alignment,
    ButtonStyle? buttonStyle,
    TextStyle? buttonTextStyle,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final bool? isDisabled;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
