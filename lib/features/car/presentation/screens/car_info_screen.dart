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
  const CarInfoScreen(
      {super.key, required this.territory, this.isEdit = 'false', this.car});
  final String territory;
  final String isEdit;
  final RequestServiceModel? car;

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final plateController = TextEditingController();
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final CarCubit carCubit;

  @override
  void initState() {
    super.initState();
    carCubit = context.read<CarCubit>();
    carCubit.getBrands();
    if (widget.isEdit == 'true' && widget.car != null) {
      brandController.text = widget.car!.brand;
      modelController.text = widget.car!.model;
      plateController.text = widget.car!.plateCode;
    }
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
        carCubit.addNewService(
          requestServiceModel: RequestServiceModel(
            id: widget.isEdit == 'true' ? widget.car!.id : null,
            subscriptionPlan: getSelectedSubscription()!.id,
            itemCode: getSelectedSubscription()!.itemCode,
            timesPerWeek: getSelectedSubscription()!.timesPerWeek,
            // weekDays: getSelectedSubscription()!.selectedDays,
            territory: widget.territory,
            plateCode: plateController.text,
            model: modelController.text,
            brand: brandController.text,
            price: getSelectedSubscription()!.price,
          ),
        );

        plateController.clear();
        addressController.clear();

        showSnackBar(
          context: context,
          message: 'Your car has been added.',
        );

        _reset();
      } else {
        showSnackBar(
            context: context,
            message: 'Please select subscription',
            color: ColorsManager.red);
      }
    }
  }

  void _reset() async {
    context.read<SubscriptionCubit>().resetSubscriptions();
    setState(() {});
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
                if (widget.isEdit != true.toString()) ...[
                  const Gutter.large(),
                  const ProgressBarWidget(
                    isLocateActive: true,
                    isCarInfoActive: true,
                  ),
                ],

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
                        'Show / Edit ${carCubit.requestServiceModels.length} of cars',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14, color: ColorsManager.mainColor),
                      ),
                    ),
                  ],
                ),

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
                    addressController: addressController,
                  ),
                ),
                const Gutter(),
                Text(
                  StringsManager.subscription,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.mainColor,
                      ),
                ),
                SelectSubscriptionList(
                  isEdit: widget.isEdit == 'true',
                ),
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
                  title: '${StringsManager.checkOut} (${carCubit.totalPay}EGP)',
                  onPressed: () {
                    if (carCubit.requestServiceModels.isNotEmpty) {
                      RoutesService.pushNamed(AppRoutes.paymentDetailsScreen,
                          context: context,
                          queryParameters: {
                            'isEdit': widget.isEdit,
                          });
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
