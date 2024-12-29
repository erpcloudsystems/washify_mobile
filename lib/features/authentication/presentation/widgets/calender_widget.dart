import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/utils/custom_loading_widget.dart';
import 'package:washify_mobile/core/utils/error_widget.dart';
import 'package:washify_mobile/features/subscription/controller/cubit/subscription_cubit.dart';
import 'package:washify_mobile/features/subscription/data/models/visit_model.dart';

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

  Color _getColor(List<VisitModel> visits) {
    for (var index in visits) {
      if (index.status != 'Pending') {
        return ColorsManager.green;
      } else {
        return Colors.orange;
      }
    }
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SubscriptionCubit>();
    final visits = cubit.visits;

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
          return SizedBox(
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(StringsManager.youHaveNoVisits),
            ),
          );
        }
        return SfDateRangePicker(
          minDate: DateTime(visits.first.year, visits.first.month),
          initialSelectedDate: visits.first,
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
          selectionColor: _getColor(cubit.visitsList),
          selectionShape: DateRangePickerSelectionShape.rectangle,
          selectableDayPredicate: (DateTime date) =>
              _predicateCallback(visits, date),
        );
      },
    );
  }
}
