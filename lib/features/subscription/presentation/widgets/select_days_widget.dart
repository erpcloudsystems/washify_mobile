import 'package:flutter/material.dart';
import '../../data/models/days_week_model.dart';

class SelectDaysWidget extends StatelessWidget {
  const SelectDaysWidget({
    super.key,
    required this.onChanged,
  });
  final Function(bool, int) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listOfWeekDays.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(5),
          child: ChoiceChip(
            selected: listOfWeekDays[index].isSelected,
            label: Text(
              listOfWeekDays[index].shortCut,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onSelected: (value) => onChanged(value, index),
          ),
        ),
      ),
    );
  }
}
