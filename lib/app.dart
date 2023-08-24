import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './welcome_screen/screen/welcome_screen.dart';
import './home_screen/screen/home_screen.dart';
import './ceremony_screen/screens/ceremony_screen.dart';
import './view_media_screen/screens/view_media_screen.dart';

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
        fontFamily: GoogleFonts.dancingScript().fontFamily,
        colorScheme: const ColorScheme.light(),
      ),
      initialRoute: "/",
      routes: {
        WelcomeScreen.route: (context) => const WelcomeScreen(),
        HomeScreen.route: (context) => const HomeScreen(),
        CeremonyScreen.route: (context) => const CeremonyScreen(),
        ViewMediaScreen.route: (context) => const ViewMediaScreen(media: []),
      },
      home: const WelcomeScreen(),
    );
  }
}
