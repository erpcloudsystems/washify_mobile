import 'package:flutter/material.dart';

class CustomModelBottomSheet extends StatelessWidget {
  const CustomModelBottomSheet({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: child,
    );
  }
}
