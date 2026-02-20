import 'package:flutter/material.dart';
import 'package:maku_fitness_app/config/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color.fromRGBO(225, 6, 0, 1),
          secondary: Color.fromRGBO(30, 27, 28, 1),
          tertiary: Color.fromRGBO(0, 0, 0, 1),
        ),
        useMaterial3: true,
      ),
    );
  }
}
