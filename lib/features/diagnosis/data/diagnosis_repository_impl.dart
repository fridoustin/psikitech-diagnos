import 'package:learn_flutter/core/local_storage.dart';
import 'package:learn_flutter/features/diagnosis/domain/models/diagnosis_result.dart';
import 'package:learn_flutter/features/diagnosis/domain/repositories/diagnosis_repository.dart';


class DiagnosisRepositoryImpl implements DiagnosisRepository {
  final LocalStorageService _localStorageService;

  DiagnosisRepositoryImpl(this._localStorageService);

  @override
  Future<void> saveDiagnosis(DiagnosisResult result) async {
    final history = await _localStorageService.getDiagnosisHistory();
    if (!history.contains(result.toJson())) {
      history.add(result.toJson());
      await _localStorageService.saveDiagnosisHistory(history);
  }
  }

  @override
  Future<List<DiagnosisResult>> getHistory() async {
    final history = await _localStorageService.getDiagnosisHistory();
    return history.map((e) => DiagnosisResult.fromJson(e)).toList();
  }
}
