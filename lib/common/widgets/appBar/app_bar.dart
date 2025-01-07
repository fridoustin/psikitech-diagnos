import 'package:flutter/material.dart';
import 'package:psikitech_diagnos/constants/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  final String label;
  const AppBarWidget({super.key, required this.label});

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
              "Hello, Guest",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        )  ,
      )  
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}