import 'package:google_maps_flutter/google_maps_flutter.dart';

class Places {
  String name;
  String designation;
  String rating;
  String thumbnail;
  LatLng coordinates;

  Places(
      {required this.name,
        required this.designation,
        required this.rating,
        required this.thumbnail,
        required this.coordinates});
}

final List<Places> placesOfInterest = [
  Places(
    name: 'Madhumitha',
    designation: 'Senior Manager',
    rating: '3.2/5',
    thumbnail:
    'https://static.vecteezy.com/system/resources/thumbnails/001/993/889/small_2x/beautiful-latin-woman-avatar-character-icon-free-vector.jpg',
    coordinates: const LatLng(11.046111, 76.851944),
  ),
  Places(
    name: 'Manoj Jayabalan',
    designation: 'Senior Executive',
    rating: '4.5/5',
    thumbnail:
    'https://t4.ftcdn.net/jpg/02/23/50/73/240_F_223507324_jKl7xbsaEdUjGr42WzQeSazKRighVDU4.jpg',
    coordinates: const LatLng(10.938011, 76.687177),
  ),
  Places(
    name: 'Stella Mary',
    designation: 'Assistant Manager',
    rating: '4.3/5',
    thumbnail:
    'https://static.vecteezy.com/system/resources/thumbnails/001/993/889/small_2x/beautiful-latin-woman-avatar-character-icon-free-vector.jpg',
    coordinates: const LatLng(11.05523, 76.993875),
  ),
  Places(
    name: 'Harry Paul Melvin',
    designation: 'Team Leader',
    rating: '3.9/5',
    thumbnail:
    'https://t4.ftcdn.net/jpg/02/23/50/73/240_F_223507324_jKl7xbsaEdUjGr42WzQeSazKRighVDU4.jpg',
    coordinates: const LatLng(11.019349, 76.54476),
  ),
  Places(
    name: 'Harshavarthini',
    designation: 'Team Leader',
    rating: '2.8/5',
    thumbnail:
    'https://static.vecteezy.com/system/resources/thumbnails/001/993/889/small_2x/beautiful-latin-woman-avatar-character-icon-free-vector.jpg',
    coordinates: const LatLng(11.0591, 77.0943),
  ),
  Places(
    name: 'Karthick Naren',
    designation: 'Regional Manager',
    rating: '4.8/5',
    thumbnail:
    'https://t4.ftcdn.net/jpg/02/23/50/73/240_F_223507324_jKl7xbsaEdUjGr42WzQeSazKRighVDU4.jpg',
    coordinates: const LatLng(11.005718, 76.970914),
  ),
];
