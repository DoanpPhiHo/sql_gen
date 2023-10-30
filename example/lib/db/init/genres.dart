// spell: disable

import 'dart:convert';

import 'package:example/models/genres.dart';

const _jsonGenres = '''
[
    {
        "name": "Rock"
    },
    {
        "name": "Jazz"
    },
    {
        "name": "Metal"
    },
    {
        "name": "Alternative & Punk"
    },
    {
        "name": "Rock And Roll"
    },
    {
        "name": "Blues"
    },
    {
        "name": "Latin"
    },
    {
        "name": "Reggae"
    },
    {
        "name": "Pop"
    },
    {
        "name": "Soundtrack"
    },
    {
        "name": "Bossa Nova"
    },
    {
        "name": "Easy Listening"
    },
    {
        "name": "Heavy Metal"
    },
    {
        "name": "R&B/Soul"
    },
    {
        "name": "Electronica/Dance"
    },
    {
        "name": "World"
    },
    {
        "name": "Hip Hop/Rap"
    },
    {
        "name": "Science Fiction"
    },
    {
        "name": "TV Shows"
    },
    {
        "name": "Sci Fi & Fantasy"
    },
    {
        "name": "Drama"
    },
    {
        "name": "Comedy"
    },
    {
        "name": "Alternative"
    },
    {
        "name": "Classical"
    },
    {
        "name": "Opera"
    }
]
''';
final genres = (jsonDecode(_jsonGenres) as List).map(
  (e) => Genres.fromJsonDB(e),
);
