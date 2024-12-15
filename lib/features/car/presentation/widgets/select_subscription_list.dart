import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/features/subscription/controller/cubit/subscription_cubit.dart';

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
          child: CheckboxListTile.adaptive(
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
        ),
      ),
    );
  }
}
