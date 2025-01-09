import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washify_mobile/core/utils/custom_loading_widget.dart';
import 'package:washify_mobile/core/utils/error_widget.dart';
import 'package:washify_mobile/features/car/logic/cubit/car_cubit.dart';
import 'package:washify_mobile/features/car/presentation/widgets/car_list_item.dart';

class CarsListView extends StatefulWidget {
  const CarsListView({super.key, this.inNavBar = false});
  final bool inNavBar;

  @override
  State<CarsListView> createState() => _CarsListViewState();
}

class _CarsListViewState extends State<CarsListView> {
  @override
  void initState() {
    super.initState();
    context.read<CarCubit>().getCars();
  }

  @override
  Widget build(BuildContext context) {
    final carList = context.watch<CarCubit>().carsList;
    return BlocBuilder<CarCubit, CarState>(
      builder: (context, state) {
        if (state is GetCarsLoadingState) {
          return const CustomLoadingWidget();
        }
        if (state is GetCarsErrorState) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        }
        return SizedBox(
          height: widget.inNavBar ? null : 150.h,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.inNavBar ? 2 : 1,
                childAspectRatio: 1,
                mainAxisSpacing: 10),
            scrollDirection: widget.inNavBar ? Axis.vertical : Axis.horizontal,
            itemCount: carList.length,
            itemBuilder: (context, index) {
              return CarListItem(
                car: carList[index],
              );
            },
          ),
        );
      },
    );
  }
}
