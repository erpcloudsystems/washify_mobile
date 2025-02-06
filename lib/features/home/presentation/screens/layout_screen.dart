import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/under_develop_widget.dart';
import 'package:washify_mobile/features/car/presentation/widgets/cars_list_view.dart';
import 'package:washify_mobile/features/home/presentation/screens/home_screen.dart';

import '../../../../core/resources/colors_managers.dart';
import '../widgets/more_widget.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 2;
  final List<Widget> _screens = [
    const UnderDevelopmentScreen(),
    const UnderDevelopmentScreen(),
    const HomeScreen(),
    const CarsListView(
      inNavBar: true,
    ),
    const MoreWidget(),
  ];

  final headers = [
    StringsManager.services,
    StringsManager.shop,
    StringsManager.home,
    StringsManager.yourCars,
    StringsManager.more,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex != 2
          ? AppBar(
              title: Text(headers[_selectedIndex]),
              actions: [
                if (_selectedIndex == 3)
                  IconButton(
                    icon: const Icon(Icons.add_box),
                    onPressed: () {
                      RoutesService.pushNamed(
                        AppRoutes.locateScreen,
                        context: context,
                      );
                    },
                  ),
              ],
            )
          : null,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        index: _selectedIndex,
        height: 60,
        animationDuration: const Duration(milliseconds: 500),
        items: const [
          FaIcon(
            FontAwesomeIcons.servicestack,
            color: ColorsManager.mainColor,
          ),
          FaIcon(
            FontAwesomeIcons.shop,
            color: ColorsManager.mainColor,
          ),
          FaIcon(
            FontAwesomeIcons.house,
            color: ColorsManager.mainColor,
          ),
          FaIcon(
            FontAwesomeIcons.car,
            color: ColorsManager.mainColor,
          ),
          FaIcon(
            FontAwesomeIcons.listCheck,
            color: ColorsManager.mainColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _screens[_selectedIndex],
    );
  }
}
