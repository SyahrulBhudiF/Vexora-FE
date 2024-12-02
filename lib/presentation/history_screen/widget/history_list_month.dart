import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart'; // Import paket month_picker_dialog
import 'package:intl/intl.dart';

class CustomDropDownWithMonthPicker extends StatefulWidget {
  final double width;
  final String hintText;
  final Alignment alignment;
  final List items;
  final Widget prefix;
  final BoxConstraints prefixConstraint;
  final EdgeInsets contentPadding;
  final ValueChanged<DateTime> onMonthSelected; // Add this line

  const CustomDropDownWithMonthPicker({
    Key? key,
    required this.width,
    required this.hintText,
    required this.alignment,
    required this.items,
    required this.prefix,
    required this.prefixConstraint,
    required this.contentPadding,
    required this.onMonthSelected, // Add this line
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
          widget.onMonthSelected(picked); // Add this line
        }
      },
      child: Container(
        width: widget.width,
        padding: widget.contentPadding,
        alignment: widget.alignment,
        decoration: BoxDecoration(
          color: Colors.white,
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
                    color: selectedMonth == null ? Colors.grey : Colors.black),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
