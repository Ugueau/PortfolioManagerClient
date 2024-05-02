import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:portfolio_manager_client/application/injections/initializer.dart';
import 'package:portfolio_manager_client/ui/screens/home.screen.dart';

void main() async {
  initializeInjections();
  await Hive.initFlutter();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 34, 177, 255)),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
