import 'package:cloud_firestore/cloud_firestore.dart';

class Ceremony {
  const Ceremony({
    required this.name,
    required this.ceremonyDateTime,
    required this.location,
    required this.thumbnail,
    required this.media,
  });

  final String name;
  final DateTime ceremonyDateTime;
  final String location;
  final String thumbnail;
  final List<String> media;

  factory Ceremony.fromJson(Map<String, dynamic> data) {
    final name = data["name"] as String;
    final ceremonyDateTime = (data["datetime"] as Timestamp).toDate();
    final location = data["location"] as String;
    final thumbnail = data["thumbnail"] as String;
    final media = (data["media"] as List<dynamic>)
        .map((media) => media as String)
        .toList();

    return Ceremony(
      name: name,
      ceremonyDateTime: ceremonyDateTime,
      location: location,
      thumbnail: thumbnail,
      media: media,
    );
  }
}
