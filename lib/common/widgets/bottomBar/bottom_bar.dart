import 'package:flutter/material.dart';
import 'package:learn_flutter/common/widgets/bottomBar/bottom_bar_item.dart';
import 'package:learn_flutter/constants/colors.dart';

class BottomBarWidget extends StatelessWidget {
  final int? currentIndex;

  const BottomBarWidget({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor
      ),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      height: 76,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BottomBarItemWidget(
            index: 0, 
            iconAsset: 'assets/icons/home.svg', 
            label: "Home", 
            isSelected: currentIndex == 0,
            onTap: () => Navigator.of(context).pushReplacementNamed('/home')
          ),
          BottomBarItemWidget(
            index: 1, 
            iconAsset: 'assets/icons/listPenyakit.svg', 
            label: "Penyakit", 
            isSelected: currentIndex == 1,
            onTap: () => Navigator.of(context).pushReplacementNamed('/penyakit')
          ),
          BottomBarItemWidget(
            index: 2, 
            iconAsset: 'assets/icons/about.svg', 
            label: "About", 
            isSelected: currentIndex == 2,
            onTap: () => Navigator.of(context).pushReplacementNamed('/about')
          ),
        ],
      ),
    );
  }
}