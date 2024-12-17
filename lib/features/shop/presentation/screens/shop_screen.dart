import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/resources/image_paths.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';

import '../../../../core/resources/colors_managers.dart';

Map<String, Map<String, String>> shopItems = {
  '0': {
    'image': ImagePaths.offersPath[0],
    'title': 'Title Title Title Title 1',
    'description':
        'description description description description description 1',
    'price': '99.00',
  },
  '1': {
    'image': ImagePaths.offersPath[1],
    'title': 'Title Title Title Title 2',
    'description':
        'description description description description description 2',
    'price': '125.00',
  },
  '2': {
    'image': ImagePaths.offersPath[2],
    'title': 'Title Title Title Title 3',
    'description':
        'description description description description description 3',
    'price': '345.00',
  },
  '3': {
    'image': ImagePaths.offersPath[3],
    'title': 'Title Title Title Title 4',
    'description':
        'description description description description description 4',
    'price': '845.00',
  },
};

class ShopScreen extends StatelessWidget {
  const ShopScreen({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                shopItems[id]!['image']!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Gutter(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shopItems[id]!['title']!,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorsManager.mainColor,
                          ),
                    ),
                    const GutterSmall(),
                    Text(shopItems[id]!['description']!,
                        style: Theme.of(context).textTheme.titleSmall!),
                    const Gutter(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${StringsManager.price}:',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorsManager.mainColor,
                                  ),
                        ),
                        Text(
                          '${shopItems[id]!['price']!} L.E',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const GutterExtraLarge(),
                    CustomElevatedButton(
                      title: StringsManager.checkOut,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
