import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import '../../../car/presentation/screens/payment_widget.dart';
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
      // const CarInfoScreen(
      //     // onPressed: updateContent,
      //     ),
      const PaymentDetailsScreen(),
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
                  isCarInfoActive: true,
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
