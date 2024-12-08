import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washify_mobile/core/extensions/date_time_extension.dart';
import '../../../../../core/resources/strings_manager.dart';

class DateFormPicker extends StatefulWidget {
  const DateFormPicker({
    required this.dateController,
    required this.hint,
    super.key,
  });

  final TextEditingController dateController;
  final String hint;

  @override
  State<DateFormPicker> createState() => _DateFormPickerState();
}

class _DateFormPickerState extends State<DateFormPicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.dateController.text = picked.toString().formatDate();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => _selectDate(context),
      controller: widget.dateController,
      onSaved: (_) {
        widget.dateController.clear();
        widget.dateController.dispose();
      },
      readOnly: true,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return StringsManager.emptyValidator;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: Icon(
          FontAwesomeIcons.calendarDays,
          size: 18.sp,
        ),
      ),
    );
  }
}
