import 'package:flutter/material.dart';
import 'package:yahya_porfolio/pages/doi_page.dart';
import 'package:yahya_porfolio/pages/squareo_page.dart';

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
      home: const DrawOverItPage(),
    );
  }
}
