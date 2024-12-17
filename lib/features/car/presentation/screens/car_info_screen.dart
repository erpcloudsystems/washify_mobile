import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';
import 'package:washify_mobile/core/utils/custom_snack_bar.dart';
import 'package:washify_mobile/features/car/data/models/request_service_model.dart';
import 'package:washify_mobile/features/car/logic/cubit/car_cubit.dart';
import 'package:washify_mobile/features/subscription/controller/cubit/subscription_cubit.dart';
import 'package:washify_mobile/features/subscription/data/models/subscription_model.dart';
import '../../../../core/resources/colors_managers.dart';
import '../../../../core/resources/strings_manager.dart';
import '../widgets/added_cars.dart';
import '../widgets/car_info_form.dart';
import '../../../authentication/presentation/widgets/progress_bar_widget.dart';
import '../widgets/select_subscription_list.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key, required this.territory});
  final String territory;

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final plateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final CarCubit carCubit;

  @override
  void initState() {
    carCubit = context.read<CarCubit>();
    carCubit.getBrands();
    super.initState();
  }

  SubscriptionModel? getSelectedSubscription() {
    final subscriptions = context.read<SubscriptionCubit>().subscriptions;
    for (var model in subscriptions) {
      if (model.isSelected) {
        return model;
      }
    }
    return null;
  }

  void addService() {
    if (_formKey.currentState!.validate()) {
      if (getSelectedSubscription() != null) {
        if (getSelectedSubscription()!.selectedDays.isNotEmpty) {
          carCubit.addNewService(
            requestServiceModel: RequestServiceModel(
              subscriptionPlan: getSelectedSubscription()!.id,
              itemCode: getSelectedSubscription()!.itemCode,
              timesPerWeek: getSelectedSubscription()!.timesPerWeek,
              territory: widget.territory,
              plateCode: plateController.text,
              model: modelController.text,
              brand: brandController.text,
              price: getSelectedSubscription()!.price,
            ),
          );

          modelController.clear();
          plateController.clear();
          showSnackBar(
            context: context,
            message: 'Your car has been added.',
          );
          setState(() {});
        } else {
          showSnackBar(
              context: context,
              message: 'Please select visit days',
              color: ColorsManager.red);
        }
      } else {
        showSnackBar(
            context: context,
            message: 'Please select subscription',
            color: ColorsManager.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gutter.large(),
                const ProgressBarWidget(
                  isLocateActive: true,
                  isCarInfoActive: true,
                ),
                const Gutter(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringsManager.carInfo,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorsManager.mainColor,
                          ),
                    ),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          builder: (context) => const AddedCarsWidget(),
                        );
                      },
                      child: Text(
                        'Show / Edit your cars',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14, color: ColorsManager.mainColor),
                      ),
                    ),
                  ],
                ),
                const GutterTiny(),
                Text(
                  StringsManager.addYourCar,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.grey,
                      ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(),
                ),
                Form(
                  key: _formKey,
                  child: CarInfoForm(
                    brandController: brandController,
                    modelController: modelController,
                    plateController: plateController,
                  ),
                ),
                const Gutter(),
                Text(
                  StringsManager.subscription,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.mainColor,
                      ),
                ),
                const SelectSubscriptionList(),
                // TotalPayWidget(
                //   totalPay: carCubit.totalPay,
                // ),
                const GutterLarge(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: CustomElevatedButton(
                    title: StringsManager.addCar,
                    onPressed: () => addService(),
                  ),
                ),
                const GutterLarge(),
                CustomElevatedButton(
                  title: StringsManager.checkOut,
                  onPressed: () {
                    if (carCubit.requestServiceModels.isNotEmpty) {
                      RoutesService.pushNamed(AppRoutes.paymentDetailsScreen,
                          context: context);
                    } else {
                      showSnackBar(
                          context: context,
                          message: 'Please add your car',
                          color: ColorsManager.red);
                    }
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