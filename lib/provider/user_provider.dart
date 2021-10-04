import 'package:flutter/material.dart';
import '../model/user.dart';

class UserProvider with ChangeNotifier {
  final List<User> _users = [];

  UserProvider() {
    _seeder();
  }

  List<User> get users => _users;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void editUser(User user, int index) {
    _users[index] = user;
    notifyListeners();
  }

  void deleteUser(User user, int index) {
    _users.removeAt(index);
    notifyListeners();
  }

  void _seeder() {
    _users.addAll([
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
    ]);
  }
}
