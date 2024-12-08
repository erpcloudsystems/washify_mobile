import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../../../core/utils/custom_elevated_button.dart';
import '../widgets/progress_bar_widget.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

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
                const ProgressBarWidget(
                  isLocateActive: true,
                  isSubscribeActive: true,
                ),
                const GutterLarge(),
                Text(
                  StringsManager.services,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const GutterTiny(),
                Text(
                  StringsManager.chooseYourMonthlySubscription,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.grey,
                      ),
                ),
                const Gutter(),
                const Divider(),
                const Gutter(),
                SizedBox(
                  height: 450.h,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 32,
                      crossAxisSpacing: 32,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: ColorsManager.mainColor,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Daily',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      );
                    },
                  ),
                ),
                const Gutter(),
                CustomElevatedButton(
                  title: StringsManager.next,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
