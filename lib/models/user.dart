import 'package:email_app/resources/strings.dart';
import 'package:flutter/cupertino.dart';

class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;
  final String password;
  final String login;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
    @required this.password,
    @required this.login,
  });
}

List<User> existUsers = [
  User(
      id: 0,
      name: 'Bloom',
      imageUrl: Strings.bloomImage,
      isOnline: true,
      password: "123",
      login: "bloom01"),
  User(
      id: 1,
      name: 'Kiko',
      imageUrl: Strings.kikoImage,
      isOnline: true,
      password: "123",
      login: "kiko01"),
  User(
      id: 2,
      name: 'Flora',
      imageUrl: Strings.floraImage,
      isOnline: true,
      password: "123",
      login: "flora01"),
  User(
      id: 3,
      name: 'Stella',
      imageUrl: Strings.stellaImage,
      isOnline: false,
      password: "123",
      login: "stella01"),
  User(
      id: 4,
      name: 'Techna',
      imageUrl: Strings.technaImage,
      isOnline: false,
      password: "321",
      login: "technao01"),
  User(
      id: 5,
      name: 'Musa',
      imageUrl: Strings.musaImage,
      isOnline: true,
      password: "123",
      login: "musa01"),
  User(
      id: 6,
      name: 'Aisha',
      imageUrl: Strings.aishaImage,
      isOnline: false,
      password: "123",
      login: "aisha01"),
  User(
      id: 7,
      name: 'Roxy',
      imageUrl: Strings.roxyImage,
      isOnline: true,
      password: "123",
      login: "roxy01"),
  User(
      id: 8,
      name: 'Icy',
      imageUrl: Strings.icyImage,
      isOnline: false,
      password: "123",
      login: "icy01"),
];

final User bloom = User(
    id: 0,
    name: 'Bloom',
    imageUrl: Strings.bloomImage,
    isOnline: true,
    password: "123",
    login: "bloom01");

// USERS
final User kiko = User(
    id: 1,
    name: 'Kiko',
    imageUrl: Strings.kikoImage,
    isOnline: true,
    password: "123",
    login: "kiko01");
final User flora = User(
    id: 2,
    name: 'Flora',
    imageUrl: Strings.floraImage,
    isOnline: true,
    password: "123",
    login: "flora01");
final User stella = User(
    id: 3,
    name: 'Stella',
    imageUrl: Strings.stellaImage,
    isOnline: false,
    password: "123",
    login: "stella01");
final User techna = User(
    id: 4,
    name: 'Techna',
    imageUrl: Strings.technaImage,
    isOnline: false,
    password: "123",
    login: "techna01");
final User musa = User(
    id: 5,
    name: 'Musa',
    imageUrl: Strings.musaImage,
    isOnline: true,
    password: "123",
    login: "musa01");
final User aisha = User(
    id: 6,
    name: 'Aisha',
    imageUrl: Strings.aishaImage,
    isOnline: false,
    password: "123",
    login: "aisha01");
final User roxy = User(
    id: 7,
    name: 'Roxy',
    imageUrl: Strings.roxyImage,
    isOnline: true,
    password: "123",
    login: "roxy01");
final User icy = User(
    id: 8,
    name: 'Icy',
    imageUrl: Strings.icyImage,
    isOnline: false,
    password: "123",
    login: "icy01");
