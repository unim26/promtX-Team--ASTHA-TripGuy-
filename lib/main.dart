import 'package:flutter/material.dart';
import 'package:tripguy/data/get_train_data.dart';
import 'package:tripguy/data/location_data.dart';
import 'package:tripguy/data/plan_with_ai.dart';
import 'package:tripguy/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
