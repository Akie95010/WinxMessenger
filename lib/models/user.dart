import 'package:email_app/resources/strings.dart';

class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Bloom',
  imageUrl:  Strings.bloomImage,
  isOnline: true,
);

// USERS
final User kiko = User(
  id: 1,
  name: 'Kiko',
  imageUrl: Strings.kikoImage,
  isOnline: true,
);
final User flora = User(
  id: 2,
  name: 'Flora',
  imageUrl: Strings.floraImage,
  isOnline: true,
);
final User stella = User(
  id: 3,
  name: 'Stella',
  imageUrl: Strings.stellaImage,
  isOnline: false,
);
final User techna = User(
  id: 4,
  name: 'Techna',
  imageUrl: Strings.technaImage,
  isOnline: false,
);
final User musa = User(
  id: 5,
  name: 'Musa',
  imageUrl: Strings.musaImage,
  isOnline: true,
);
final User aisha = User(
  id: 6,
  name: 'Aisha',
  imageUrl: Strings.aishaImage,
  isOnline: false,
);
final User roxy = User(
  id: 7,
  name: 'Roxy',
  imageUrl: Strings.roxyImage,
  isOnline: true,
);
final User icy = User(
  id: 8,
  name: 'Icy',
  imageUrl: Strings.icyImage,
  isOnline: false,
);