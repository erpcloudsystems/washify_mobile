import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:pinput/pinput.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/custom_drop_down_widget.dart';
import '../../../../../core/utils/custom_text_form_field.dart';
import '../../logic/cubit/car_cubit.dart';

class CarInfoForm extends StatelessWidget {
  const CarInfoForm(
      {super.key,
      required this.brandController,
      required this.modelController,
      required this.plateController});
  final TextEditingController brandController;
  final TextEditingController modelController;
  final TextEditingController plateController;

  @override
  Widget build(BuildContext context) {
    final carCubit = context.watch<CarCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.carBrand,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorsManager.mainColor,
              ),
        ),
        const GutterTiny(),
        CustomDropDownFormField(
          selectedValue: (value) {
            brandController.text = value!;
          },
          dropDownList: carCubit.brands,
          hint: '',
        ),
        const Gutter(),
        Text(
          StringsManager.carModel,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorsManager.mainColor,
              ),
        ),
        const GutterTiny(),
        CustomTextFormField(
          controller: modelController,
        ),
        const Gutter(),
        Text(
          StringsManager.plateNo,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorsManager.mainColor,
              ),
        ),
        const GutterTiny(),
        Pinput(
            controller: plateController,
            length: 6,
            autofillHints: const [AutofillHints.oneTimeCode],
            toolbarEnabled: false,
            errorTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorsManager.red,
                ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return StringsManager.emptyValidator;
              }
              return null;
            }),
      ],
    );
  }
}
