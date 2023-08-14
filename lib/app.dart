import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './welcome_screen/screen/welcome_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tanmay Weds Ankita",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.sacramento().fontFamily,
        colorScheme: const ColorScheme.light(),
      ),
      initialRoute: "/",
      home: const WelcomeScreen(),
    );
  }
}
