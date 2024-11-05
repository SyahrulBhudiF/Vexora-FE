import 'package:flutter/material.dart';
import '../../core/app_export.dart';

//minus import package Custom image view

class AppbarLeadingImage extends StatelessWidget {
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  
  AppbarLeadingImage({
    Key? key,
    this.imagePath,
    this.onTap,
    this.margin,
    this.height,
    this.width}) 
    :super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },  
        child: CustomImageView(
          imagePath: imagePath!,
          height : height ?? 24.h,
          width : width ?? 24.h,
          fit : BoxFit.contain,
        ),
      ),
    );
  }
}