import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psikitech_diagnos/constants/colors.dart';

class BottomBarItemWidget extends StatelessWidget {
  final int index;
  final String iconAsset;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomBarItemWidget({
    super.key,
    required this.index,
    required this.iconAsset,
    required this.label,
    this.isSelected = false,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !isSelected ? onTap : null,
      child: Column(
        children: [
          const SizedBox(height: 16.0,),
          SvgPicture.asset(
            iconAsset,
            semanticsLabel: label,
            width: 24,
            height: 24,
            colorFilter: isSelected
              ? const ColorFilter.mode(AppColors.primaryBlack, BlendMode.srcIn)
              : const ColorFilter.mode(AppColors.backgroundColor, BlendMode.srcIn)
          ),
          const SizedBox(height: 4),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.primaryBlack : AppColors.backgroundColor
            ),
          )
        ],
      ),
    );
  }
}