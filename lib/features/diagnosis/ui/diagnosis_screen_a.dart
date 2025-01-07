import 'package:flutter/material.dart';
import 'package:psikitech_diagnos/common/widgets/appBar/app_bar_diagnos.dart';
import 'package:psikitech_diagnos/common/widgets/questionTitle/question_title.dart';
import 'package:psikitech_diagnos/core/local_storage.dart';
import 'package:psikitech_diagnos/features/diagnosis/data/diagnosis_repository_impl.dart';
import 'package:psikitech_diagnos/features/diagnosis/domain/usecase/save_diagnosis_result.dart';
import 'package:psikitech_diagnos/features/diagnosis/logic/diagnosis_logic_a.dart';
import 'package:psikitech_diagnos/features/diagnosis/ui/result_screen.dart';

class DiagnosisScreen extends StatefulWidget {
  static const String route = '/diagnosis';
  final SaveDiagnosisResult? saveDiagnosisResult;

  const DiagnosisScreen({super.key, this.saveDiagnosisResult});

  @override
  _DiagnosisScreenState createState() => _DiagnosisScreenState();
}

class _DiagnosisScreenState extends State<DiagnosisScreen> {
  late final DiagnosisLogic _logic;

  @override
void initState() {
  super.initState();
  _logic = DiagnosisLogic(widget.saveDiagnosisResult ?? defaultSaveDiagnosisResult());
}

// Fungsi default untuk SaveDiagnosisResult
SaveDiagnosisResult defaultSaveDiagnosisResult() {
  final localStorageService = LocalStorageService(); // Pastikan ini sudah diimplementasikan
  final diagnosisRepository = DiagnosisRepositoryImpl(localStorageService);
  return SaveDiagnosisResult(diagnosisRepository);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDiagnosWidget(label: "Depresi"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_logic.currentStep == 0) ...[
              const Text(
                'A1: Selama 2 minggu terakhir:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...List.generate(_logic.answersA1.length, (index) {
                return QuestionTile(
                  question: _logic.questionsA1[index],
                  value: _logic.answersA1[index],
                  onChanged: (value) {
                    setState(() {
                      _logic.answersA1[index] = value;
                    });
                  },
                );
              }),
            ] else if (_logic.currentStep == 1) ...[
              const Text(
                'A2: Selama 2 minggu terakhir:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...List.generate(_logic.answersA2.length, (index) {
                return QuestionTile(
                  question: _logic.questionsA2[index],
                  value: _logic.answersA2[index],
                  onChanged: (value) {
                    setState(() {
                      _logic.answersA2[index] = value;
                    });
                  },
                );
              }),
            ] else if (_logic.currentStep == 2) ...[
              const Text(
                'A3: Riwayat Depresi:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              QuestionTile(
                question: _logic.questionA3a,
                value: _logic.answerA3a,
                onChanged: (value) {
                  setState(() {
                    _logic.answerA3a = value;
                  });
                },
              ),
              QuestionTile(
                question: _logic.questionA3b,
                value: _logic.answerA3b,
                onChanged: (value) {
                  setState(() {
                    _logic.answerA3b = value;
                  });
                },
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final result = _logic.nextStep();
                if (result != null) {
                  Navigator.of(context).pushReplacementNamed(
                    ResultScreen.route,
                    arguments: result,
                  );
                } else {
                  setState(() {});
                }
              },
              child: Text(_logic.currentStep < 2 ? 'Lanjut' : 'Selesai'),
            ),
          ],
        ),
      ),
    );
  }
}
