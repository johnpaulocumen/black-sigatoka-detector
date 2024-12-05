import 'package:flutter/material.dart';
import 'package:mobile_app/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/app_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState();
  appState.initPrefs();
  runApp(
    ChangeNotifierProvider(
      create: (context) => appState, // Use the same instance of AppState
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Black Sigatoka Detector',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Start with the splash screen
    );
  }
}
