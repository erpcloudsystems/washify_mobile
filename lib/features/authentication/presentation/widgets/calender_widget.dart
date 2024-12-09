import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../core/resources/colors_managers.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  CalenderWidgetState createState() => CalenderWidgetState();
}

class CalenderWidgetState extends State<CalenderWidget> {
  List<DateTime> _activeDates = [];
  @override
  void initState() {
    super.initState();
    _activeDates = [
      DateTime(2024, 12, 08),
      DateTime(2024, 12, 12),
      DateTime(2024, 12, 18),
      DateTime(2024, 12, 22),
      DateTime(2024, 12, 26),
    ];
  }

  bool _predicateCallback(DateTime date) {
    for (int i = 0; i < _activeDates.length; i++) {
      if (_activeDates[i] == date) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      selectionMode: DateRangePickerSelectionMode.multiple,
      headerStyle: const DateRangePickerHeaderStyle(
        backgroundColor: ColorsManager.mainColor,
        textStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      todayHighlightColor: ColorsManager.white,
      backgroundColor: Colors.white,
      initialSelectedDates: _activeDates,
      selectionShape: DateRangePickerSelectionShape.rectangle,
      selectableDayPredicate: _predicateCallback,
    );
  }
}
