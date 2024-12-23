import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/features/subscription/controller/cubit/subscription_cubit.dart';
import '../../../subscription/data/models/days_week_model.dart';

class SelectSubscriptionList extends StatefulWidget {
  const SelectSubscriptionList({super.key});

  @override
  State<SelectSubscriptionList> createState() => _SelectSubscriptionListState();
}

class _SelectSubscriptionListState extends State<SelectSubscriptionList> {
  @override
  void initState() {
    context.read<SubscriptionCubit>().getSubscriptions();
    super.initState();
  }

  int validateTimesPerWeek() {
    int count = 0;
    for (var item in listOfWeekDays) {
      if (item.isSelected) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionCubit = context.watch<SubscriptionCubit>();
    return Wrap(
      spacing: 5.w,
      children: List.generate(
        subscriptionCubit.subscriptions.length,
        (index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: ColorsManager.mainColor,
            ),
          ),
          child: Column(
            children: [
              CheckboxListTile.adaptive(
                title: Text(subscriptionCubit.subscriptions[index].name),
                subtitle: Text(
                    '${subscriptionCubit.subscriptions[index].currency}  ${subscriptionCubit.subscriptions[index].price}'),
                value: subscriptionCubit.subscriptions[index].isSelected,
                onChanged: (value) {
                  setState(() {
                    subscriptionCubit.subscriptions[index].toggleSelected();
                  });
                },
              ),
              /*if (subscriptionCubit.subscriptions[index].isSelected)
                SelectDaysWidget(
                  onChanged: (value, idx) {
                    if (!listOfWeekDays[idx].isSelected) {
                      if (validateTimesPerWeek() <
                          subscriptionCubit.subscriptions[index].timesPerWeek) {
                        setState(() {
                          subscriptionCubit.subscriptions[index].selectedDays
                              .add(
                            listOfWeekDays[idx],
                          );
                          listOfWeekDays[idx].toggleSelected();
                        });
                      } else {
                        showSnackBar(
                          context: context,
                          message:
                              'Please select ${subscriptionCubit.subscriptions[index].timesPerWeek} days only',
                          color: ColorsManager.red,
                        );
                      }
                    } else {
                      setState(() {
                        listOfWeekDays[idx].toggleSelected();
                        subscriptionCubit.subscriptions[index].selectedDays
                            .removeAt(index);
                      });
                    }
                  },
                )*/
            ],
          ),
        ),
      ),
    );
  }
}
