import 'package:flutter/material.dart';
import 'package:learn_flutter/common/widgets/appBar/app_bar_diagnos.dart';

class DetailPenyakitScreen extends StatelessWidget {
  final String judul;
  final String deskripsi;

  const DetailPenyakitScreen({super.key, required this.judul, required this.deskripsi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDiagnosWidget(label: judul),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Definisi",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              deskripsi,
              style: TextStyle(fontSize: 16.0, color: Colors.grey.shade800),
            ),
          ],
        ),
      ),
    );
  }
}
