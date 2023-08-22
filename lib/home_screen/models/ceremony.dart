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
    final ceremonyDateTime = data["datetime"] as DateTime;
    final location = data["location"] as String;
    final thumbnail = data["thumbnail"] as String;
    final media = data["media"] as List<String>;

    return Ceremony(
      name: name,
      ceremonyDateTime: ceremonyDateTime,
      location: location,
      thumbnail: thumbnail,
      media: media,
    );
  }
}

List<Ceremony> ceremonies = [
  Ceremony(
    name: "Engagement",
    ceremonyDateTime: DateTime.now(),
    location: "Rajasthan",
    thumbnail:
        "https://media.vogue.in/wp-content/uploads/2019/09/Anushka-Sharma-Virat-Kohli-featured-1920x1080.jpg",
    media: [],
  ),
];
