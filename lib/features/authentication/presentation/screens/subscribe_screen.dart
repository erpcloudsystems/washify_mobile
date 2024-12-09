import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/features/authentication/presentation/widgets/payment_widget.dart';

import '../widgets/car_info_widget.dart';
import '../widgets/progress_bar_widget.dart';
import '../widgets/services_widget.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({super.key});

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  int contentIndex = 0;

  void updateContent() {
    setState(() {
      contentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> contentList = [
      ServicesWidget(
        onPresses: updateContent,
      ),
      CarInfoWidget(
        onPressed: updateContent,
      ),
      const PaymentWidget(),
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProgressBarWidget(
                  isLocateActive: true,
                  isSubscribeActive: true,
                ),
                const GutterLarge(),
                contentList[contentIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
