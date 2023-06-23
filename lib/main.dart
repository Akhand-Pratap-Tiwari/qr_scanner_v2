import 'package:flutter/material.dart';

import 'database/database.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white12,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          labelStyle: const TextStyle(color: Colors.white54),
          floatingLabelStyle: const TextStyle(color: Colors.deepPurpleAccent),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(160, 56)),
            iconSize: MaterialStateProperty.all(24),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 24)),
            elevation: MaterialStateProperty.all(8),
            backgroundColor: MaterialStateProperty.all(Colors.black),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        brightness: Brightness.light,
      ),
      //TODO: Change Email and pass
      //TODO: Remove DebugPrints
      //TODO: Separate sensitive info
      //TODO: Setup write/fetch guard
      //TODO: Enable Database 
      home: const LoginPage(),
    );
  }
}
