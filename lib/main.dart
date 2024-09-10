import 'package:flutter/material.dart';
import 'package:Portfolio/pages/doi_page.dart';
import 'package:Portfolio/pages/home.dart';
import 'package:Portfolio/pages/squareo_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      home: const Home(),
    );
  }
}
