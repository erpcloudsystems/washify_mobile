import 'package:flutter/material.dart';

import '../../../../core/resources/image_paths.dart';

class TerritoryWidget extends StatelessWidget {
  const TerritoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Positioned(
          left: 40,
          top: 60,
          child: Text(
            'TAJ City',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
