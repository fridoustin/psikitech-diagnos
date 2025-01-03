import 'package:learn_flutter/core/local_storage.dart';
import 'package:learn_flutter/features/diagnosis/domain/models/diagnosis_result.dart';

class DiagnosisRepository {
  final LocalStorageService _localStorageService;

  DiagnosisRepository(this._localStorageService);

  // Mengambil histori dari local storage
  Future<List<DiagnosisResult>> getHistory() async {
    final history = await _localStorageService.getDiagnosisHistory();
    return history.map((e) => DiagnosisResult.fromJson(e)).toList();
  }

 // Menyimpan hasil diagnosa ke local storage
  Future<void> saveDiagnosis(DiagnosisResult result) async {
    final history = await _localStorageService.getDiagnosisHistory();
    history.add(result.toJson());
    await _localStorageService.saveDiagnosisHistory(history);
  }
}
