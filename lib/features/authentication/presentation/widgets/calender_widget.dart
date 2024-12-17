import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/utils/custom_loading_widget.dart';
import 'package:washify_mobile/core/utils/error_widget.dart';
import 'package:washify_mobile/features/subscription/controller/cubit/subscription_cubit.dart';

import '../../../../../core/resources/colors_managers.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  CalenderWidgetState createState() => CalenderWidgetState();
}

class CalenderWidgetState extends State<CalenderWidget> {
  @override
  void initState() {
    super.initState();
    context.read<SubscriptionCubit>().getVisits();
  }

  bool _predicateCallback(List<DateTime> visits, DateTime date) {
    for (int i = 0; i < visits.length; i++) {
      if (visits[i] == date) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final visits = context.watch<SubscriptionCubit>().visits;
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        if (state is GetVisitsLoadingState) {
          return const CustomLoadingWidget();
        }
        if (state is GetVisitsErrorState) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        }
        if (visits.isEmpty) {
          return const SizedBox(
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(StringsManager.youHaveNoVisits),
            ),
          );
        }
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
          initialSelectedDates: visits,
          selectionShape: DateRangePickerSelectionShape.rectangle,
          selectableDayPredicate: (DateTime date) =>
              _predicateCallback(visits, date),
        );
      },
    );
  }
}
