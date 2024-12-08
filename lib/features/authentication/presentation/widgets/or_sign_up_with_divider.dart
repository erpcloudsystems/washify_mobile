import 'package:flutter/material.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';

class OrSignUpWithDivider extends StatelessWidget {
  const OrSignUpWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Row(
        children: [
          const Flexible(
            child: Divider(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Text(
              StringsManager.orSignUpWith,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const Flexible(
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
