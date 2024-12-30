import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/utils/custom_model_bottom_sheet.dart';
import 'package:washify_mobile/features/car/logic/cubit/car_cubit.dart';

class AddedCarsWidget extends StatefulWidget {
  const AddedCarsWidget({super.key});

  @override
  State<AddedCarsWidget> createState() => _AddedCarsWidgetState();
}

class _AddedCarsWidgetState extends State<AddedCarsWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CarCubit>();
    final services = cubit.requestServiceModels;
    return CustomModelBottomSheet(
      child: services.isNotEmpty
          ? ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorsManager.mainColor),
                  ),
                  child: ListTile(
                    isThreeLine: true,
                    leading: const Icon(FontAwesomeIcons.car),
                    tileColor: Colors.transparent,
                    title: Text(services[index].brand),
                    trailing: Text(services[index].plateCode),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${services[index].subscriptionPlan} ${services[index].price}"),
                        const Gutter.small(),
                        /*  Wrap(
                          spacing: 1,
                          children: List.generate(
                              services[index].weekDays.length,
                              (idx) => CircleAvatar(
                                    radius: 15,
                                    child: Text(
                                      services[index].weekDays[idx].shortCut,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  )),
                        ),*/
                      ],
                    ),
                    onLongPress: () {
                      cubit.totalPay = cubit.totalPay - services[index].price;
                      cubit.requestServiceModels.removeAt(index);
                      setState(() {});
                    },
                  ),
                );
              },
            )
          : const Center(
              child: Text('No cars added'),
            ),
    );
  }
}
