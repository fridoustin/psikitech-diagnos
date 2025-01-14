import 'package:flutter/material.dart';
import 'package:psikitech_diagnos/common/widgets/appBar/app_bar_diagnos.dart';

class DetailPenyakitScreen extends StatelessWidget {
  final String judul;
  final String definisi;
  final String gejala;
  final String tatalaksana;

  const DetailPenyakitScreen({super.key, required this.judul, required this.definisi, required this.gejala, required this.tatalaksana});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDiagnosWidget(label: judul),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Definisi",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        definisi.replaceAll('\\n', '\n \n'),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey.shade800,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gejala",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      if (gejala.contains('•')) // Jika ada tanda •, pecah menjadi poin-poin
                        ...gejala
                            .replaceAll('\\n', '\n \n')
                            .split('•')
                            .where((item) => item.trim().isNotEmpty)
                            .map((item) {
                          final parts = item.split('-');
                          return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• ${parts.first.trim()}',
                              style: TextStyle(
                                fontSize: 14.0, 
                                color: Colors.grey.shade800
                              ),
                            ),
                            if (parts.length > 1)
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: parts.skip(1).map((subItem) {
                                    return Text(
                                      '- ${subItem.trim()}',
                                      style: TextStyle(fontSize: 14.0, color: Colors.grey.shade800, height: 1.5),
                                    );
                                  }).toList(),
                                ),
                              ),
                          ],
                        );
                        })
                      else // Jika tidak ada tanda •, tampilkan teks apa adanya
                        Text(
                          gejala.replaceAll('\\n', '\n \n'),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey.shade800,
                            height: 1.5,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tatalaksana",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      if (tatalaksana.contains('•')) // Jika ada tanda •, pecah menjadi poin-poin
                        ...tatalaksana
                            .replaceAll('\\n', '\n \n')
                            .split('•')
                            .where((item) => item.trim().isNotEmpty)
                            .map((item) {
                          return Text(
                            '• ${item.trim()}',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey.shade800,
                              height: 1.5,
                            ),
                          );
                        })
                      else // Jika tidak ada tanda •, tampilkan teks apa adanya
                        Text(
                          tatalaksana.replaceAll('\\n', '\n \n'),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey.shade800,
                            height: 1.5,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
