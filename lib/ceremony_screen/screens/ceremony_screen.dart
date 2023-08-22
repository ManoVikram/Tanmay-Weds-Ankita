import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../widgets/location_and_timing.dart';

class CeremonyScreen extends StatelessWidget {
  const CeremonyScreen({super.key});

  static const String route = "/ceremonyScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Engagement Ceremony",
          style: TextStyle(
            fontFamily: GoogleFonts.merienda().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        leadingWidth: 48.0,
        primary: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const LocationAndTiming(
                  location:
                      "Hawa Mahal Rd, Badi Choupad, J.D.A. Market, Pink City, Jaipur, Rajasthan 302002",
                  timing: "10 AM to 12 PM on Sunday, 25th June",
                ),
                const SizedBox(height: defaultPadding * 1.5),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: defaultPadding),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: defaultPadding / 2.0,
                    crossAxisSpacing: defaultPadding / 2.0,
                  ),
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/images/Marriage.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
