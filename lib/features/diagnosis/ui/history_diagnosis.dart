import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psikitech_diagnos/common/widgets/appBar/app_bar_diagnos.dart';
import 'package:psikitech_diagnos/constants/colors.dart';
import 'package:psikitech_diagnos/features/diagnosis/domain/models/diagnosis_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  static const String route = '/history';

  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Future<List<DiagnosisResult>> _historyFuture;

  @override
  void initState() {
    super.initState();
    _historyFuture = _loadHistory();
  }

  Future<List<DiagnosisResult>> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyJsonList = prefs.getStringList('diagnosis_history') ?? [];
    return historyJsonList
        .map((jsonString) => DiagnosisResult.fromJson(json.decode(jsonString)))
        .toList();
  }

  Future<void> _deleteItem(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final historyJsonList = prefs.getStringList('diagnosis_history') ?? [];

    // Hapus item berdasarkan indeks
    historyJsonList.removeAt(index);

    // Simpan daftar yang telah diperbarui
    await prefs.setStringList('diagnosis_history', historyJsonList);

    // Perbarui UI
    setState(() {
      _historyFuture = _loadHistory();
    });
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          title: const Text("Konfirmasi Hapus"),
          content: const Text(
            "Apakah Anda yakin ingin menghapus hasil diagnosa ini?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog tanpa menghapus
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                _deleteItem(index); // Hapus item
              },
              child: const Text(
                "Hapus",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDiagnosWidget(label: "Histori Diagnosa"),
      body: FutureBuilder<List<DiagnosisResult>>(
        future: _historyFuture,
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
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _showDeleteConfirmationDialog(index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
