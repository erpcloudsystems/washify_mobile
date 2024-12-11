import 'package:flutter/material.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/features/authentication/presentation/data/models/territory_model.dart';

import '../../../../core/resources/image_paths.dart';

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
                  border: Border.all(
                    color: territoryModel.isSelected!
                        ? ColorsManager.green
                        : Colors.transparent,
                    width: 3,
                  ),
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 60,
            child: Text(
              territoryModel.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
