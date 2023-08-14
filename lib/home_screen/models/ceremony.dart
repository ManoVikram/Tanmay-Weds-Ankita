class Ceremony {
  const Ceremony(this.image, this.title);

  final String image;
  final String title;
}

const List<Ceremony> ceremonies = [
  Ceremony("assets/images/Marriage.png", "Engagement"),
  Ceremony("assets/images/Marriage.png", "Haldi"),
  Ceremony("assets/images/Marriage.png", "Mehendi"),
  Ceremony("assets/images/Marriage.png", "Marriage"),
];
