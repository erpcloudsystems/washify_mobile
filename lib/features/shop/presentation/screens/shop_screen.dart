import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../data/models/shop_item_model.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({
    super.key,
    required this.shopItem,
  });
  final ShopItemModel shopItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                shopItem.image,
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
                      shopItem.name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorsManager.mainColor,
                          ),
                    ),
                    const GutterSmall(),
                    Text(shopItem.description,
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
                          '${shopItem.price} L.E',
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
