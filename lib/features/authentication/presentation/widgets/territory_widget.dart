import 'package:flutter/material.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/features/authentication/data/models/territory_model.dart';

import '../../../../../core/resources/image_paths.dart';

class TerritoryWidget extends StatelessWidget {
  const TerritoryWidget(
      {super.key, required this.territoryModel, required this.onPressed});
  final TerritoryModel territoryModel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              ImagePaths.territoryPath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  color: territoryModel.isSelected!
                      ? ColorsManager.green
                      : Colors.black,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              territoryModel.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorsManager.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
