import 'package:flutter/material.dart';
import 'package:learn_flutter/constants/colors.dart';

class AppBarDiagnosWidget extends StatelessWidget implements PreferredSizeWidget {

  final String label;
  const AppBarDiagnosWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.secondaryColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        )  ,
      )  
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}