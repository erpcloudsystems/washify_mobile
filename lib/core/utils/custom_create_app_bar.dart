import 'package:flutter/material.dart';

class CustomCreateAppBar extends StatelessWidget {
  const CustomCreateAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
    );
  }
}
