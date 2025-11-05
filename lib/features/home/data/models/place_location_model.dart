class PlaceLocationModel {
  final String title;
  final String subtitle;

  const PlaceLocationModel({
    required this.title,
    required this.subtitle,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PlaceLocationModel &&
        other.title == title &&
        other.subtitle == subtitle;
  }

  @override
  int get hashCode => Object.hash(title, subtitle);
}
