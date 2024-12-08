import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/resources/strings_manager.dart';

class TimeAndDatePicker extends StatefulWidget {
  const TimeAndDatePicker({
    required this.dateController,
    required this.hint,
    super.key,
  });

  final TextEditingController dateController;
  final String hint;

  @override
  State<TimeAndDatePicker> createState() => _TimeAndDatePickerState();
}

class _TimeAndDatePickerState extends State<TimeAndDatePicker> {
  DateTime? _selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    // Select date
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime:
            TimeOfDay.fromDateTime(_selectedDateTime ?? DateTime.now()),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          widget.dateController.text = _selectedDateTime!.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => _selectDateTime(context),
      controller: widget.dateController,
      readOnly: true,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return StringsManager.emptyValidator;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(
          FontAwesomeIcons.calendarDays,
          size: 18.sp,
        ),
      ),
    );
  }
}
