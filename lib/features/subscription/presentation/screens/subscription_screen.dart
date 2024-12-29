import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_elevated_icon_button.dart';
import 'package:washify_mobile/core/utils/custom_loading_widget.dart';
import 'package:washify_mobile/core/utils/error_widget.dart';
import 'package:washify_mobile/features/subscription/controller/cubit/subscription_cubit.dart';

import '../../../car/data/models/request_service_model.dart';
import '../../../car/logic/cubit/car_cubit.dart';
import '../widgets/subscription_card.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key, required this.car});
  final RequestServiceModel car;

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<SubscriptionCubit>()
        .getSubscription(widget.car.subscriptionPlan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsManager.yourSubscription,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CarCubit>().addNewService(
                    requestServiceModel: RequestServiceModel(
                      subscriptionPlan: widget.car.subscriptionPlan,
                      itemCode: context
                          .read<SubscriptionCubit>()
                          .subscriptionModel!
                          .itemCode,
                      timesPerWeek: context
                          .read<SubscriptionCubit>()
                          .subscriptionModel!
                          .timesPerWeek,
                      // weekDays: getSelectedSubscription()!.selectedDays,
                      territory: widget.car.territory,
                      plateCode: widget.car.plateCode,
                      model: widget.car.model,
                      brand: widget.car.brand,
                      price: context
                          .read<SubscriptionCubit>()
                          .subscriptionModel!
                          .price,
                    ),
                  );
              RoutesService.pushNamed(AppRoutes.carInfoScreen,
                  context: context,
                  queryParameters: {
                    'territory': widget.car.territory,
                    'isEdit': 'true'
                  });
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
          builder: (context, state) {
            if (state is GetSubscriptionsLoadingState) {
              return const CustomLoadingWidget();
            } else if (state is GetSubscriptionsErrorState) {
              return CustomErrorWidget(
                errorMessage: state.errorMessage,
              );
            }
            return Column(
              children: [
                SubscriptionCard(
                  subscription:
                      context.watch<SubscriptionCubit>().subscriptionModel!,
                  car: widget.car,
                ),
                const Gutter(),
                Flexible(
                  child: CustomElevatedIconButton(
                    title: 'Cancel subscription',
                    icon: const Icon(
                      FontAwesomeIcons.ban,
                      color: Colors.red,
                    ),
                    size: const Size(double.infinity, 40),
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
