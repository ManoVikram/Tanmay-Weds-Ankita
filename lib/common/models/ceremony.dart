import 'package:cloud_firestore/cloud_firestore.dart';

class Ceremony {
  const Ceremony({
    required this.name,
    required this.date,
    required this.time,
    required this.location,
    required this.locationOnMaps,
    required this.thumbnail,
    required this.media,
  });

  final String name;
  final DateTime date;
  final String time;
  final String location;
  final String locationOnMaps;
  final String thumbnail;
  final List<String> media;

  factory Ceremony.fromJson(Map<String, dynamic> data) {
    final name = data["name"] as String;
    final date = (data["date"] as Timestamp).toDate();
    final time = data["timing"] as String;
    final location = data["location"] as String;
    final locationOnMaps = data["locationOnMaps"] as String;
    final thumbnail = data["thumbnail"] as String;
    final media = (data["media"] as List<dynamic>)
        .map((media) => media as String)
        .toList();

    return Ceremony(
      name: name,
      date: date,
      time: time,
      location: location,
      locationOnMaps: locationOnMaps,
      thumbnail: thumbnail,
      media: media,
    );
  }
}
