
class Event {
  final String id;
  final String title;
  String description;
  String bannerImage;
  DateTime dateTime;
  String organiserName;
  String organiseIcon;
  String venueName;
  String venueCity;
  String venueCountry;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerImage,
    required this.dateTime,
    required this.organiserName,
    required this.organiseIcon,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry
  });
}

