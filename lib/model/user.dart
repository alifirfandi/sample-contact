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

  static List<User> users = [
    User(
        name: 'Angle H. Kerwin',
        location: 'Natchez',
        email: 'angleHKerwin@armyspy.com',
        image: 'assets/20.jpg'),
    User(
        name: 'Donna T. Hacker',
        location: 'Adrian',
        email: 'donnaTHacker@dayrep.com',
        image: 'assets/21.jpg'),
    User(
        name: 'Pearl J. Shumaker',
        location: 'Fresno',
        email: 'pearlJShumaker@jourrapide.com',
        image: 'assets/22.jpg'),
    User(
        name: 'Stevie S. Scott',
        location: 'Baton Rouge',
        email: 'stevieSScott@rhyta.com',
        image: 'assets/23.jpg'),
    User(
        name: 'Kenneth K. Laney',
        location: 'Arlington',
        email: 'kennethKLaney@dayrep.com',
        image: 'assets/24.jpg'),
    User(
        name: 'Clair K. Thompson',
        location: 'Bedford',
        email: 'clairKThompson@rhyta.com',
        image: 'assets/25.jpg'),
    User(
        name: 'Teresa F. Mitchell',
        location: 'Sunset',
        email: 'teresaFMitchell@armyspy.com',
        image: 'assets/26.jpg'),
    User(
        name: 'James J. Harris',
        location: 'Camden',
        email: 'jamesJHarris@teleworm.us',
        image: 'assets/27.jpg'),
    User(
        name: 'Michael A. Henderson',
        location: 'Fairfax',
        email: 'michaelAHenderson@jourrapide.com',
        image: 'assets/28.jpg'),
    User(
        name: 'Kittie T. Kester',
        location: 'Albany',
        email: 'kittieTKester@rhyta.com',
        image: 'assets/29.jpg'),
  ];
}
