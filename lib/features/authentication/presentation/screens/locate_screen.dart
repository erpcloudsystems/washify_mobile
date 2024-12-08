import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/resources/image_paths.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';

import '../widgets/progress_bar_widget.dart';

class LocateScreen extends StatelessWidget {
  const LocateScreen({super.key});

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
                ),
                const GutterLarge(),
                Text(
                  StringsManager.locate,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const GutterTiny(),
                Text(
                  StringsManager.chooseYourTerritory,
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
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              ImagePaths.territoryPath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Positioned.fill(
                            child: Opacity(
                              opacity: 0.3,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 40,
                            top: 60,
                            child: Text(
                              'TAJ City',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const Gutter(),
                CustomElevatedButton(
                  title: StringsManager.next,
                  onPressed: () {
                    RoutesService.pushNamed(
                      AppRoutes.subscribeScreen,
                      context: context,
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
