import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washify_mobile/core/global/dependencies_container.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/resources/image_paths.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import '../../../../core/resources/constance.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../authentication/presentation/widgets/calender_widget.dart';
import '../../../car/presentation/widgets/cars_list_view.dart';
import '../widgets/image_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final String name = sl<SharedPreferences>().getString(userName)!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Hi, $name',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ColorsManager.mainColor,
                                ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        sl<SharedPreferences>().clear();
                        RoutesService.go(
                            context: context, location: AppRoutes.loginScreen);
                      },
                      icon: const Icon(
                        Icons.logout,
                      ),
                    ),
                  ],
                ),
                const Gutter(),
                const ImageSlider(
                  images: ImagePaths.offersPath,
                ),
                const Gutter(),
                Text(
                  StringsManager.yourCars,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Gutter(),
                const CarsListView(),
                const GutterLarge(),
                Text(
                  StringsManager.yourVisits,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Gutter(),
                const Card(
                  elevation: 6,
                  child: CalenderWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
