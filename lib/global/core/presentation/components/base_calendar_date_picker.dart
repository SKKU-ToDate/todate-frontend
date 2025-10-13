import 'package:flutter/material.dart';

class BaseCalendarDatePicker extends StatefulWidget {
  const BaseCalendarDatePicker({
    super.key,
    required this.selectedDate,
    required this.handleDateChanged,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> handleDateChanged;

  @override
  State<BaseCalendarDatePicker> createState() => _BaseCalendarDatePickerState();
}

class _BaseCalendarDatePickerState extends State<BaseCalendarDatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
  }

  @override
  void didUpdateWidget(covariant BaseCalendarDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDate != oldWidget.selectedDate) {
      _selectedDate = widget.selectedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: _selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2099),
      onDateChanged: (DateTime pickedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
        widget.handleDateChanged(pickedDate);
      },
    );
  }
}
