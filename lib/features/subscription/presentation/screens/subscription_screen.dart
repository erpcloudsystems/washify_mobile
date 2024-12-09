import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/utils/custom_elevated_icon_button.dart';

import '../widgets/subscription_card.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringsManager.yourSubscription,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SubscriptionCard(),
            const Gutter(),
            Row(
              children: [
                Flexible(
                  child: CustomElevatedIconButton(
                    title: 'Edit',
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    icon: const Icon(
                      FontAwesomeIcons.penToSquare,
                    ),
                    size: const Size(double.infinity, 40),
                  ),
                ),
                const Gutter(),
                Flexible(
                  child: CustomElevatedIconButton(
                    title: 'Delete',
                    icon: const Icon(
                      FontAwesomeIcons.xmark,
                      color: Colors.red,
                    ),
                    size: const Size(double.infinity, 40),
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
