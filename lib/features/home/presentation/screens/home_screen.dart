import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';
import '../../../../core/global/dependencies_container.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../authentication/presentation/widgets/calender_widget.dart';
import '../widgets/cars_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, Ayman',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorsManager.mainColor,
                        ),
                  ),
                  IconButton(
                    onPressed: () async {
                      // await sl<SharedPreferences>().clear();

                      // RoutesService.go(
                      //     context: context, location: AppRoutes.loginScreen);
                      RoutesService.pushNamed(AppRoutes.locateScreen,
                          context: context);
                    },
                    icon: const Icon(
                      Icons.logout,
                    ),
                  ),
                ],
              ),
              const Gutter(),
              Text(
                StringsManager.visitDescription,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const GutterLarge(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringsManager.yourCars,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    StringsManager.seeAll,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorsManager.mainColor,
                        ),
                  ),
                ],
              ),
              const Gutter(),
              const CarsListView(),
              const GutterLarge(),
              const Card(
                elevation: 6,
                child: CalenderWidget(),
              ),
              const GutterLarge(),
              CustomElevatedButton(
                title: StringsManager.manageYourSubscription,
                onPressed: () {
                  RoutesService.pushNamed(
                    AppRoutes.subscriptionScreen,
                    context: context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
