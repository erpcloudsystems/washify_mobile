import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  const UnderDevelopmentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/lottie/under_construction2.json',
                  repeat: false,
                ),
                const Text(
                  'This screen under development',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
