import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';

import '../../../../core/global/dependencies_container.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/router/route_services.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: ColorsManager.mainColor,
                ),
              ),
            ),
          ),
          const GutterSmall(),
          const Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                title: Text('About Us'),
                leading: Icon(
                  Icons.info,
                  color: ColorsManager.mainColor,
                ),
              ),
            ),
          ),
          const GutterSmall(),
          const Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                title: Text('FAQ'),
                leading: Icon(
                  Icons.question_answer,
                  color: ColorsManager.mainColor,
                ),
              ),
            ),
          ),
          const GutterSmall(),
          InkWell(
            onTap: () {
              sl<SharedPreferences>().clear();
              RoutesService.go(
                  context: context, location: AppRoutes.loginScreen);
            },
            child: const Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ListTile(
                  title: Text('Logout'),
                  leading: Icon(
                    Icons.logout,
                    color: ColorsManager.mainColor,
                  ),
                ),
              ),
            ),
          ),
          const GutterSmall(),
        ],
      ),
    );
  }
}
