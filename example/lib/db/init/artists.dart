// spell: disable
import 'dart:convert';

import 'package:example/models/artist.dart';

const _jsonArtists = '''
[
    {
        "name": "AC/DC"
    },
    {
        "name": "Accept"
    },
    {
        "name": "Aerosmith"
    },
    {
        "name": "Alanis Morissette"
    },
    {
        "name": "Alice In Chains"
    },
    {
        "name": "Antônio Carlos Jobim"
    },
    {
        "name": "Apocalyptica"
    },
    {
        "name": "Audioslave"
    },
    {
        "name": "BackBeat"
    },
    {
        "name": "Billy Cobham"
    },
    {
        "name": "Black Label Society"
    },
    {
        "name": "Black Sabbath"
    },
    {
        "name": "Body Count"
    },
    {
        "name": "Bruce Dickinson"
    },
    {
        "name": "Buddy Guy"
    },
    {
        "name": "Caetano Veloso"
    },
    {
        "name": "Chico Buarque"
    },
    {
        "name": "Chico Science & Nação Zumbi"
    },
    {
        "name": "Cidade Negra"
    },
    {
        "name": "Cláudio Zoli"
    },
    {
        "name": "Various Artists"
    },
    {
        "name": "Led Zeppelin"
    },
    {
        "name": "Frank Zappa & Captain Beefheart"
    },
    {
        "name": "Marcos Valle"
    },
    {
        "name": "Milton Nascimento & Bebeto"
    },
    {
        "name": "Azymuth"
    },
    {
        "name": "Gilberto Gil"
    },
    {
        "name": "João Gilberto"
    },
    {
        "name": "Bebel Gilberto"
    },
    {
        "name": "Jorge Vercilo"
    },
    {
        "name": "Baby Consuelo"
    },
    {
        "name": "Ney Matogrosso"
    },
    {
        "name": "Luiz Melodia"
    },
    {
        "name": "Nando Reis"
    },
    {
        "name": "Pedro Luís & A Parede"
    },
    {
        "name": "O Rappa"
    },
    {
        "name": "Ed Motta"
    },
    {
        "name": "Banda Black Rio"
    },
    {
        "name": "Fernanda Porto"
    },
    {
        "name": "Os Cariocas"
    },
    {
        "name": "Elis Regina"
    },
    {
        "name": "Milton Nascimento"
    },
    {
        "name": "A Cor Do Som"
    },
    {
        "name": "Kid Abelha"
    },
    {
        "name": "Sandra De Sá"
    },
    {
        "name": "Jorge Ben"
    },
    {
        "name": "Hermeto Pascoal"
    },
    {
        "name": "Barão Vermelho"
    },
    {
        "name": "Edson, DJ Marky & DJ Patife Featuring Fernanda Porto"
    },
    {
        "name": "Metallica"
    },
    {
        "name": "Queen"
    },
    {
        "name": "Kiss"
    },
    {
        "name": "Spyro Gyra"
    },
    {
        "name": "Green Day"
    },
    {
        "name": "David Coverdale"
    },
    {
        "name": "Gonzaguinha"
    },
    {
        "name": "Os Mutantes"
    },
    {
        "name": "Deep Purple"
    },
    {
        "name": "Santana"
    },
    {
        "name": "Santana Feat. Dave Matthews"
    },
    {
        "name": "Santana Feat. Everlast"
    },
    {
        "name": "Santana Feat. Rob Thomas"
    },
    {
        "name": "Santana Feat. Lauryn Hill & Cee-Lo"
    },
    {
        "name": "Santana Feat. The Project G&B"
    },
    {
        "name": "Santana Feat. Maná"
    },
    {
        "name": "Santana Feat. Eagle-Eye Cherry"
    },
    {
        "name": "Santana Feat. Eric Clapton"
    },
    {
        "name": "Miles Davis"
    },
    {
        "name": "Gene Krupa"
    },
    {
        "name": "Toquinho & Vinícius"
    },
    {
        "name": "Vinícius De Moraes & Baden Powell"
    },
    {
        "name": "Vinícius De Moraes"
    },
    {
        "name": "Vinícius E Qurteto Em Cy"
    },
    {
        "name": "Vinícius E Odette Lara"
    },
    {
        "name": "Vinicius, Toquinho & Quarteto Em Cy"
    },
    {
        "name": "Creedence Clearwater Revival"
    },
    {
        "name": "Cássia Eller"
    },
    {
        "name": "Def Leppard"
    },
    {
        "name": "Dennis Chambers"
    },
    {
        "name": "Djavan"
    },
    {
        "name": "Eric Clapton"
    },
    {
        "name": "Faith No More"
    },
    {
        "name": "Falamansa"
    },
    {
        "name": "Foo Fighters"
    },
    {
        "name": "Frank Sinatra"
    },
    {
        "name": "Funk Como Le Gusta"
    },
    {
        "name": "Godsmack"
    },
    {
        "name": "Guns N' Roses"
    },
    {
        "name": "Incognito"
    },
    {
        "name": "Iron Maiden"
    },
    {
        "name": "James Brown"
    },
    {
        "name": "Jamiroquai"
    },
    {
        "name": "JET"
    },
    {
        "name": "Jimi Hendrix"
    },
    {
        "name": "Joe Satriani"
    },
    {
        "name": "Jota Quest"
    },
    {
        "name": "João Suplicy"
    },
    {
        "name": "Judas Priest"
    },
    {
        "name": "Legião Urbana"
    },
    {
        "name": "Lenny Kravitz"
    },
    {
        "name": "Lulu Santos"
    },
    {
        "name": "Marillion"
    },
    {
        "name": "Marisa Monte"
    },
    {
        "name": "Marvin Gaye"
    },
    {
        "name": "Men At Work"
    },
    {
        "name": "Motörhead"
    },
    {
        "name": "Motörhead & Girlschool"
    },
    {
        "name": "Mônica Marianno"
    },
    {
        "name": "Mötley Crüe"
    },
    {
        "name": "Nirvana"
    },
    {
        "name": "O Terço"
    },
    {
        "name": "Olodum"
    },
    {
        "name": "Os Paralamas Do Sucesso"
    },
    {
        "name": "Ozzy Osbourne"
    },
    {
        "name": "Page & Plant"
    },
    {
        "name": "Passengers"
    },
    {
        "name": "Paul D'Ianno"
    },
    {
        "name": "Pearl Jam"
    },
    {
        "name": "Peter Tosh"
    },
    {
        "name": "Pink Floyd"
    },
    {
        "name": "Planet Hemp"
    },
    {
        "name": "R.E.M. Feat. Kate Pearson"
    },
    {
        "name": "R.E.M. Feat. KRS-One"
    },
    {
        "name": "R.E.M."
    },
    {
        "name": "Raimundos"
    },
    {
        "name": "Raul Seixas"
    },
    {
        "name": "Red Hot Chili Peppers"
    },
    {
        "name": "Rush"
    },
    {
        "name": "Simply Red"
    },
    {
        "name": "Skank"
    },
    {
        "name": "Smashing Pumpkins"
    },
    {
        "name": "Soundgarden"
    },
    {
        "name": "Stevie Ray Vaughan & Double Trouble"
    },
    {
        "name": "Stone Temple Pilots"
    },
    {
        "name": "System Of A Down"
    },
    {
        "name": "Terry Bozzio, Tony Levin & Steve Stevens"
    },
    {
        "name": "The Black Crowes"
    },
    {
        "name": "The Clash"
    },
    {
        "name": "The Cult"
    },
    {
        "name": "The Doors"
    },
    {
        "name": "The Police"
    },
    {
        "name": "The Rolling Stones"
    },
    {
        "name": "The Tea Party"
    },
    {
        "name": "The Who"
    },
    {
        "name": "Tim Maia"
    },
    {
        "name": "Titãs"
    },
    {
        "name": "Battlestar Galactica"
    },
    {
        "name": "Heroes"
    },
    {
        "name": "Lost"
    },
    {
        "name": "U2"
    },
    {
        "name": "UB40"
    },
    {
        "name": "Van Halen"
    },
    {
        "name": "Velvet Revolver"
    },
    {
        "name": "Whitesnake"
    },
    {
        "name": "Zeca Pagodinho"
    },
    {
        "name": "The Office"
    },
    {
        "name": "Dread Zeppelin"
    },
    {
        "name": "Battlestar Galactica (Classic)"
    },
    {
        "name": "Aquaman"
    },
    {
        "name": "Christina Aguilera featuring BigElf"
    },
    {
        "name": "Aerosmith & Sierra Leone's Refugee Allstars"
    },
    {
        "name": "Los Lonely Boys"
    },
    {
        "name": "Corinne Bailey Rae"
    },
    {
        "name": "Dhani Harrison & Jakob Dylan"
    },
    {
        "name": "Jackson Browne"
    },
    {
        "name": "Avril Lavigne"
    },
    {
        "name": "Big & Rich"
    },
    {
        "name": "Youssou N'Dour"
    },
    {
        "name": "Black Eyed Peas"
    },
    {
        "name": "Jack Johnson"
    },
    {
        "name": "Ben Harper"
    },
    {
        "name": "Snow Patrol"
    },
    {
        "name": "Matisyahu"
    },
    {
        "name": "The Postal Service"
    },
    {
        "name": "Jaguares"
    },
    {
        "name": "The Flaming Lips"
    },
    {
        "name": "Jack's Mannequin & Mick Fleetwood"
    },
    {
        "name": "Regina Spektor"
    },
    {
        "name": "Scorpions"
    },
    {
        "name": "House Of Pain"
    },
    {
        "name": "Xis"
    },
    {
        "name": "Nega Gizza"
    },
    {
        "name": "Gustavo & Andres Veiga & Salazar"
    },
    {
        "name": "Rodox"
    },
    {
        "name": "Charlie Brown Jr."
    },
    {
        "name": "Pedro Luís E A Parede"
    },
    {
        "name": "Los Hermanos"
    },
    {
        "name": "Mundo Livre S/A"
    },
    {
        "name": "Otto"
    },
    {
        "name": "Instituto"
    },
    {
        "name": "Nação Zumbi"
    },
    {
        "name": "DJ Dolores & Orchestra Santa Massa"
    },
    {
        "name": "Seu Jorge"
    },
    {
        "name": "Sabotage E Instituto"
    },
    {
        "name": "Stereo Maracana"
    },
    {
        "name": "Cake"
    },
    {
        "name": "Aisha Duo"
    },
    {
        "name": "Habib Koité and Bamada"
    },
    {
        "name": "Karsh Kale"
    },
    {
        "name": "The Posies"
    },
    {
        "name": "Luciana Souza/Romero Lubambo"
    },
    {
        "name": "Aaron Goldberg"
    },
    {
        "name": "Nicolaus Esterhazy Sinfonia"
    },
    {
        "name": "Temple of the Dog"
    },
    {
        "name": "Chris Cornell"
    },
    {
        "name": "Alberto Turco & Nova Schola Gregoriana"
    },
    {
        "name": "Richard Marlow & The Choir of Trinity College, Cambridge"
    },
    {
        "name": "English Concert & Trevor Pinnock"
    },
    {
        "name": "Anne-Sophie Mutter, Herbert Von Karajan & Wiener Philharmoniker"
    },
    {
        "name": "Hilary Hahn, Jeffrey Kahane, Los Angeles Chamber Orchestra & Margaret Batjer"
    },
    {
        "name": "Wilhelm Kempff"
    },
    {
        "name": "Yo-Yo Ma"
    },
    {
        "name": "Scholars Baroque Ensemble"
    },
    {
        "name": "Academy of St. Martin in the Fields & Sir Neville Marriner"
    },
    {
        "name": "Academy of St. Martin in the Fields Chamber Ensemble & Sir Neville Marriner"
    },
    {
        "name": "Berliner Philharmoniker, Claudio Abbado & Sabine Meyer"
    },
    {
        "name": "Royal Philharmonic Orchestra & Sir Thomas Beecham"
    },
    {
        "name": "Orchestre Révolutionnaire et Romantique & John Eliot Gardiner"
    },
    {
        "name": "Britten Sinfonia, Ivor Bolton & Lesley Garrett"
    },
    {
        "name": "Chicago Symphony Chorus, Chicago Symphony Orchestra & Sir Georg Solti"
    },
    {
        "name": "Sir Georg Solti & Wiener Philharmoniker"
    },
    {
        "name": "Academy of St. Martin in the Fields, John Birch, Sir Neville Marriner & Sylvia McNair"
    },
    {
        "name": "London Symphony Orchestra & Sir Charles Mackerras"
    },
    {
        "name": "Barry Wordsworth & BBC Concert Orchestra"
    },
    {
        "name": "Herbert Von Karajan, Mirella Freni & Wiener Philharmoniker"
    },
    {
        "name": "Eugene Ormandy"
    },
    {
        "name": "Luciano Pavarotti"
    },
    {
        "name": "Leonard Bernstein & New York Philharmonic"
    },
    {
        "name": "Boston Symphony Orchestra & Seiji Ozawa"
    },
    {
        "name": "Aaron Copland & London Symphony Orchestra"
    },
    {
        "name": "Ton Koopman"
    },
    {
        "name": "Sergei Prokofiev & Yuri Temirkanov"
    },
    {
        "name": "Chicago Symphony Orchestra & Fritz Reiner"
    },
    {
        "name": "Orchestra of The Age of Enlightenment"
    },
    {
        "name": "Emanuel Ax, Eugene Ormandy & Philadelphia Orchestra"
    },
    {
        "name": "James Levine"
    },
    {
        "name": "Berliner Philharmoniker & Hans Rosbaud"
    },
    {
        "name": "Maurizio Pollini"
    },
    {
        "name": "Academy of St. Martin in the Fields, Sir Neville Marriner & William Bennett"
    },
    {
        "name": "Gustav Mahler"
    },
    {
        "name": "Felix Schmidt, London Symphony Orchestra & Rafael Frühbeck de Burgos"
    },
    {
        "name": "Edo de Waart & San Francisco Symphony"
    },
    {
        "name": "Antal Doráti & London Symphony Orchestra"
    },
    {
        "name": "Choir Of Westminster Abbey & Simon Preston"
    },
    {
        "name": "Michael Tilson Thomas & San Francisco Symphony"
    },
    {
        "name": "Chor der Wiener Staatsoper, Herbert Von Karajan & Wiener Philharmoniker"
    },
    {
        "name": "The King's Singers"
    },
    {
        "name": "Berliner Philharmoniker & Herbert Von Karajan"
    },
    {
        "name": "Sir Georg Solti, Sumi Jo & Wiener Philharmoniker"
    },
    {
        "name": "Christopher O'Riley"
    },
    {
        "name": "Fretwork"
    },
    {
        "name": "Amy Winehouse"
    },
    {
        "name": "Calexico"
    },
    {
        "name": "Otto Klemperer & Philharmonia Orchestra"
    },
    {
        "name": "Yehudi Menuhin"
    },
    {
        "name": "Philharmonia Orchestra & Sir Neville Marriner"
    },
    {
        "name": "Academy of St. Martin in the Fields, Sir Neville Marriner & Thurston Dart"
    },
    {
        "name": "Les Arts Florissants & William Christie"
    },
    {
        "name": "The 12 Cellists of The Berlin Philharmonic"
    },
    {
        "name": "Adrian Leaper & Doreen de Feis"
    },
    {
        "name": "Roger Norrington, London Classical Players"
    },
    {
        "name": "Charles Dutoit & L'Orchestre Symphonique de Montréal"
    },
    {
        "name": "Equale Brass Ensemble, John Eliot Gardiner & Munich Monteverdi Orchestra and Choir"
    },
    {
        "name": "Kent Nagano and Orchestre de l'Opéra de Lyon"
    },
    {
        "name": "Julian Bream"
    },
    {
        "name": "Martin Roscoe"
    },
    {
        "name": "Göteborgs Symfoniker & Neeme Järvi"
    },
    {
        "name": "Itzhak Perlman"
    },
    {
        "name": "Michele Campanella"
    },
    {
        "name": "Gerald Moore"
    },
    {
        "name": "Mela Tenenbaum, Pro Musica Prague & Richard Kapp"
    },
    {
        "name": "Emerson String Quartet"
    },
    {
        "name": "C. Monteverdi, Nigel Rogers - Chiaroscuro; London Baroque; London Cornett & Sackbu"
    },
    {
        "name": "Nash Ensemble"
    },
    {
        "name": "Philip Glass Ensemble"
    }
]
''';
final artists = (jsonDecode(_jsonArtists) as List).map(
  (e) => Artist.fromJsonDB(e),
);
