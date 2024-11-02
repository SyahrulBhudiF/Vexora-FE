import 'package:flutter/material.dart';
import 'package:vexora_fe/core/app_export.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.alignment,
    this.width,
    this.boxDecoration,
    this.focusNode,
    this.icon,
    this.iconSize,
    this.autofocus = false,
    this.textStyle,
    required this.hint,
    this.hintStyle,
    this.items,
    this.prefix,
    this.prefixConstraint,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged, // Ubah 'onchanged' menjadi 'onChanged' untuk konsistensi
  }) : super(key: key);

  final Alignment alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final FocusNode? focusNode;
  final Icon? icon;
  final double? iconSize;
  final bool autofocus;
  final TextStyle? textStyle;
  final String? hint;
  final TextStyle? hintStyle;
  final List<String>? items;
  final String? prefix;
  final BoxConstraints? prefixConstraint;
  final EdgeInsetsGeometry? contentPadding;
  final BoxDecoration? borderDecoration;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;
  final Function(String)?
      onChanged; // Ubah 'onchanged' menjadi 'onChanged' untuk konsistensi

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: dropDownWidget,
    );
  }

  Widget get dropDownWidget => Container(
        width: width ?? double.maxFinite,
        decoration: boxDecoration,
        child: DropdownButtonFormField<String>(
          // Tambahkan tipe pada DropdownButtonFormField
          focusNode: focusNode,
          icon: icon,
          iconSize: iconSize ?? 24,
          autofocus: autofocus,
          isExpanded: true,
          style: textStyle ?? CustomTextStyles.titleSmallGray50,
          hint: Text(
            hint ?? "", // Ubah hintText menjadi hint
            style: hintStyle ?? CustomTextStyles.titleSmallGray50,
            overflow: TextOverflow.ellipsis,
          ),
          items: (items ?? []).map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleSmallGray50,
              ),
            );
          }).toList(),
          decoration: decoration,
          validator: validator,
          onChanged: (value) {
            if (onChanged != null) {
              // Cek apakah onChanged tidak null
              onChanged!(value.toString());
            }
          },
        ),
      );

  InputDecoration get decoration => InputDecoration(
        prefixIcon: prefix != null
            ? Icon(Icons.access_alarm)
            : null, // Ganti dengan icon sesuai kebutuhan
        prefixIconConstraints: prefixConstraint,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(6.h),
        fillColor: fillColor ?? theme.colorScheme.primary,
        filled: filled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide.none,
        ),
        focusedBorder: (borderDecoration ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.h),
                ))
            .copyWith(
          borderSide: BorderSide(color: theme.colorScheme.primary),
          width: 1,
        ),
      );
}

extension on Object {
  copyWith({required BorderSide borderSide, required int width}) {}
}
