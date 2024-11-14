import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart'; // Import paket month_picker_dialog
import 'package:intl/intl.dart';
import 'package:vexora_fe/core/app_export.dart'; // Library untuk formatting tanggal

class CustomDropDownWithMonthPicker extends StatefulWidget {
  final double width;
  final String hintText;
  final Alignment alignment;
  final List<String> items;
  final Widget prefix;
  final BoxConstraints prefixConstraint;
  final EdgeInsets contentPadding;

  const CustomDropDownWithMonthPicker({
    Key? key,
    required this.width,
    required this.hintText,
    required this.alignment,
    required this.items,
    required this.prefix,
    required this.prefixConstraint,
    required this.contentPadding,
  }) : super(key: key);

  @override
  _CustomDropDownWithMonthPickerState createState() =>
      _CustomDropDownWithMonthPickerState();
}

class _CustomDropDownWithMonthPickerState
    extends State<CustomDropDownWithMonthPicker> {
  String? selectedMonth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showMonthPicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (picked != null) {
          setState(() {
            selectedMonth = DateFormat('MMMM').format(picked);
          });
        }
      },
      child: Container(
        width: widget.width,
        padding: widget.contentPadding,
        alignment: widget.alignment,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            widget.prefix,
            Expanded(
              child: Text(
                selectedMonth ?? widget.hintText,
                style: TextStyle(
                    color: selectedMonth == null ? Colors.white : Colors.white),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: theme.colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}