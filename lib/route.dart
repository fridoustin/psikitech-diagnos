import 'package:flutter/material.dart';
import 'package:learn_flutter/features/about/about_screen.dart';
import 'package:learn_flutter/features/diagnosis/domain/repositories/diagnosis_repository.dart';
import 'package:learn_flutter/features/diagnosis/domain/usecase/save_diagnosis_result.dart';
import 'package:learn_flutter/features/diagnosis/ui/diagnosis_screen_a.dart';
import 'package:learn_flutter/features/diagnosis/ui/history_diagnosis.dart';
import 'package:learn_flutter/features/diagnosis/ui/result_screen.dart';
import 'package:learn_flutter/features/home/home_screen.dart';
import 'package:learn_flutter/features/penyakit/list_penyakit_screen.dart';

Route<dynamic> routeGenerators(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case HomePage.route :
      return _buildPageRoute(const HomePage());
    case AboutScreen.route :
      return _buildPageRoute(const AboutScreen());
    case ListPenyakitScreen.route :
      return _buildPageRoute(const ListPenyakitScreen());
    case DiagnosisScreen.route:
      return _buildPageRoute(DiagnosisScreen(
        saveDiagnosisResult: args is SaveDiagnosisResult ? args : null,
      ));
    case ResultScreen.route:
      if (args is String) {
        return _buildPageRoute(ResultScreen(result: args)); // Ubah parameter ke `result`
      } else {
        throw ('Diagnosis result not provided for ResultScreen');
      }
    case HistoryScreen.route:
      // Izinkan `args` bernilai null atau `DiagnosisRepository`
      if (args == null || args is DiagnosisRepository) {
        return _buildPageRoute(
          HistoryScreen(repository: args as DiagnosisRepository?),
        );
      } else {
        throw ('Invalid argument provided for HistoryScreen');
      }
    default:
      throw ('Route not found');
  }  
}

PageRoute _buildPageRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}