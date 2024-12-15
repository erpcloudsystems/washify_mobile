import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';
import 'package:washify_mobile/core/utils/custom_loading_widget.dart';
import 'package:washify_mobile/core/utils/custom_snack_bar.dart';
import 'package:washify_mobile/features/authentication/data/models/territory_model.dart';
import 'package:washify_mobile/features/authentication/logic/auth/auth_cubit.dart';
import '../widgets/progress_bar_widget.dart';
import '../widgets/territory_widget.dart';

class LocateScreen extends StatefulWidget {
  const LocateScreen({super.key});

  @override
  State<LocateScreen> createState() => _LocateScreenState();
}

class _LocateScreenState extends State<LocateScreen> {
  late final AuthCubit authCubit;
  String? territory;
  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.getTerritory();
  }

  void onCardSelected(List<TerritoryModel> territories, int index) {
    for (var item in territories) {
      if (item.isSelected!) {
        item.toggleSelection();
      }
    }
    territories[index].toggleSelection();
    setState(() {
      territory = territories[index].name;
    });
  }

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
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final territories = authCubit.territories;
                    return SizedBox(
                      height: 450.h,
                      child: state is AuthTerritoryLoadingState
                          ? const CustomLoadingWidget()
                          : GridView.builder(
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
                              itemCount: territories.length,
                              itemBuilder: (context, index) {
                                return TerritoryWidget(
                                  onPressed: () =>
                                      onCardSelected(territories, index),
                                  territoryModel: territories[index],
                                );
                              },
                            ),
                    );
                  },
                ),
                const Gutter(),
                CustomElevatedButton(
                  title: StringsManager.next,
                  onPressed: () {
                    if (territory != null) {
                      RoutesService.pushNamed(
                        AppRoutes.carInfoScreen,
                        context: context,
                        queryParameters: {
                          'territory': territory,
                        },
                      );
                    } else {
                      showSnackBar(
                          context: context,
                          message: StringsManager.pleaseSelectYourLocationFirst,
                          color: ColorsManager.red);
                    }
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
