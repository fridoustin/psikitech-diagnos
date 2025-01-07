import 'package:psikitech_diagnos/features/diagnosis/domain/models/diagnosis_result.dart';
import 'package:psikitech_diagnos/features/diagnosis/domain/repositories/diagnosis_repository.dart';

class SaveDiagnosisResult {
  final DiagnosisRepository repository;

  SaveDiagnosisResult(this.repository);

  Future<void> call(DiagnosisResult result) async {
    await repository.saveDiagnosis(result);
  }
}
