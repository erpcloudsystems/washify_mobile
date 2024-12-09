import 'package:flutter/material.dart';

import '../../../../core/resources/image_paths.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: SizedBox(
          width: 328,
          height: 70,
          child: Card(
            elevation: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: imagePath == ImagePaths.instapayPath ? BoxFit.cover : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
