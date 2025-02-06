import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:pinput/pinput.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/custom_text_form_field.dart';
import '../../../../core/utils/custom_search_drop_down.dart';
import '../../logic/cubit/car_cubit.dart';

class CarInfoForm extends StatelessWidget {
  const CarInfoForm(
      {super.key,
      required this.brandController,
      required this.modelController,
      required this.plateController,
      required this.addressController,
      required this.notesController});
  final TextEditingController brandController;
  final TextEditingController modelController;
  final TextEditingController plateController;
  final TextEditingController addressController;
  final TextEditingController notesController;

  @override
  Widget build(BuildContext context) {
    final carCubit = context.watch<CarCubit>();
    return BlocBuilder<CarCubit, CarState>(builder: (context, state) {
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
          CustomSearchDropDown(
            list: carCubit.brands,
            controller: brandController,
            onChanged: (value) {
              if (value != null) {
                carCubit.getModelByBrand(value);
              }
            },
          ),
          // CustomDropDownFormField(
          //   selectedValue: (value) async {
          //     brandController.text = value!;
          //     await carCubit.getModelByBrand(value);
          //   },
          //   dropDownList: carCubit.brands,
          //   hint: state is GetBrandsLoadingState ? null : brandController.text,
          // ),
          const Gutter(),
          if (carCubit.models.isNotEmpty) ...[
            Text(
              StringsManager.carModel,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.mainColor,
                  ),
            ),
            const GutterTiny(),
            CustomSearchDropDown(
              list: carCubit.models,
              controller: modelController,
            ),
            // CustomDropDownFormField(
            //   selectedValue: (value) {
            //     modelController.text = value!;
            //   },
            //   dropDownList: carCubit.models,
            //   hint: state is GetCarsModelByBrandLoadingState
            //       ? null
            //       : modelController.text,
            // ),
          ],
          const Gutter(),
          Text(
            StringsManager.address,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorsManager.mainColor,
                ),
          ),
          const GutterTiny(),
          CustomTextFormField(
            controller: addressController,
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
            keyboardType: TextInputType.text,
            controller: plateController,
            length: 8,
            errorTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorsManager.red,
                ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return StringsManager.emptyValidator;
              }
              return null;
            },
          ),
          const Gutter(),
          Text(
            StringsManager.notes,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorsManager.mainColor,
                ),
          ),
          const GutterTiny(),
          CustomTextFormField(
            controller: notesController,
            maxLines: 3,
            hintText: StringsManager.addAnyNotesHere,
          ),
        ],
      );
    });
  }
}
