import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter/common/widgets/appBar/app_bar_diagnos.dart';
import 'package:learn_flutter/features/diagnosis/domain/models/diagnosis_result.dart';
import 'package:learn_flutter/features/diagnosis/domain/repositories/diagnosis_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatelessWidget {
  final DiagnosisRepository? repository;

  static const String route = '/history';

  const HistoryScreen({super.key, this.repository});

  Future<List<DiagnosisResult>> _loadHistory() async {
    if (repository == null) return [];
    return await repository!.getHistory();
  }

  Future<void> _debugPrintSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final historyJson = prefs.getStringList('diagnosis_history') ?? [];
    print("Data di SharedPreferences:");
    for (var item in historyJson) {
      print(item); // Ini akan mencetak JSON mentah
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDiagnosWidget(label: "Histori Diagnosa"),
      body: FutureBuilder<List<DiagnosisResult>>(
        future: _loadHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Terjadi kesalahan saat memuat data.',
                style: TextStyle(fontSize: 16, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada histori diagnosa.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          final history = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: history.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final result = history[index];
              final formattedDate =
                  DateFormat('dd MMM yyyy, HH:mm').format(result.date);
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                title: Text(
                  result.result,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                leading: Icon(
                  Icons.assignment_turned_in_outlined,
                  color: Colors.blue.shade600,
                  size: 32,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _debugPrintSharedPreferences, // Panggil fungsi debug
        child: const Icon(Icons.bug_report),
      ),
    );
  }
}
