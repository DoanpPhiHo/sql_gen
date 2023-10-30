// spell: disable

import 'dart:convert';

import 'package:example/models/media_type.dart';

const _jsonMediaTypes = '''
[
    {
        "name": "MPEG audio file"
    },
    {
        "name": "Protected AAC audio file"
    },
    {
        "name": "Protected MPEG-4 video file"
    },
    {
        "name": "Purchased AAC audio file"
    },
    {
        "name": "AAC audio file"
    }
]
''';
final mediaTypes = (jsonDecode(_jsonMediaTypes) as List).map(
  (e) => MediaType.fromJsonDB(e),
);
