// spell: disable
import 'dart:convert';

import 'package:example/models/album.dart';

const _jsonAlbums = '''
[
    {
        "title": "For Those About To Rock We Salute You",
        "artistId": 1
    },
    {
        "title": "Balls to the Wall",
        "artistId": 2
    },
    {
        "title": "Restless and Wild",
        "artistId": 2
    },
    {
        "title": "Let There Be Rock",
        "artistId": 1
    },
    {
        "title": "Big Ones",
        "artistId": 3
    },
    {
        "title": "Jagged Little Pill",
        "artistId": 4
    },
    {
        "title": "Facelift",
        "artistId": 5
    },
    {
        "title": "Warner 25 Anos",
        "artistId": 6
    },
    {
        "title": "Plays Metallica By Four Cellos",
        "artistId": 7
    },
    {
        "title": "Audioslave",
        "artistId": 8
    },
    {
        "title": "Out Of Exile",
        "artistId": 8
    },
    {
        "title": "BackBeat Soundtrack",
        "artistId": 9
    },
    {
        "title": "The Best Of Billy Cobham",
        "artistId": 10
    },
    {
        "title": "Alcohol Fueled Brewtality Live! [Disc 1]",
        "artistId": 11
    },
    {
        "title": "Alcohol Fueled Brewtality Live! [Disc 2]",
        "artistId": 11
    },
    {
        "title": "Black Sabbath",
        "artistId": 12
    },
    {
        "title": "Black Sabbath Vol. 4 (Remaster)",
        "artistId": 12
    },
    {
        "title": "Body Count",
        "artistId": 13
    },
    {
        "title": "Chemical Wedding",
        "artistId": 14
    },
    {
        "title": "The Best Of Buddy Guy - The Millenium Collection",
        "artistId": 15
    },
    {
        "title": "Prenda Minha",
        "artistId": 16
    },
    {
        "title": "Sozinho Remix Ao Vivo",
        "artistId": 16
    },
    {
        "title": "Minha Historia",
        "artistId": 17
    },
    {
        "title": "Afrociberdelia",
        "artistId": 18
    },
    {
        "title": "Da Lama Ao Caos",
        "artistId": 18
    },
    {
        "title": "Acústico MTV [Live]",
        "artistId": 19
    },
    {
        "title": "Cidade Negra - Hits",
        "artistId": 19
    },
    {
        "title": "Na Pista",
        "artistId": 20
    },
    {
        "title": "Axé Bahia 2001",
        "artistId": 21
    },
    {
        "title": "BBC Sessions [Disc 1] [Live]",
        "artistId": 22
    },
    {
        "title": "Bongo Fury",
        "artistId": 23
    },
    {
        "title": "Carnaval 2001",
        "artistId": 21
    },
    {
        "title": "Chill: Brazil (Disc 1)",
        "artistId": 24
    },
    {
        "title": "Chill: Brazil (Disc 2)",
        "artistId": 6
    },
    {
        "title": "Garage Inc. (Disc 1)",
        "artistId": 50
    },
    {
        "title": "Greatest Hits II",
        "artistId": 51
    },
    {
        "title": "Greatest Kiss",
        "artistId": 52
    },
    {
        "title": "Heart of the Night",
        "artistId": 53
    },
    {
        "title": "International Superhits",
        "artistId": 54
    },
    {
        "title": "Into The Light",
        "artistId": 55
    },
    {
        "title": "Meus Momentos",
        "artistId": 56
    },
    {
        "title": "Minha História",
        "artistId": 57
    },
    {
        "title": "MK III The Final Concerts [Disc 1]",
        "artistId": 58
    },
    {
        "title": "Physical Graffiti [Disc 1]",
        "artistId": 22
    },
    {
        "title": "Sambas De Enredo 2001",
        "artistId": 21
    },
    {
        "title": "Supernatural",
        "artistId": 59
    },
    {
        "title": "The Best of Ed Motta",
        "artistId": 37
    },
    {
        "title": "The Essential Miles Davis [Disc 1]",
        "artistId": 68
    },
    {
        "title": "The Essential Miles Davis [Disc 2]",
        "artistId": 68
    },
    {
        "title": "The Final Concerts (Disc 2)",
        "artistId": 58
    },
    {
        "title": "Up An' Atom",
        "artistId": 69
    },
    {
        "title": "Vinícius De Moraes - Sem Limite",
        "artistId": 70
    },
    {
        "title": "Vozes do MPB",
        "artistId": 21
    },
    {
        "title": "Chronicle, Vol. 1",
        "artistId": 76
    },
    {
        "title": "Chronicle, Vol. 2",
        "artistId": 76
    },
    {
        "title": "Cássia Eller - Coleção Sem Limite [Disc 2]",
        "artistId": 77
    },
    {
        "title": "Cássia Eller - Sem Limite [Disc 1]",
        "artistId": 77
    },
    {
        "title": "Come Taste The Band",
        "artistId": 58
    },
    {
        "title": "Deep Purple In Rock",
        "artistId": 58
    },
    {
        "title": "Fireball",
        "artistId": 58
    },
    {
        "title": "Knocking at Your Back Door: The Best Of Deep Purple in the 80's",
        "artistId": 58
    },
    {
        "title": "Machine Head",
        "artistId": 58
    },
    {
        "title": "Purpendicular",
        "artistId": 58
    },
    {
        "title": "Slaves And Masters",
        "artistId": 58
    },
    {
        "title": "Stormbringer",
        "artistId": 58
    },
    {
        "title": "The Battle Rages On",
        "artistId": 58
    },
    {
        "title": "Vault: Def Leppard's Greatest Hits",
        "artistId": 78
    },
    {
        "title": "Outbreak",
        "artistId": 79
    },
    {
        "title": "Djavan Ao Vivo - Vol. 02",
        "artistId": 80
    },
    {
        "title": "Djavan Ao Vivo - Vol. 1",
        "artistId": 80
    },
    {
        "title": "Elis Regina-Minha História",
        "artistId": 41
    },
    {
        "title": "The Cream Of Clapton",
        "artistId": 81
    },
    {
        "title": "Unplugged",
        "artistId": 81
    },
    {
        "title": "Album Of The Year",
        "artistId": 82
    },
    {
        "title": "Angel Dust",
        "artistId": 82
    },
    {
        "title": "King For A Day Fool For A Lifetime",
        "artistId": 82
    },
    {
        "title": "The Real Thing",
        "artistId": 82
    },
    {
        "title": "Deixa Entrar",
        "artistId": 83
    },
    {
        "title": "In Your Honor [Disc 1]",
        "artistId": 84
    },
    {
        "title": "In Your Honor [Disc 2]",
        "artistId": 84
    },
    {
        "title": "One By One",
        "artistId": 84
    },
    {
        "title": "The Colour And The Shape",
        "artistId": 84
    },
    {
        "title": "My Way: The Best Of Frank Sinatra [Disc 1]",
        "artistId": 85
    },
    {
        "title": "Roda De Funk",
        "artistId": 86
    },
    {
        "title": "As Canções de Eu Tu Eles",
        "artistId": 27
    },
    {
        "title": "Quanta Gente Veio Ver (Live)",
        "artistId": 27
    },
    {
        "title": "Quanta Gente Veio ver--Bônus De Carnaval",
        "artistId": 27
    },
    {
        "title": "Faceless",
        "artistId": 87
    },
    {
        "title": "American Idiot",
        "artistId": 54
    },
    {
        "title": "Appetite for Destruction",
        "artistId": 88
    },
    {
        "title": "Use Your Illusion I",
        "artistId": 88
    },
    {
        "title": "Use Your Illusion II",
        "artistId": 88
    },
    {
        "title": "Blue Moods",
        "artistId": 89
    },
    {
        "title": "A Matter of Life and Death",
        "artistId": 90
    },
    {
        "title": "A Real Dead One",
        "artistId": 90
    },
    {
        "title": "A Real Live One",
        "artistId": 90
    },
    {
        "title": "Brave New World",
        "artistId": 90
    },
    {
        "title": "Dance Of Death",
        "artistId": 90
    },
    {
        "title": "Fear Of The Dark",
        "artistId": 90
    },
    {
        "title": "Iron Maiden",
        "artistId": 90
    },
    {
        "title": "Killers",
        "artistId": 90
    },
    {
        "title": "Live After Death",
        "artistId": 90
    },
    {
        "title": "Live At Donington 1992 (Disc 1)",
        "artistId": 90
    },
    {
        "title": "Live At Donington 1992 (Disc 2)",
        "artistId": 90
    },
    {
        "title": "No Prayer For The Dying",
        "artistId": 90
    },
    {
        "title": "Piece Of Mind",
        "artistId": 90
    },
    {
        "title": "Powerslave",
        "artistId": 90
    },
    {
        "title": "Rock In Rio [CD1]",
        "artistId": 90
    },
    {
        "title": "Rock In Rio [CD2]",
        "artistId": 90
    },
    {
        "title": "Seventh Son of a Seventh Son",
        "artistId": 90
    },
    {
        "title": "Somewhere in Time",
        "artistId": 90
    },
    {
        "title": "The Number of The Beast",
        "artistId": 90
    },
    {
        "title": "The X Factor",
        "artistId": 90
    },
    {
        "title": "Virtual XI",
        "artistId": 90
    },
    {
        "title": "Sex Machine",
        "artistId": 91
    },
    {
        "title": "Emergency On Planet Earth",
        "artistId": 92
    },
    {
        "title": "Synkronized",
        "artistId": 92
    },
    {
        "title": "The Return Of The Space Cowboy",
        "artistId": 92
    },
    {
        "title": "Get Born",
        "artistId": 93
    },
    {
        "title": "Are You Experienced?",
        "artistId": 94
    },
    {
        "title": "Surfing with the Alien (Remastered)",
        "artistId": 95
    },
    {
        "title": "Jorge Ben Jor 25 Anos",
        "artistId": 46
    },
    {
        "title": "Jota Quest-1995",
        "artistId": 96
    },
    {
        "title": "Cafezinho",
        "artistId": 97
    },
    {
        "title": "Living After Midnight",
        "artistId": 98
    },
    {
        "title": "Unplugged [Live]",
        "artistId": 52
    },
    {
        "title": "BBC Sessions [Disc 2] [Live]",
        "artistId": 22
    },
    {
        "title": "Coda",
        "artistId": 22
    },
    {
        "title": "Houses Of The Holy",
        "artistId": 22
    },
    {
        "title": "In Through The Out Door",
        "artistId": 22
    },
    {
        "title": "IV",
        "artistId": 22
    },
    {
        "title": "Led Zeppelin I",
        "artistId": 22
    },
    {
        "title": "Led Zeppelin II",
        "artistId": 22
    },
    {
        "title": "Led Zeppelin III",
        "artistId": 22
    },
    {
        "title": "Physical Graffiti [Disc 2]",
        "artistId": 22
    },
    {
        "title": "Presence",
        "artistId": 22
    },
    {
        "title": "The Song Remains The Same (Disc 1)",
        "artistId": 22
    },
    {
        "title": "The Song Remains The Same (Disc 2)",
        "artistId": 22
    },
    {
        "title": "A TempestadeTempestade Ou O Livro Dos Dias",
        "artistId": 99
    },
    {
        "title": "Mais Do Mesmo",
        "artistId": 99
    },
    {
        "title": "Greatest Hits",
        "artistId": 100
    },
    {
        "title": "Lulu Santos - RCA 100 Anos De Música - Álbum 01",
        "artistId": 101
    },
    {
        "title": "Lulu Santos - RCA 100 Anos De Música - Álbum 02",
        "artistId": 101
    },
    {
        "title": "Misplaced Childhood",
        "artistId": 102
    },
    {
        "title": "Barulhinho Bom",
        "artistId": 103
    },
    {
        "title": "Seek And Shall Find: More Of The Best (1963-1981)",
        "artistId": 104
    },
    {
        "title": "The Best Of Men At Work",
        "artistId": 105
    },
    {
        "title": "Black Album",
        "artistId": 50
    },
    {
        "title": "Garage Inc. (Disc 2)",
        "artistId": 50
    },
    {
        "title": "Kill 'Em All",
        "artistId": 50
    },
    {
        "title": "Load",
        "artistId": 50
    },
    {
        "title": "Master Of Puppets",
        "artistId": 50
    },
    {
        "title": "ReLoad",
        "artistId": 50
    },
    {
        "title": "Ride The Lightning",
        "artistId": 50
    },
    {
        "title": "St. Anger",
        "artistId": 50
    },
    {
        "title": "...And Justice For All",
        "artistId": 50
    },
    {
        "title": "Miles Ahead",
        "artistId": 68
    },
    {
        "title": "Milton Nascimento Ao Vivo",
        "artistId": 42
    },
    {
        "title": "Minas",
        "artistId": 42
    },
    {
        "title": "Ace Of Spades",
        "artistId": 106
    },
    {
        "title": "Demorou...",
        "artistId": 108
    },
    {
        "title": "Motley Crue Greatest Hits",
        "artistId": 109
    },
    {
        "title": "From The Muddy Banks Of The Wishkah [Live]",
        "artistId": 110
    },
    {
        "title": "Nevermind",
        "artistId": 110
    },
    {
        "title": "Compositores",
        "artistId": 111
    },
    {
        "title": "Olodum",
        "artistId": 112
    },
    {
        "title": "Acústico MTV",
        "artistId": 113
    },
    {
        "title": "Arquivo II",
        "artistId": 113
    },
    {
        "title": "Arquivo Os Paralamas Do Sucesso",
        "artistId": 113
    },
    {
        "title": "Bark at the Moon (Remastered)",
        "artistId": 114
    },
    {
        "title": "Blizzard of Ozz",
        "artistId": 114
    },
    {
        "title": "Diary of a Madman (Remastered)",
        "artistId": 114
    },
    {
        "title": "No More Tears (Remastered)",
        "artistId": 114
    },
    {
        "title": "Tribute",
        "artistId": 114
    },
    {
        "title": "Walking Into Clarksdale",
        "artistId": 115
    },
    {
        "title": "Original Soundtracks 1",
        "artistId": 116
    },
    {
        "title": "The Beast Live",
        "artistId": 117
    },
    {
        "title": "Live On Two Legs [Live]",
        "artistId": 118
    },
    {
        "title": "Pearl Jam",
        "artistId": 118
    },
    {
        "title": "Riot Act",
        "artistId": 118
    },
    {
        "title": "Ten",
        "artistId": 118
    },
    {
        "title": "Vs.",
        "artistId": 118
    },
    {
        "title": "Dark Side Of The Moon",
        "artistId": 120
    },
    {
        "title": "Os Cães Ladram Mas A Caravana Não Pára",
        "artistId": 121
    },
    {
        "title": "Greatest Hits I",
        "artistId": 51
    },
    {
        "title": "News Of The World",
        "artistId": 51
    },
    {
        "title": "Out Of Time",
        "artistId": 122
    },
    {
        "title": "Green",
        "artistId": 124
    },
    {
        "title": "New Adventures In Hi-Fi",
        "artistId": 124
    },
    {
        "title": "The Best Of R.E.M.: The IRS Years",
        "artistId": 124
    },
    {
        "title": "Cesta Básica",
        "artistId": 125
    },
    {
        "title": "Raul Seixas",
        "artistId": 126
    },
    {
        "title": "Blood Sugar Sex Magik",
        "artistId": 127
    },
    {
        "title": "By The Way",
        "artistId": 127
    },
    {
        "title": "Californication",
        "artistId": 127
    },
    {
        "title": "Retrospective I (1974-1980)",
        "artistId": 128
    },
    {
        "title": "Santana - As Years Go By",
        "artistId": 59
    },
    {
        "title": "Santana Live",
        "artistId": 59
    },
    {
        "title": "Maquinarama",
        "artistId": 130
    },
    {
        "title": "O Samba Poconé",
        "artistId": 130
    },
    {
        "title": "Judas 0: B-Sides and Rarities",
        "artistId": 131
    },
    {
        "title": "Rotten Apples: Greatest Hits",
        "artistId": 131
    },
    {
        "title": "A-Sides",
        "artistId": 132
    },
    {
        "title": "Morning Dance",
        "artistId": 53
    },
    {
        "title": "In Step",
        "artistId": 133
    },
    {
        "title": "Core",
        "artistId": 134
    },
    {
        "title": "Mezmerize",
        "artistId": 135
    },
    {
        "title": "[1997] Black Light Syndrome",
        "artistId": 136
    },
    {
        "title": "Live [Disc 1]",
        "artistId": 137
    },
    {
        "title": "Live [Disc 2]",
        "artistId": 137
    },
    {
        "title": "The Singles",
        "artistId": 138
    },
    {
        "title": "Beyond Good And Evil",
        "artistId": 139
    },
    {
        "title": "Pure Cult: The Best Of The Cult (For Rockers, Ravers, Lovers & Sinners) [UK]",
        "artistId": 139
    },
    {
        "title": "The Doors",
        "artistId": 140
    },
    {
        "title": "The Police Greatest Hits",
        "artistId": 141
    },
    {
        "title": "Hot Rocks, 1964-1971 (Disc 1)",
        "artistId": 142
    },
    {
        "title": "No Security",
        "artistId": 142
    },
    {
        "title": "Voodoo Lounge",
        "artistId": 142
    },
    {
        "title": "Tangents",
        "artistId": 143
    },
    {
        "title": "Transmission",
        "artistId": 143
    },
    {
        "title": "My Generation - The Very Best Of The Who",
        "artistId": 144
    },
    {
        "title": "Serie Sem Limite (Disc 1)",
        "artistId": 145
    },
    {
        "title": "Serie Sem Limite (Disc 2)",
        "artistId": 145
    },
    {
        "title": "Acústico",
        "artistId": 146
    },
    {
        "title": "Volume Dois",
        "artistId": 146
    },
    {
        "title": "Battlestar Galactica: The Story So Far",
        "artistId": 147
    },
    {
        "title": "Battlestar Galactica, Season 3",
        "artistId": 147
    },
    {
        "title": "Heroes, Season 1",
        "artistId": 148
    },
    {
        "title": "Lost, Season 3",
        "artistId": 149
    },
    {
        "title": "Lost, Season 1",
        "artistId": 149
    },
    {
        "title": "Lost, Season 2",
        "artistId": 149
    },
    {
        "title": "Achtung Baby",
        "artistId": 150
    },
    {
        "title": "All That You Can't Leave Behind",
        "artistId": 150
    },
    {
        "title": "B-Sides 1980-1990",
        "artistId": 150
    },
    {
        "title": "How To Dismantle An Atomic Bomb",
        "artistId": 150
    },
    {
        "title": "Pop",
        "artistId": 150
    },
    {
        "title": "Rattle And Hum",
        "artistId": 150
    },
    {
        "title": "The Best Of 1980-1990",
        "artistId": 150
    },
    {
        "title": "War",
        "artistId": 150
    },
    {
        "title": "Zooropa",
        "artistId": 150
    },
    {
        "title": "UB40 The Best Of - Volume Two [UK]",
        "artistId": 151
    },
    {
        "title": "Diver Down",
        "artistId": 152
    },
    {
        "title": "The Best Of Van Halen, Vol. I",
        "artistId": 152
    },
    {
        "title": "Van Halen",
        "artistId": 152
    },
    {
        "title": "Van Halen III",
        "artistId": 152
    },
    {
        "title": "Contraband",
        "artistId": 153
    },
    {
        "title": "Vinicius De Moraes",
        "artistId": 72
    },
    {
        "title": "Ao Vivo [IMPORT]",
        "artistId": 155
    },
    {
        "title": "The Office, Season 1",
        "artistId": 156
    },
    {
        "title": "The Office, Season 2",
        "artistId": 156
    },
    {
        "title": "The Office, Season 3",
        "artistId": 156
    },
    {
        "title": "Un-Led-Ed",
        "artistId": 157
    },
    {
        "title": "Battlestar Galactica (Classic), Season 1",
        "artistId": 158
    },
    {
        "title": "Aquaman",
        "artistId": 159
    },
    {
        "title": "Instant Karma: The Amnesty International Campaign to Save Darfur",
        "artistId": 150
    },
    {
        "title": "Speak of the Devil",
        "artistId": 114
    },
    {
        "title": "20th Century Masters - The Millennium Collection: The Best of Scorpions",
        "artistId": 179
    },
    {
        "title": "House of Pain",
        "artistId": 180
    },
    {
        "title": "Radio Brasil (O Som da Jovem Vanguarda) - Seleccao de Henrique Amaro",
        "artistId": 36
    },
    {
        "title": "Cake: B-Sides and Rarities",
        "artistId": 196
    },
    {
        "title": "LOST, Season 4",
        "artistId": 149
    },
    {
        "title": "Quiet Songs",
        "artistId": 197
    },
    {
        "title": "Muso Ko",
        "artistId": 198
    },
    {
        "title": "Realize",
        "artistId": 199
    },
    {
        "title": "Every Kind of Light",
        "artistId": 200
    },
    {
        "title": "Duos II",
        "artistId": 201
    },
    {
        "title": "Worlds",
        "artistId": 202
    },
    {
        "title": "The Best of Beethoven",
        "artistId": 203
    },
    {
        "title": "Temple of the Dog",
        "artistId": 204
    },
    {
        "title": "Carry On",
        "artistId": 205
    },
    {
        "title": "Revelations",
        "artistId": 8
    },
    {
        "title": "Adorate Deum: Gregorian Chant from the Proper of the Mass",
        "artistId": 206
    },
    {
        "title": "Allegri: Miserere",
        "artistId": 207
    },
    {
        "title": "Pachelbel: Canon & Gigue",
        "artistId": 208
    },
    {
        "title": "Vivaldi: The Four Seasons",
        "artistId": 209
    },
    {
        "title": "Bach: Violin Concertos",
        "artistId": 210
    },
    {
        "title": "Bach: Goldberg Variations",
        "artistId": 211
    },
    {
        "title": "Bach: The Cello Suites",
        "artistId": 212
    },
    {
        "title": "Handel: The Messiah (Highlights)",
        "artistId": 213
    },
    {
        "title": "The World of Classical Favourites",
        "artistId": 214
    },
    {
        "title": "Sir Neville Marriner: A Celebration",
        "artistId": 215
    },
    {
        "title": "Mozart: Wind Concertos",
        "artistId": 216
    },
    {
        "title": "Haydn: Symphonies 99 - 104",
        "artistId": 217
    },
    {
        "title": "Beethoven: Symhonies Nos. 5 & 6",
        "artistId": 218
    },
    {
        "title": "A Soprano Inspired",
        "artistId": 219
    },
    {
        "title": "Great Opera Choruses",
        "artistId": 220
    },
    {
        "title": "Wagner: Favourite Overtures",
        "artistId": 221
    },
    {
        "title": "Fauré: Requiem, Ravel: Pavane & Others",
        "artistId": 222
    },
    {
        "title": "Tchaikovsky: The Nutcracker",
        "artistId": 223
    },
    {
        "title": "The Last Night of the Proms",
        "artistId": 224
    },
    {
        "title": "Puccini: Madama Butterfly - Highlights",
        "artistId": 225
    },
    {
        "title": "Holst: The Planets, Op. 32 & Vaughan Williams: Fantasies",
        "artistId": 226
    },
    {
        "title": "Pavarotti's Opera Made Easy",
        "artistId": 227
    },
    {
        "title": "Great Performances - Barber's Adagio and Other Romantic Favorites for Strings",
        "artistId": 228
    },
    {
        "title": "Carmina Burana",
        "artistId": 229
    },
    {
        "title": "A Copland Celebration, Vol. I",
        "artistId": 230
    },
    {
        "title": "Bach: Toccata & Fugue in D Minor",
        "artistId": 231
    },
    {
        "title": "Prokofiev: Symphony No.1",
        "artistId": 232
    },
    {
        "title": "Scheherazade",
        "artistId": 233
    },
    {
        "title": "Bach: The Brandenburg Concertos",
        "artistId": 234
    },
    {
        "title": "Chopin: Piano Concertos Nos. 1 & 2",
        "artistId": 235
    },
    {
        "title": "Mascagni: Cavalleria Rusticana",
        "artistId": 236
    },
    {
        "title": "Sibelius: Finlandia",
        "artistId": 237
    },
    {
        "title": "Beethoven Piano Sonatas: Moonlight & Pastorale",
        "artistId": 238
    },
    {
        "title": "Great Recordings of the Century - Mahler: Das Lied von der Erde",
        "artistId": 240
    },
    {
        "title": "Elgar: Cello Concerto & Vaughan Williams: Fantasias",
        "artistId": 241
    },
    {
        "title": "Adams, John: The Chairman Dances",
        "artistId": 242
    },
    {
        "title": "Tchaikovsky: 1812 Festival Overture, Op.49, Capriccio Italien & Beethoven: Wellington's Victory",
        "artistId": 243
    },
    {
        "title": "Palestrina: Missa Papae Marcelli & Allegri: Miserere",
        "artistId": 244
    },
    {
        "title": "Prokofiev: Romeo & Juliet",
        "artistId": 245
    },
    {
        "title": "Strauss: Waltzes",
        "artistId": 226
    },
    {
        "title": "Berlioz: Symphonie Fantastique",
        "artistId": 245
    },
    {
        "title": "Bizet: Carmen Highlights",
        "artistId": 246
    },
    {
        "title": "English Renaissance",
        "artistId": 247
    },
    {
        "title": "Handel: Music for the Royal Fireworks (Original Version 1749)",
        "artistId": 208
    },
    {
        "title": "Grieg: Peer Gynt Suites & Sibelius: Pelléas et Mélisande",
        "artistId": 248
    },
    {
        "title": "Mozart Gala: Famous Arias",
        "artistId": 249
    },
    {
        "title": "SCRIABIN: Vers la flamme",
        "artistId": 250
    },
    {
        "title": "Armada: Music from the Courts of England and Spain",
        "artistId": 251
    },
    {
        "title": "Mozart: Symphonies Nos. 40 & 41",
        "artistId": 248
    },
    {
        "title": "Back to Black",
        "artistId": 252
    },
    {
        "title": "Frank",
        "artistId": 252
    },
    {
        "title": "Carried to Dust (Bonus Track Version)",
        "artistId": 253
    },
    {
        "title": "Beethoven: Symphony No. 6 'Pastoral' Etc.",
        "artistId": 254
    },
    {
        "title": "Bartok: Violin & Viola Concertos",
        "artistId": 255
    },
    {
        "title": "Mendelssohn: A Midsummer Night's Dream",
        "artistId": 256
    },
    {
        "title": "Bach: Orchestral Suites Nos. 1 - 4",
        "artistId": 257
    },
    {
        "title": "Charpentier: Divertissements, Airs & Concerts",
        "artistId": 258
    },
    {
        "title": "South American Getaway",
        "artistId": 259
    },
    {
        "title": "Górecki: Symphony No. 3",
        "artistId": 260
    },
    {
        "title": "Purcell: The Fairy Queen",
        "artistId": 261
    },
    {
        "title": "The Ultimate Relexation Album",
        "artistId": 262
    },
    {
        "title": "Purcell: Music for the Queen Mary",
        "artistId": 263
    },
    {
        "title": "Weill: The Seven Deadly Sins",
        "artistId": 264
    },
    {
        "title": "J.S. Bach: Chaconne, Suite in E Minor, Partita in E Major & Prelude, Fugue and Allegro",
        "artistId": 265
    },
    {
        "title": "Prokofiev: Symphony No.5 & Stravinksy: Le Sacre Du Printemps",
        "artistId": 248
    },
    {
        "title": "Szymanowski: Piano Works, Vol. 1",
        "artistId": 266
    },
    {
        "title": "Nielsen: The Six Symphonies",
        "artistId": 267
    },
    {
        "title": "Great Recordings of the Century: Paganini's 24 Caprices",
        "artistId": 268
    },
    {
        "title": "Liszt - 12 Études D'Execution Transcendante",
        "artistId": 269
    },
    {
        "title": "Great Recordings of the Century - Shubert: Schwanengesang, 4 Lieder",
        "artistId": 270
    },
    {
        "title": "Locatelli: Concertos for Violin, Strings and Continuo, Vol. 3",
        "artistId": 271
    },
    {
        "title": "Respighi:Pines of Rome",
        "artistId": 226
    },
    {
        "title": "Schubert: The Late String Quartets & String Quintet (3 CD's)",
        "artistId": 272
    },
    {
        "title": "Monteverdi: L'Orfeo",
        "artistId": 273
    },
    {
        "title": "Mozart: Chamber Music",
        "artistId": 274
    },
    {
        "title": "Koyaanisqatsi (Soundtrack from the Motion Picture)",
        "artistId": 275
    }
]
''';
final albums = (jsonDecode(_jsonAlbums) as List).map(
  (e) => Album.fromJsonDB(e),
);
