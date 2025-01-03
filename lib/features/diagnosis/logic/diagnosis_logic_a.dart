// ignore: file_names
import 'package:learn_flutter/features/diagnosis/domain/models/diagnosis_result.dart';
import 'package:learn_flutter/features/diagnosis/domain/usecase/save_diagnosis_result.dart';

class DiagnosisLogic {
  // Jawaban dari setiap pertanyaan
  List<bool?> answersA1 = [null, null, null];
  List<bool?> answersA2 = List.filled(7, null);
  bool? answerA3a;
  bool? answerA3b;

  // Tahapan diagnosa
  int currentStep = 0;

  // Tambahkan use case untuk menyimpan hasil
  final SaveDiagnosisResult saveDiagnosisResult;

  DiagnosisLogic(this.saveDiagnosisResult);

  // Pertanyaan untuk setiap langkah
  final List<String> questionsA1 = [
    'Apakah Anda merasa sedih, depresi, atau murung hampir sepanjang hari?',
    'Apakah Anda hampir sepanjang waktu kurang berminat terhadap banyak hal?',
    'Apakah Anda merasa lelah atau tidak bertenaga, hampir sepanjang waktu?',
  ];

  final List<String> questionsA2 = [
    'Nafsu makan berubah secara mencolok atau berat badan menurun tanpa usaha?',
    'Kesulitan tidur hampir setiap malam?',
    'Berbicara atau bergerak lebih lambat daripada biasanya?',
    'Kehilangan kepercayaan diri atau merasa tak berharga?',
    'Merasa bersalah atau menyalahkan diri sendiri?',
    'Kesulitan berpikir atau berkonsentrasi?',
    'Berniat menyakiti diri atau ingin mati?',
  ];

  final String questionA3a = 'Apakah Anda pernah merasa seperti ini selama 2 minggu atau lebih?';
  final String questionA3b = 'Sebelum merasa seperti ini, apakah Anda merasa baik selama setidaknya 2 bulan?';

  // Fungsi untuk menghitung jawaban "YA"
  int countYes(List<bool?> answers) {
    return answers.where((answer) => answer == true).length;
  }

  // Logika diagnosa
  String? nextStep() {
    String? result;
    if (currentStep == 0) {
      if (countYes(answersA1) >= 2) {
        currentStep++;
      } else {
        result = 'Diagnosa: Tidak memiliki Depresi.';
        saveDiagnosisResult.call(DiagnosisResult(
        result: result,
        date: DateTime.now(),
      ));
      }
    } else if (currentStep == 1) {
      if (countYes(answersA2) >= 4) {
        currentStep++;
      } else {
        result = 'Diagnosa: Tidak memiliki Depresi.';
        saveDiagnosisResult.call(DiagnosisResult(
        result: result,
        date: DateTime.now(),
      ));
      }
      
    } else if (currentStep == 2) {
      if (answerA3a == true) {
        result = 'Diagnosa: Gangguan Depresi Berulang.';
      } else {
        result = 'Diagnosa: Gangguan Depresi.';
      }

      // Simpan hasil ke local storage
      saveDiagnosisResult.call(DiagnosisResult(
        result: result,
        date: DateTime.now(),
      ));
    }
    return result;
  }

  // Reset diagnosa
  void resetDiagnosis() {
    answersA1 = [null, null, null];
    answersA2 = List.filled(7, null);
    answerA3a = null;
    answerA3b = null;
    currentStep = 0;
  }
}
