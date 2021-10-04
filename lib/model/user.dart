class User {
  String image;
  String name;
  String location;
  String email;
  String instagram;
  String twitter;
  String youtube;

  User({
    required this.image,
    required this.name,
    required this.location,
    required this.email,
    this.instagram = '-',
    this.twitter = '-',
    this.youtube = '-',
  });
}
