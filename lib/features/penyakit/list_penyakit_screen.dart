import 'package:flutter/material.dart';
import 'package:learn_flutter/common/widgets/appBar/app_bar.dart';
import 'package:learn_flutter/common/widgets/bottomBar/bottom_bar.dart';
import 'package:learn_flutter/constants/colors.dart';

class ListPenyakitScreen extends StatelessWidget {
  static const String route = '/penyakit';

  const ListPenyakitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for diseases
    final List<String> penyakitList = [
      "Agorafobia",
      "Anorexia Nervosa",
      "Bulimia Nervosa",
      "Distimia",
      "Distimia Resiko Bunuh Diri",
      "Episode Depresi",
      "Episode Manik (Saat Ini/Dulu)",
      "Gangguan Anxietas Menyeluruh",
      "Gangguan Berkaitan Alkohol",
      "Gangguan Berkaitan Zat Psikoaktif",
      "Gangguan Depresi Berulang",
      "Gangguan Obsesif Kompulsif",
      "Gangguan Panik",
      "Gangguan Panik dengan Agorafobia",
      "Gangguan Stres Pasca Trauma",
      "Sosialfobia"
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const AppBarWidget(label: "Penyakit apa yang ingin kamu cari?"),
      bottomNavigationBar: const BottomBarWidget(currentIndex: 1),
      body: Stack(
        children: [
          // Background colors
          Column(
            children: [
              Container(
                height: 32.0,
                color: AppColors.secondaryColor,
              ),
              Expanded(
                child: Container(
                  color: AppColors.backgroundColor,
                ),
              ),
            ],
          ),
          // Search bar and content
          Column(
            children: [
              // Search bar
              Container(
                margin: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Cari Penyakit...",
                          hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14.0),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          // Add search logic here
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // List of diseases
              Expanded(
                child: ListView.builder(
                  itemCount: penyakitList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: ListTile(
                        title: Text(
                          penyakitList[index],
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        onTap: () {
                          // Action when a disease is tapped
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Kamu memilih: ${penyakitList[index]}')),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
