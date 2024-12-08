import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';

class CustomScrollingAnimatedColumn extends StatelessWidget {
  const CustomScrollingAnimatedColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimationLimiter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 700),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 25,
              child: FadeInAnimation(child: widget),
            ),
            children: children,
          ),
        ),
      ),
    );
  }
}
