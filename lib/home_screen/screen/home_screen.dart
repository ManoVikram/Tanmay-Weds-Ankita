import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../models/ceremony.dart';
import '../widgets/function_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Functions",
          style: TextStyle(
            fontFamily: GoogleFonts.merienda().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: const SizedBox.shrink(),
        leadingWidth: 0.0,
        primary: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: defaultPadding,
            left: defaultPadding,
            right: defaultPadding,
          ),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: defaultPadding),
            itemCount: ceremonies.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: defaultPadding),
              child: FunctionCard(
                image: ceremonies[index].image,
                title: ceremonies[index].title,
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
