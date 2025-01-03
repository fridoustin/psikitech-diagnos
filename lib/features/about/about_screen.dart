import 'package:flutter/material.dart';
import 'package:learn_flutter/common/widgets/appBar/app_bar.dart';
import 'package:learn_flutter/common/widgets/bottomBar/bottom_bar.dart';
import 'package:learn_flutter/constants/colors.dart';

class AboutScreen extends StatelessWidget {
  static const String route = '/about';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarWidget(label: ""),
      bottomNavigationBar: BottomBarWidget(currentIndex: 2),
    );
  }
}