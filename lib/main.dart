import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'shared/sport_theme/colors.dart';

void main() {
  runApp(const SportsApp());
}

class SportsApp extends StatelessWidget {
  const SportsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports App',
      theme: ThemeData(
        primaryColor: SportColors.sportBlue,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: SportColors.sportBlue,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: SportColors.sportBlue,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
