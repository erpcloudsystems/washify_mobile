import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';

import '../../../authentication/presentation/widgets/calender_widget.dart';

class VisitsScreen extends StatelessWidget {
  const VisitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 22,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringsManager.subscriptionConfirmed,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorsManager.mainColor,
                          ),
                    ),
                    const GutterTiny(),
                    const Icon(
                      FontAwesomeIcons.check,
                      color: Colors.black,
                    )
                  ],
                ),
                const GutterExtraLarge(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  color: ColorsManager.grey.withOpacity(0.2),
                  alignment: Alignment.center,
                  child: const Text(StringsManager.thisMonthVisits),
                ),
                const GutterExtraLarge(),
                Text(
                  StringsManager.visitDescription,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const GutterExtraLarge(),
                const CalenderWidget(),
                const GutterExtraLarge(),
                CustomElevatedButton(
                  title: StringsManager.ok,
                  onPressed: () {
                    RoutesService.pushReplacementNamed(
                      context: context,
                      location: AppRoutes.homeScreen,
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
