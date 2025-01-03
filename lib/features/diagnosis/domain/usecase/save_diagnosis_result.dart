import 'package:learn_flutter/features/diagnosis/domain/models/diagnosis_result.dart';
import 'package:learn_flutter/features/diagnosis/domain/repositories/diagnosis_repository.dart';

class SaveDiagnosisResult {
  final DiagnosisRepository repository;

  SaveDiagnosisResult(this.repository);

  Future<void> call(DiagnosisResult result) async {
    await repository.saveDiagnosis(result);
  }
}
