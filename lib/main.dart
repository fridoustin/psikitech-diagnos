import 'package:flutter/material.dart';
import 'package:learn_flutter/constants/colors.dart';
// import 'package:learn_flutter/features/diagnosis/ui/diagnosis_screen_A.dart';
import 'package:learn_flutter/features/home/home_screen.dart';
import 'package:learn_flutter/constants/theme.dart';
import 'package:learn_flutter/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppColors.primaryColor,
      theme: appTheme,
      home: const HomePage(),
      onGenerateRoute: routeGenerators,
      navigatorObservers: [routeObserver],
    );
  }
}
