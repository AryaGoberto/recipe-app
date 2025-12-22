import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/recipe_home_page.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipe',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F8FB),
        textTheme: textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F8FB),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF0F172A)),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1FB8AD),
          primary: const Color(0xFF1FB8AD),
          secondary: const Color(0xFFE8F6F5),
          background: const Color(0xFFF6F8FB),
        ),
      ),
      home: const RecipeHomePage(),
    );
  }
}
