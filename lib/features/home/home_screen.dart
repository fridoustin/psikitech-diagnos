import 'package:flutter/material.dart';
import 'package:learn_flutter/common/widgets/appBar/app_bar.dart';
import 'package:learn_flutter/common/widgets/bottomBar/bottom_bar.dart';
import 'package:learn_flutter/constants/colors.dart';
import 'package:learn_flutter/features/diagnosis/ui/diagnosis_screen_a.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const AppBarWidget(label: "Apa yang ingin kamu lakukan?"),
      bottomNavigationBar: const BottomBarWidget(currentIndex: 0,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, DiagnosisScreen.route);
              },
              child: const Text("Mulai Diagnosis"),
            ),
            const SizedBox(height: 16), // Jarak antar tombol
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              child: const Text("Lihat Histori"),
            ),
          ],
        )
      ),
    );
  }
}