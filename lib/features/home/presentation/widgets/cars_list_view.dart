import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washify_mobile/features/home/presentation/widgets/car_list_item.dart';

class CarsListView extends StatelessWidget {
  const CarsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return const CarListItem();
        },
      ),
    );
  }
}
