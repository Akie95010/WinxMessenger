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
  imageUrl: 'assets/images/bloom.jpg ',
  isOnline: true,
);

// USERS
final User kiko = User(
  id: 1,
  name: 'Kiko',
  imageUrl: 'assets/images/kiko.jpg',
  isOnline: true,
);
final User flora = User(
  id: 2,
  name: 'Flora',
  imageUrl: 'assets/images/flora.jpg',
  isOnline: true,
);
final User stella = User(
  id: 3,
  name: 'Stella',
  imageUrl: 'assets/images/stella.jpg',
  isOnline: false,
);
final User techna = User(
  id: 4,
  name: 'Techna',
  imageUrl: 'assets/images/tecna.jpg',
  isOnline: false,
);
final User musa = User(
  id: 5,
  name: 'Musa',
  imageUrl: 'assets/images/musa.jpg',
  isOnline: true,
);
final User aisha = User(
  id: 6,
  name: 'Aisha',
  imageUrl: 'assets/images/aisha.png',
  isOnline: false,
);
final User roxy = User(
  id: 7,
  name: 'Roxy',
  imageUrl: 'assets/images/roxy.jpg',
  isOnline: true,
);
final User icy = User(
  id: 8,
  name: 'Icy',
  imageUrl: 'assets/images/icy.jpg',
  isOnline: false,
);