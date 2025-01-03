import 'dart:convert'; // Untuk konversi JSON
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const _diagnosisKey = 'diagnosis_history';

  // Menyimpan hasil diagnosa
  Future<void> saveDiagnosisHistory(List<Map<String, dynamic>> history) async {
    final prefs = await SharedPreferences.getInstance();
    // Pastikan data valid untuk JSON
    final historyJson = history.map((e) {
      return jsonEncode(e.map((key, value) {
        if (value is DateTime) {
          return MapEntry(key, value.toIso8601String());
        }
        return MapEntry(key, value);
      }));
    }).toList();
    await prefs.setStringList(_diagnosisKey, historyJson);
  }

  // Mendapatkan histori diagnosa
  Future<List<Map<String, dynamic>>> getDiagnosisHistory() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      // Ambil data dalam bentuk List<String>
      final historyJson = prefs.getStringList(_diagnosisKey) ?? [];
      // Konversi kembali List<String> (JSON) ke List<Map>
      return historyJson.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
    } catch (e) {
      print("Error decoding JSON: $e");
      return [];
    }
  }
}
