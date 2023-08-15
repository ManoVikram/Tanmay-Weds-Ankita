import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

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

class LocationAndTiming extends StatelessWidget {
  const LocationAndTiming({
    super.key,
    required this.location,
    required this.timing,
  });

  final String location;
  final String timing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "View on map",
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "At",
                style: TextStyle(
                  fontFamily: GoogleFonts.merienda().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: defaultPadding / 2.0),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Timing",
                style: TextStyle(
                  fontFamily: GoogleFonts.merienda().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: defaultPadding / 2.0),
              Expanded(
                child: Text(
                  timing,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
