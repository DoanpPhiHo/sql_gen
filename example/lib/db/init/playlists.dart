// spell: disable

import 'dart:convert';

import 'package:example/models/playlist.dart';

const _jsonPlaylists = '''
[
    {
        "name": "Music"
    },
    {
        "name": "Movies"
    },
    {
        "name": "TV Shows"
    },
    {
        "name": "Audiobooks"
    },
    {
        "name": "90’s Music"
    },
    {
        "name": "Audiobooks"
    },
    {
        "name": "Movies"
    },
    {
        "name": "Music"
    },
    {
        "name": "Music Videos"
    },
    {
        "name": "TV Shows"
    },
    {
        "name": "Brazilian Music"
    },
    {
        "name": "Classical"
    },
    {
        "name": "Classical 101 - Deep Cuts"
    },
    {
        "name": "Classical 101 - Next Steps"
    },
    {
        "name": "Classical 101 - The Basics"
    },
    {
        "name": "Grunge"
    },
    {
        "name": "Heavy Metal Classic"
    },
    {
        "name": "On-The-Go 1"
    }
]
''';
final playlists = (jsonDecode(_jsonPlaylists) as List).map(
  (e) => Playlist.fromJsonDB(e),
);
