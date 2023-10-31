import 'dart:async';
import 'dart:math';

import 'package:db_sql_query/db_sql_query.dart';
import 'package:example/db.dart';
import 'package:example/db/init/customers.dart';
import 'package:example/db/init/employees.dart';
import 'package:example/db/init/genres.dart';
import 'package:example/db/init/invoice.dart';
import 'package:example/db/init/invoice_items.dart';
import 'package:example/db/init/media_types.dart';
import 'package:example/db/init/playlist_tracks.dart';
import 'package:example/db/init/playlists.dart';
import 'package:example/db/init/tracks.dart';
import 'package:example/dog.dart';
import 'package:example/dog_category.dart';
import 'package:example/models/album.dart';
import 'package:example/models/artist.dart';
import 'package:example/models/customer.dart';
import 'package:example/models/employee.dart';
import 'package:example/models/genres.dart';
import 'package:example/models/invoice.dart';
import 'package:example/models/invoice_item.dart';
import 'package:example/models/media_type.dart';
import 'package:example/models/playlist.dart';
import 'package:example/models/playlist_track.dart';
import 'package:example/models/track.dart';
import 'package:flutter/material.dart';

import 'db/init/albums.dart';
import 'db/init/artists.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configSql();
      runApp(const MyApp());
    },
    (error, stack) {},
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> _dogs = [];

  void initChinookDB() async {
    for (final i in albums) {
      await i.insert();
    }
    for (final i in artists) {
      await i.insert();
    }
    for (final i in customers) {
      await i.insert();
    }
    for (final i in employees) {
      await i.insert();
    }
    for (final i in genres) {
      await i.insert();
    }
    for (final i in invoiceItems) {
      await i.insert();
    }
    for (final i in invoices) {
      await i.insert();
    }
    for (final i in mediaTypes) {
      await i.insert();
    }
    for (final i in playlistTracks) {
      await i.insert();
    }
    for (final i in playlists) {
      await i.insert();
    }
    for (final i in tracks) {
      await i.insert();
    }
  }

  void _loadDogs() async {
    final dogs = await DogQuery.find();
    setState(() {
      _dogs = dogs;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            for (final dog in _dogs)
              Card(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          final nameCtl = TextEditingController(text: dog.name);
                          final ageCtl =
                              TextEditingController(text: dog.age.toString());
                          return Material(
                            type: MaterialType.transparency,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                color: Colors.white,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Update'),
                                    TextFormField(
                                      controller: nameCtl,
                                    ),
                                    TextFormField(
                                      controller: ageCtl,
                                      keyboardType: TextInputType.number,
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await Dog(
                                          id: dog.id,
                                          name: nameCtl.text,
                                          age: int.tryParse(ageCtl.text) ?? 0,
                                          category: dog.category,
                                        ).update();
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context).pop();
                                        _loadDogs();
                                      },
                                      child: const Text('Update'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${dog.id} ${dog.name} ${dog.age} ${dog.category}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await dog.delete();
                          _loadDogs();
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            TextButton(
              onPressed: () async {
                await Future.wait([
                  for (int i = 0; i < 5; i++)
                    DogCategory(name: 'name $i').insert()
                ]);
              },
              child: const Text('init cate'),
            ),
            TextButton(
              onPressed: () async {
                final dog = await DogQuery.findOne();
                if (dog == null) return;
                setState(() {
                  _dogs = [dog];
                });
              },
              child: const Text('Get One'),
            ),
            TextButton(
              onPressed: () async {
                final dogs = await DogQuery.rawQuery(
                  parser: (e) => Dog.fromJsonDB(e),
                  select: [
                    DogQuery.dogId,
                    DogQuery.dogAge,
                    DogQuery.dogName,
                    DogQuery.dogCategory,
                    Rename<Dog, IColumn<Dog>>(Count(DogQuery.dogAge), 'count'),
                  ],
                  // where: [
                  //   WhereValue(dogAge, 214),
                  // ],
                  oderByByHaving: [
                    OrderByValue<Dog, IColumn<Dog>>(GetName('count')),
                    // OrderByValue(dogAge),
                    // OrderByValue(dogCategory),
                  ],
                  having: [
                    BetweenValues<Dog, IColumn<Dog>>(GetName('count'), 0, 20),
                  ],
                  innerJoin: [
                    InnerJoin(
                      select: [
                        DogCategoryQuery.dogCategoryName,
                      ],
                      where: [
                        EqualValue<DogCategory, IColumn<DogCategory>,
                            IColumn<Dog>>(
                          DogCategoryQuery.dogCategoryId,
                          DogQuery.dogCategory,
                        ),
                      ],
                    )
                  ],
                  limit: 100,
                  offset: 0,
                  groupBy: [DogQuery.dogCategory],
                );
                setState(() {
                  _dogs = dogs;
                });
              },
              child: const Text('Query raw'),
            ),
            TextButton(
              onPressed: () {
                Dog(
                  name: 'na' * (Random().nextInt(4) + 1).toInt() +
                      'me' * (Random().nextInt(4) + 1).toInt(),
                  age: (Random().nextInt(20) + 7).toInt(),
                ).insert();
              },
              child: const Text('insert random'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadDogs,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
