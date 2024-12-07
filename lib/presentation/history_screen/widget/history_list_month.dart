import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vexora_fe/core/app_export.dart';

class CustomDropDownWithDatePicker extends StatefulWidget {
  final double width;
  final String hintText;
  final Alignment alignment;
  final List items;
  final Widget prefix;
  final BoxConstraints prefixConstraint;
  final EdgeInsets contentPadding;
  final Function(DateTime) onDateSelected;

  const CustomDropDownWithDatePicker({
    Key? key,
    required this.width,
    required this.hintText,
    required this.alignment,
    required this.items,
    required this.prefix,
    required this.prefixConstraint,
    required this.contentPadding,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  CustomDropDownWithDatePickerState createState() =>
      CustomDropDownWithDatePickerState();
}

class CustomDropDownWithDatePickerState
    extends State<CustomDropDownWithDatePicker> {
  String? selectedDateText;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (picked != null) {
          setState(() {
            selectedDateText = DateFormat('dd MMMM yyyy').format(picked);
            selectedDate = picked;
          });
          widget.onDateSelected(picked);
        }
      },
      child: Container(
        width: widget.width,
        padding: widget.contentPadding,
        alignment: widget.alignment,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            widget.prefix,
            Expanded(
              child: Text(
                selectedDateText ?? widget.hintText,
                style: TextStyle(
                  color: selectedDateText == null ? Colors.white : Colors.white,
                ),
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

  void resetDate() {
    setState(() {
      selectedDateText = null;
      selectedDate = null;
    });
  }
}