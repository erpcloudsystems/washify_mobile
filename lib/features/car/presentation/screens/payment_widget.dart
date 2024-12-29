import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/resources/image_paths.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';
import 'package:washify_mobile/core/utils/custom_snack_bar.dart';
import 'package:washify_mobile/features/car/logic/cubit/car_cubit.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../authentication/presentation/widgets/progress_bar_widget.dart';
import '../../../subscription/controller/cubit/subscription_cubit.dart';
import '../widgets/car_info_record.dart';
import '../../../authentication/presentation/widgets/payment_method_widget.dart';
import '../widgets/subscription_record.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final carCubit = context.read<CarCubit>();
    final subscriptions = context.watch<SubscriptionCubit>().subscriptions;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gutter(),
                const ProgressBarWidget(
                  isLocateActive: true,
                  isCarInfoActive: true,
                  isPayNow: true,
                ),
                const GutterLarge(),
                ListView.builder(
                  itemCount: subscriptions.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = subscriptions[index];
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: const Border(
                              top: BorderSide(width: 0.5),
                              left: BorderSide(width: 0.5),
                              right: BorderSide(width: 0.5),
                            ),
                          ),
                          child: Text(
                            '#${index + 1} Subscription details',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: ColorsManager.mainColor,
                                    ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              SubscriptionRecord(
                                title: 'Subscription name: ',
                                value: item.name,
                              ),
                              const GutterSmall(),
                              SubscriptionRecord(
                                title: 'Times per week: ',
                                value: item.timesPerWeek.toString(),
                              ),
                              const GutterSmall(),
                              SubscriptionRecord(
                                title: 'Price determination: ',
                                value: item.priceDetermination,
                              ),
                              const GutterSmall(),
                              SubscriptionRecord(
                                title: 'Price: ',
                                value:
                                    '${item.price.toString()} ${item.currency}',
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const Gutter(),
                Text(
                  StringsManager.payWith,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorsManager.mainColor,
                      ),
                ),
                const GutterTiny(),
                const Divider(),
                const Gutter(),
                CarInfoRecord(
                  title: StringsManager.fees,
                  value: '${carCubit.totalPay} EGP',
                ),
                const Gutter(),
                CarInfoRecord(
                  title: StringsManager.discount,
                  value: '-0 EGP',
                ),
                const GutterSmall(),
                const Divider(),
                const GutterSmall(),
                CarInfoRecord(
                  title: StringsManager.toPay,
                  value: '${carCubit.totalPay} EGP',
                ),
                const GutterLarge(),
                const PaymentMethodWidget(
                  imagePath: ImagePaths.visaPath,
                ),
                const PaymentMethodWidget(
                  imagePath: ImagePaths.cashPath,
                ),
                const Gutter(),
                const Divider(),
                const Gutter(),
                BlocConsumer<CarCubit, CarState>(
                  listener: (context, state) {
                    if (state is CreateRequestServiceSuccessState) {
                      showSnackBar(
                          context: context,
                          message: 'Your service was created successfully');
                      RoutesService.go(
                        context: context,
                        location: AppRoutes.visitsScreen,
                      );
                      carCubit.reset();
                    } else {
                      if (state is CreateRequestServiceErrorState) {
                        showSnackBar(
                            context: context,
                            message: state.errorMessage,
                            color: ColorsManager.red);
                      }
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      title: StringsManager.payNow,
                      isLoading: state is CreateRequestServiceLoadingState,
                      onPressed: () async {
                        await carCubit.createRequestService();
                        // RoutesService.pushReplacementNamed(
                        //   context: context,
                        //   location: AppRoutes.visitsScreen,
                        // );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
