import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class LocationAndTiming extends StatelessWidget {
  const LocationAndTiming({
    super.key,
    required this.location,
    required this.locationOnMaps,
    required this.date,
    required this.time,
  });

  final String location;
  final String locationOnMaps;
  final DateTime date;
  final String time;

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(locationOnMaps))) {
      throw Exception('Could not launch $locationOnMaps');
    }
  }

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
              onTap: () => _launchUrl(),
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
                  "$time on ${DateFormat('EEEE, d\'th\' MMMM').format(date)}",
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
