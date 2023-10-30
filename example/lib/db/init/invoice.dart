// spell: disable

import 'dart:convert';

import 'package:example/models/invoice.dart';

const _jsonInvoices = '''
[
    {
        "customerId": 2,
        "invoiceDate": "2009/01/01 00:00:00",
        "billingAddress": "Theodor-Heuss-Straße 34",
        "billingCity": "Stuttgart",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "70174",
        "total": 1.98
    },
    {
        "customerId": 4,
        "invoiceDate": "2009/01/02 00:00:00",
        "billingAddress": "Ullevålsveien 14",
        "billingCity": "Oslo",
        "billingState": null,
        "billingCountry": "Norway",
        "billingPostalCode": "0171",
        "total": 3.96
    },
    {
        "customerId": 8,
        "invoiceDate": "2009/01/03 00:00:00",
        "billingAddress": "Grétrystraat 63",
        "billingCity": "Brussels",
        "billingState": null,
        "billingCountry": "Belgium",
        "billingPostalCode": "1000",
        "total": 5.94
    },
    {
        "customerId": 14,
        "invoiceDate": "2009/01/06 00:00:00",
        "billingAddress": "8210 111 ST NW",
        "billingCity": "Edmonton",
        "billingState": "AB",
        "billingCountry": "Canada",
        "billingPostalCode": "T6G 2C7",
        "total": 8.91
    },
    {
        "customerId": 23,
        "invoiceDate": "2009/01/11 00:00:00",
        "billingAddress": "69 Salem Street",
        "billingCity": "Boston",
        "billingState": "MA",
        "billingCountry": "USA",
        "billingPostalCode": "2113",
        "total": 13.86
    },
    {
        "customerId": 37,
        "invoiceDate": "2009/01/19 00:00:00",
        "billingAddress": "Berger Straße 10",
        "billingCity": "Frankfurt",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "60316",
        "total": 0.99
    },
    {
        "customerId": 38,
        "invoiceDate": "2009/02/01 00:00:00",
        "billingAddress": "Barbarossastraße 19",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10779",
        "total": 1.98
    },
    {
        "customerId": 40,
        "invoiceDate": "2009/02/01 00:00:00",
        "billingAddress": "8, Rue Hanovre",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75002",
        "total": 1.98
    },
    {
        "customerId": 42,
        "invoiceDate": "2009/02/02 00:00:00",
        "billingAddress": "9, Place Louis Barthou",
        "billingCity": "Bordeaux",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "33000",
        "total": 3.96
    },
    {
        "customerId": 46,
        "invoiceDate": "2009/02/03 00:00:00",
        "billingAddress": "3 Chatham Street",
        "billingCity": "Dublin",
        "billingState": "Dublin",
        "billingCountry": "Ireland",
        "billingPostalCode": null,
        "total": 5.94
    },
    {
        "customerId": 52,
        "invoiceDate": "2009/02/06 00:00:00",
        "billingAddress": "202 Hoxton Street",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "N1 5LH",
        "total": 8.91
    },
    {
        "customerId": 2,
        "invoiceDate": "2009/02/11 00:00:00",
        "billingAddress": "Theodor-Heuss-Straße 34",
        "billingCity": "Stuttgart",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "70174",
        "total": 13.86
    },
    {
        "customerId": 16,
        "invoiceDate": "2009/02/19 00:00:00",
        "billingAddress": "1600 Amphitheatre Parkway",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94043-1351",
        "total": 0.99
    },
    {
        "customerId": 17,
        "invoiceDate": "2009/03/04 00:00:00",
        "billingAddress": "1 Microsoft Way",
        "billingCity": "Redmond",
        "billingState": "WA",
        "billingCountry": "USA",
        "billingPostalCode": "98052-8300",
        "total": 1.98
    },
    {
        "customerId": 19,
        "invoiceDate": "2009/03/04 00:00:00",
        "billingAddress": "1 Infinite Loop",
        "billingCity": "Cupertino",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "95014",
        "total": 1.98
    },
    {
        "customerId": 21,
        "invoiceDate": "2009/03/05 00:00:00",
        "billingAddress": "801 W 4th Street",
        "billingCity": "Reno",
        "billingState": "NV",
        "billingCountry": "USA",
        "billingPostalCode": "89503",
        "total": 3.96
    },
    {
        "customerId": 25,
        "invoiceDate": "2009/03/06 00:00:00",
        "billingAddress": "319 N. Frances Street",
        "billingCity": "Madison",
        "billingState": "WI",
        "billingCountry": "USA",
        "billingPostalCode": "53703",
        "total": 5.94
    },
    {
        "customerId": 31,
        "invoiceDate": "2009/03/09 00:00:00",
        "billingAddress": "194A Chain Lake Drive",
        "billingCity": "Halifax",
        "billingState": "NS",
        "billingCountry": "Canada",
        "billingPostalCode": "B3S 1C5",
        "total": 8.91
    },
    {
        "customerId": 40,
        "invoiceDate": "2009/03/14 00:00:00",
        "billingAddress": "8, Rue Hanovre",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75002",
        "total": 13.86
    },
    {
        "customerId": 54,
        "invoiceDate": "2009/03/22 00:00:00",
        "billingAddress": "110 Raeburn Pl",
        "billingCity": "Edinburgh ",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "EH4 1HH",
        "total": 0.99
    },
    {
        "customerId": 55,
        "invoiceDate": "2009/04/04 00:00:00",
        "billingAddress": "421 Bourke Street",
        "billingCity": "Sidney",
        "billingState": "NSW",
        "billingCountry": "Australia",
        "billingPostalCode": "2010",
        "total": 1.98
    },
    {
        "customerId": 57,
        "invoiceDate": "2009/04/04 00:00:00",
        "billingAddress": "Calle Lira, 198",
        "billingCity": "Santiago",
        "billingState": null,
        "billingCountry": "Chile",
        "billingPostalCode": null,
        "total": 1.98
    },
    {
        "customerId": 59,
        "invoiceDate": "2009/04/05 00:00:00",
        "billingAddress": "3,Raj Bhavan Road",
        "billingCity": "Bangalore",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "560001",
        "total": 3.96
    },
    {
        "customerId": 4,
        "invoiceDate": "2009/04/06 00:00:00",
        "billingAddress": "Ullevålsveien 14",
        "billingCity": "Oslo",
        "billingState": null,
        "billingCountry": "Norway",
        "billingPostalCode": "0171",
        "total": 5.94
    },
    {
        "customerId": 10,
        "invoiceDate": "2009/04/09 00:00:00",
        "billingAddress": "Rua Dr. Falcão Filho, 155",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01007-010",
        "total": 8.91
    },
    {
        "customerId": 19,
        "invoiceDate": "2009/04/14 00:00:00",
        "billingAddress": "1 Infinite Loop",
        "billingCity": "Cupertino",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "95014",
        "total": 13.86
    },
    {
        "customerId": 33,
        "invoiceDate": "2009/04/22 00:00:00",
        "billingAddress": "5112 48 Street",
        "billingCity": "Yellowknife",
        "billingState": "NT",
        "billingCountry": "Canada",
        "billingPostalCode": "X1A 1N6",
        "total": 0.99
    },
    {
        "customerId": 34,
        "invoiceDate": "2009/05/05 00:00:00",
        "billingAddress": "Rua da Assunção 53",
        "billingCity": "Lisbon",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 1.98
    },
    {
        "customerId": 36,
        "invoiceDate": "2009/05/05 00:00:00",
        "billingAddress": "Tauentzienstraße 8",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10789",
        "total": 1.98
    },
    {
        "customerId": 38,
        "invoiceDate": "2009/05/06 00:00:00",
        "billingAddress": "Barbarossastraße 19",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10779",
        "total": 3.96
    },
    {
        "customerId": 42,
        "invoiceDate": "2009/05/07 00:00:00",
        "billingAddress": "9, Place Louis Barthou",
        "billingCity": "Bordeaux",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "33000",
        "total": 5.94
    },
    {
        "customerId": 48,
        "invoiceDate": "2009/05/10 00:00:00",
        "billingAddress": "Lijnbaansgracht 120bg",
        "billingCity": "Amsterdam",
        "billingState": "VV",
        "billingCountry": "Netherlands",
        "billingPostalCode": "1016",
        "total": 8.91
    },
    {
        "customerId": 57,
        "invoiceDate": "2009/05/15 00:00:00",
        "billingAddress": "Calle Lira, 198",
        "billingCity": "Santiago",
        "billingState": null,
        "billingCountry": "Chile",
        "billingPostalCode": null,
        "total": 13.86
    },
    {
        "customerId": 12,
        "invoiceDate": "2009/05/23 00:00:00",
        "billingAddress": "Praça Pio X, 119",
        "billingCity": "Rio de Janeiro",
        "billingState": "RJ",
        "billingCountry": "Brazil",
        "billingPostalCode": "20040-020",
        "total": 0.99
    },
    {
        "customerId": 13,
        "invoiceDate": "2009/06/05 00:00:00",
        "billingAddress": "Qe 7 Bloco G",
        "billingCity": "Brasília",
        "billingState": "DF",
        "billingCountry": "Brazil",
        "billingPostalCode": "71020-677",
        "total": 1.98
    },
    {
        "customerId": 15,
        "invoiceDate": "2009/06/05 00:00:00",
        "billingAddress": "700 W Pender Street",
        "billingCity": "Vancouver",
        "billingState": "BC",
        "billingCountry": "Canada",
        "billingPostalCode": "V6C 1G8",
        "total": 1.98
    },
    {
        "customerId": 17,
        "invoiceDate": "2009/06/06 00:00:00",
        "billingAddress": "1 Microsoft Way",
        "billingCity": "Redmond",
        "billingState": "WA",
        "billingCountry": "USA",
        "billingPostalCode": "98052-8300",
        "total": 3.96
    },
    {
        "customerId": 21,
        "invoiceDate": "2009/06/07 00:00:00",
        "billingAddress": "801 W 4th Street",
        "billingCity": "Reno",
        "billingState": "NV",
        "billingCountry": "USA",
        "billingPostalCode": "89503",
        "total": 5.94
    },
    {
        "customerId": 27,
        "invoiceDate": "2009/06/10 00:00:00",
        "billingAddress": "1033 N Park Ave",
        "billingCity": "Tucson",
        "billingState": "AZ",
        "billingCountry": "USA",
        "billingPostalCode": "85719",
        "total": 8.91
    },
    {
        "customerId": 36,
        "invoiceDate": "2009/06/15 00:00:00",
        "billingAddress": "Tauentzienstraße 8",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10789",
        "total": 13.86
    },
    {
        "customerId": 50,
        "invoiceDate": "2009/06/23 00:00:00",
        "billingAddress": "C/ San Bernardo 85",
        "billingCity": "Madrid",
        "billingState": null,
        "billingCountry": "Spain",
        "billingPostalCode": "28015",
        "total": 0.99
    },
    {
        "customerId": 51,
        "invoiceDate": "2009/07/06 00:00:00",
        "billingAddress": "Celsiusg. 9",
        "billingCity": "Stockholm",
        "billingState": null,
        "billingCountry": "Sweden",
        "billingPostalCode": "11230",
        "total": 1.98
    },
    {
        "customerId": 53,
        "invoiceDate": "2009/07/06 00:00:00",
        "billingAddress": "113 Lupus St",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "SW1V 3EN",
        "total": 1.98
    },
    {
        "customerId": 55,
        "invoiceDate": "2009/07/07 00:00:00",
        "billingAddress": "421 Bourke Street",
        "billingCity": "Sidney",
        "billingState": "NSW",
        "billingCountry": "Australia",
        "billingPostalCode": "2010",
        "total": 3.96
    },
    {
        "customerId": 59,
        "invoiceDate": "2009/07/08 00:00:00",
        "billingAddress": "3,Raj Bhavan Road",
        "billingCity": "Bangalore",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "560001",
        "total": 5.94
    },
    {
        "customerId": 6,
        "invoiceDate": "2009/07/11 00:00:00",
        "billingAddress": "Rilská 3174/6",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14300",
        "total": 8.91
    },
    {
        "customerId": 15,
        "invoiceDate": "2009/07/16 00:00:00",
        "billingAddress": "700 W Pender Street",
        "billingCity": "Vancouver",
        "billingState": "BC",
        "billingCountry": "Canada",
        "billingPostalCode": "V6C 1G8",
        "total": 13.86
    },
    {
        "customerId": 29,
        "invoiceDate": "2009/07/24 00:00:00",
        "billingAddress": "796 Dundas Street West",
        "billingCity": "Toronto",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "M6J 1V1",
        "total": 0.99
    },
    {
        "customerId": 30,
        "invoiceDate": "2009/08/06 00:00:00",
        "billingAddress": "230 Elgin Street",
        "billingCity": "Ottawa",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "K2P 1L7",
        "total": 1.98
    },
    {
        "customerId": 32,
        "invoiceDate": "2009/08/06 00:00:00",
        "billingAddress": "696 Osborne Street",
        "billingCity": "Winnipeg",
        "billingState": "MB",
        "billingCountry": "Canada",
        "billingPostalCode": "R3L 2B9",
        "total": 1.98
    },
    {
        "customerId": 34,
        "invoiceDate": "2009/08/07 00:00:00",
        "billingAddress": "Rua da Assunção 53",
        "billingCity": "Lisbon",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 3.96
    },
    {
        "customerId": 38,
        "invoiceDate": "2009/08/08 00:00:00",
        "billingAddress": "Barbarossastraße 19",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10779",
        "total": 5.94
    },
    {
        "customerId": 44,
        "invoiceDate": "2009/08/11 00:00:00",
        "billingAddress": "Porthaninkatu 9",
        "billingCity": "Helsinki",
        "billingState": null,
        "billingCountry": "Finland",
        "billingPostalCode": "00530",
        "total": 8.91
    },
    {
        "customerId": 53,
        "invoiceDate": "2009/08/16 00:00:00",
        "billingAddress": "113 Lupus St",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "SW1V 3EN",
        "total": 13.86
    },
    {
        "customerId": 8,
        "invoiceDate": "2009/08/24 00:00:00",
        "billingAddress": "Grétrystraat 63",
        "billingCity": "Brussels",
        "billingState": null,
        "billingCountry": "Belgium",
        "billingPostalCode": "1000",
        "total": 0.99
    },
    {
        "customerId": 9,
        "invoiceDate": "2009/09/06 00:00:00",
        "billingAddress": "Sønder Boulevard 51",
        "billingCity": "Copenhagen",
        "billingState": null,
        "billingCountry": "Denmark",
        "billingPostalCode": "1720",
        "total": 1.98
    },
    {
        "customerId": 11,
        "invoiceDate": "2009/09/06 00:00:00",
        "billingAddress": "Av. Paulista, 2022",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01310-200",
        "total": 1.98
    },
    {
        "customerId": 13,
        "invoiceDate": "2009/09/07 00:00:00",
        "billingAddress": "Qe 7 Bloco G",
        "billingCity": "Brasília",
        "billingState": "DF",
        "billingCountry": "Brazil",
        "billingPostalCode": "71020-677",
        "total": 3.96
    },
    {
        "customerId": 17,
        "invoiceDate": "2009/09/08 00:00:00",
        "billingAddress": "1 Microsoft Way",
        "billingCity": "Redmond",
        "billingState": "WA",
        "billingCountry": "USA",
        "billingPostalCode": "98052-8300",
        "total": 5.94
    },
    {
        "customerId": 23,
        "invoiceDate": "2009/09/11 00:00:00",
        "billingAddress": "69 Salem Street",
        "billingCity": "Boston",
        "billingState": "MA",
        "billingCountry": "USA",
        "billingPostalCode": "2113",
        "total": 8.91
    },
    {
        "customerId": 32,
        "invoiceDate": "2009/09/16 00:00:00",
        "billingAddress": "696 Osborne Street",
        "billingCity": "Winnipeg",
        "billingState": "MB",
        "billingCountry": "Canada",
        "billingPostalCode": "R3L 2B9",
        "total": 13.86
    },
    {
        "customerId": 46,
        "invoiceDate": "2009/09/24 00:00:00",
        "billingAddress": "3 Chatham Street",
        "billingCity": "Dublin",
        "billingState": "Dublin",
        "billingCountry": "Ireland",
        "billingPostalCode": null,
        "total": 0.99
    },
    {
        "customerId": 47,
        "invoiceDate": "2009/10/07 00:00:00",
        "billingAddress": "Via Degli Scipioni, 43",
        "billingCity": "Rome",
        "billingState": "RM",
        "billingCountry": "Italy",
        "billingPostalCode": "00192",
        "total": 1.98
    },
    {
        "customerId": 49,
        "invoiceDate": "2009/10/07 00:00:00",
        "billingAddress": "Ordynacka 10",
        "billingCity": "Warsaw",
        "billingState": null,
        "billingCountry": "Poland",
        "billingPostalCode": "00-358",
        "total": 1.98
    },
    {
        "customerId": 51,
        "invoiceDate": "2009/10/08 00:00:00",
        "billingAddress": "Celsiusg. 9",
        "billingCity": "Stockholm",
        "billingState": null,
        "billingCountry": "Sweden",
        "billingPostalCode": "11230",
        "total": 3.96
    },
    {
        "customerId": 55,
        "invoiceDate": "2009/10/09 00:00:00",
        "billingAddress": "421 Bourke Street",
        "billingCity": "Sidney",
        "billingState": "NSW",
        "billingCountry": "Australia",
        "billingPostalCode": "2010",
        "total": 5.94
    },
    {
        "customerId": 2,
        "invoiceDate": "2009/10/12 00:00:00",
        "billingAddress": "Theodor-Heuss-Straße 34",
        "billingCity": "Stuttgart",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "70174",
        "total": 8.91
    },
    {
        "customerId": 11,
        "invoiceDate": "2009/10/17 00:00:00",
        "billingAddress": "Av. Paulista, 2022",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01310-200",
        "total": 13.86
    },
    {
        "customerId": 25,
        "invoiceDate": "2009/10/25 00:00:00",
        "billingAddress": "319 N. Frances Street",
        "billingCity": "Madison",
        "billingState": "WI",
        "billingCountry": "USA",
        "billingPostalCode": "53703",
        "total": 0.99
    },
    {
        "customerId": 26,
        "invoiceDate": "2009/11/07 00:00:00",
        "billingAddress": "2211 W Berry Street",
        "billingCity": "Fort Worth",
        "billingState": "TX",
        "billingCountry": "USA",
        "billingPostalCode": "76110",
        "total": 1.98
    },
    {
        "customerId": 28,
        "invoiceDate": "2009/11/07 00:00:00",
        "billingAddress": "302 S 700 E",
        "billingCity": "Salt Lake City",
        "billingState": "UT",
        "billingCountry": "USA",
        "billingPostalCode": "84102",
        "total": 1.98
    },
    {
        "customerId": 30,
        "invoiceDate": "2009/11/08 00:00:00",
        "billingAddress": "230 Elgin Street",
        "billingCity": "Ottawa",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "K2P 1L7",
        "total": 3.96
    },
    {
        "customerId": 34,
        "invoiceDate": "2009/11/09 00:00:00",
        "billingAddress": "Rua da Assunção 53",
        "billingCity": "Lisbon",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 5.94
    },
    {
        "customerId": 40,
        "invoiceDate": "2009/11/12 00:00:00",
        "billingAddress": "8, Rue Hanovre",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75002",
        "total": 8.91
    },
    {
        "customerId": 49,
        "invoiceDate": "2009/11/17 00:00:00",
        "billingAddress": "Ordynacka 10",
        "billingCity": "Warsaw",
        "billingState": null,
        "billingCountry": "Poland",
        "billingPostalCode": "00-358",
        "total": 13.86
    },
    {
        "customerId": 4,
        "invoiceDate": "2009/11/25 00:00:00",
        "billingAddress": "Ullevålsveien 14",
        "billingCity": "Oslo",
        "billingState": null,
        "billingCountry": "Norway",
        "billingPostalCode": "0171",
        "total": 0.99
    },
    {
        "customerId": 5,
        "invoiceDate": "2009/12/08 00:00:00",
        "billingAddress": "Klanova 9/506",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14700",
        "total": 1.98
    },
    {
        "customerId": 7,
        "invoiceDate": "2009/12/08 00:00:00",
        "billingAddress": "Rotenturmstraße 4, 1010 Innere Stadt",
        "billingCity": "Vienne",
        "billingState": null,
        "billingCountry": "Austria",
        "billingPostalCode": "1010",
        "total": 1.98
    },
    {
        "customerId": 9,
        "invoiceDate": "2009/12/09 00:00:00",
        "billingAddress": "Sønder Boulevard 51",
        "billingCity": "Copenhagen",
        "billingState": null,
        "billingCountry": "Denmark",
        "billingPostalCode": "1720",
        "total": 3.96
    },
    {
        "customerId": 13,
        "invoiceDate": "2009/12/10 00:00:00",
        "billingAddress": "Qe 7 Bloco G",
        "billingCity": "Brasília",
        "billingState": "DF",
        "billingCountry": "Brazil",
        "billingPostalCode": "71020-677",
        "total": 5.94
    },
    {
        "customerId": 19,
        "invoiceDate": "2009/12/13 00:00:00",
        "billingAddress": "1 Infinite Loop",
        "billingCity": "Cupertino",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "95014",
        "total": 8.91
    },
    {
        "customerId": 28,
        "invoiceDate": "2009/12/18 00:00:00",
        "billingAddress": "302 S 700 E",
        "billingCity": "Salt Lake City",
        "billingState": "UT",
        "billingCountry": "USA",
        "billingPostalCode": "84102",
        "total": 13.86
    },
    {
        "customerId": 42,
        "invoiceDate": "2009/12/26 00:00:00",
        "billingAddress": "9, Place Louis Barthou",
        "billingCity": "Bordeaux",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "33000",
        "total": 0.99
    },
    {
        "customerId": 43,
        "invoiceDate": "2010/01/08 00:00:00",
        "billingAddress": "68, Rue Jouvence",
        "billingCity": "Dijon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "21000",
        "total": 1.98
    },
    {
        "customerId": 45,
        "invoiceDate": "2010/01/08 00:00:00",
        "billingAddress": "Erzsébet krt. 58.",
        "billingCity": "Budapest",
        "billingState": null,
        "billingCountry": "Hungary",
        "billingPostalCode": "H-1073",
        "total": 1.98
    },
    {
        "customerId": 47,
        "invoiceDate": "2010/01/09 00:00:00",
        "billingAddress": "Via Degli Scipioni, 43",
        "billingCity": "Rome",
        "billingState": "RM",
        "billingCountry": "Italy",
        "billingPostalCode": "00192",
        "total": 3.96
    },
    {
        "customerId": 51,
        "invoiceDate": "2010/01/10 00:00:00",
        "billingAddress": "Celsiusg. 9",
        "billingCity": "Stockholm",
        "billingState": null,
        "billingCountry": "Sweden",
        "billingPostalCode": "11230",
        "total": 6.94
    },
    {
        "customerId": 57,
        "invoiceDate": "2010/01/13 00:00:00",
        "billingAddress": "Calle Lira, 198",
        "billingCity": "Santiago",
        "billingState": null,
        "billingCountry": "Chile",
        "billingPostalCode": null,
        "total": 17.91
    },
    {
        "customerId": 7,
        "invoiceDate": "2010/01/18 00:00:00",
        "billingAddress": "Rotenturmstraße 4, 1010 Innere Stadt",
        "billingCity": "Vienne",
        "billingState": null,
        "billingCountry": "Austria",
        "billingPostalCode": "1010",
        "total": 18.86
    },
    {
        "customerId": 21,
        "invoiceDate": "2010/01/26 00:00:00",
        "billingAddress": "801 W 4th Street",
        "billingCity": "Reno",
        "billingState": "NV",
        "billingCountry": "USA",
        "billingPostalCode": "89503",
        "total": 0.99
    },
    {
        "customerId": 22,
        "invoiceDate": "2010/02/08 00:00:00",
        "billingAddress": "120 S Orange Ave",
        "billingCity": "Orlando",
        "billingState": "FL",
        "billingCountry": "USA",
        "billingPostalCode": "32801",
        "total": 1.98
    },
    {
        "customerId": 24,
        "invoiceDate": "2010/02/08 00:00:00",
        "billingAddress": "162 E Superior Street",
        "billingCity": "Chicago",
        "billingState": "IL",
        "billingCountry": "USA",
        "billingPostalCode": "60611",
        "total": 1.98
    },
    {
        "customerId": 26,
        "invoiceDate": "2010/02/09 00:00:00",
        "billingAddress": "2211 W Berry Street",
        "billingCity": "Fort Worth",
        "billingState": "TX",
        "billingCountry": "USA",
        "billingPostalCode": "76110",
        "total": 3.96
    },
    {
        "customerId": 30,
        "invoiceDate": "2010/02/10 00:00:00",
        "billingAddress": "230 Elgin Street",
        "billingCity": "Ottawa",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "K2P 1L7",
        "total": 5.94
    },
    {
        "customerId": 36,
        "invoiceDate": "2010/02/13 00:00:00",
        "billingAddress": "Tauentzienstraße 8",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10789",
        "total": 8.91
    },
    {
        "customerId": 45,
        "invoiceDate": "2010/02/18 00:00:00",
        "billingAddress": "Erzsébet krt. 58.",
        "billingCity": "Budapest",
        "billingState": null,
        "billingCountry": "Hungary",
        "billingPostalCode": "H-1073",
        "total": 21.86
    },
    {
        "customerId": 59,
        "invoiceDate": "2010/02/26 00:00:00",
        "billingAddress": "3,Raj Bhavan Road",
        "billingCity": "Bangalore",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "560001",
        "total": 1.99
    },
    {
        "customerId": 1,
        "invoiceDate": "2010/03/11 00:00:00",
        "billingAddress": "Av. Brigadeiro Faria Lima, 2170",
        "billingCity": "São José dos Campos",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "12227-000",
        "total": 3.98
    },
    {
        "customerId": 3,
        "invoiceDate": "2010/03/11 00:00:00",
        "billingAddress": "1498 rue Bélanger",
        "billingCity": "Montréal",
        "billingState": "QC",
        "billingCountry": "Canada",
        "billingPostalCode": "H2G 1A7",
        "total": 3.98
    },
    {
        "customerId": 5,
        "invoiceDate": "2010/03/12 00:00:00",
        "billingAddress": "Klanova 9/506",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14700",
        "total": 3.96
    },
    {
        "customerId": 9,
        "invoiceDate": "2010/03/13 00:00:00",
        "billingAddress": "Sønder Boulevard 51",
        "billingCity": "Copenhagen",
        "billingState": null,
        "billingCountry": "Denmark",
        "billingPostalCode": "1720",
        "total": 5.94
    },
    {
        "customerId": 15,
        "invoiceDate": "2010/03/16 00:00:00",
        "billingAddress": "700 W Pender Street",
        "billingCity": "Vancouver",
        "billingState": "BC",
        "billingCountry": "Canada",
        "billingPostalCode": "V6C 1G8",
        "total": 9.91
    },
    {
        "customerId": 24,
        "invoiceDate": "2010/03/21 00:00:00",
        "billingAddress": "162 E Superior Street",
        "billingCity": "Chicago",
        "billingState": "IL",
        "billingCountry": "USA",
        "billingPostalCode": "60611",
        "total": 15.86
    },
    {
        "customerId": 38,
        "invoiceDate": "2010/03/29 00:00:00",
        "billingAddress": "Barbarossastraße 19",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10779",
        "total": 0.99
    },
    {
        "customerId": 39,
        "invoiceDate": "2010/04/11 00:00:00",
        "billingAddress": "4, Rue Milton",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75009",
        "total": 1.98
    },
    {
        "customerId": 41,
        "invoiceDate": "2010/04/11 00:00:00",
        "billingAddress": "11, Place Bellecour",
        "billingCity": "Lyon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "69002",
        "total": 1.98
    },
    {
        "customerId": 43,
        "invoiceDate": "2010/04/12 00:00:00",
        "billingAddress": "68, Rue Jouvence",
        "billingCity": "Dijon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "21000",
        "total": 3.96
    },
    {
        "customerId": 47,
        "invoiceDate": "2010/04/13 00:00:00",
        "billingAddress": "Via Degli Scipioni, 43",
        "billingCity": "Rome",
        "billingState": "RM",
        "billingCountry": "Italy",
        "billingPostalCode": "00192",
        "total": 5.94
    },
    {
        "customerId": 53,
        "invoiceDate": "2010/04/16 00:00:00",
        "billingAddress": "113 Lupus St",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "SW1V 3EN",
        "total": 8.91
    },
    {
        "customerId": 3,
        "invoiceDate": "2010/04/21 00:00:00",
        "billingAddress": "1498 rue Bélanger",
        "billingCity": "Montréal",
        "billingState": "QC",
        "billingCountry": "Canada",
        "billingPostalCode": "H2G 1A7",
        "total": 13.86
    },
    {
        "customerId": 17,
        "invoiceDate": "2010/04/29 00:00:00",
        "billingAddress": "1 Microsoft Way",
        "billingCity": "Redmond",
        "billingState": "WA",
        "billingCountry": "USA",
        "billingPostalCode": "98052-8300",
        "total": 0.99
    },
    {
        "customerId": 18,
        "invoiceDate": "2010/05/12 00:00:00",
        "billingAddress": "627 Broadway",
        "billingCity": "New York",
        "billingState": "NY",
        "billingCountry": "USA",
        "billingPostalCode": "10012-2612",
        "total": 1.98
    },
    {
        "customerId": 20,
        "invoiceDate": "2010/05/12 00:00:00",
        "billingAddress": "541 Del Medio Avenue",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94040-111",
        "total": 1.98
    },
    {
        "customerId": 22,
        "invoiceDate": "2010/05/13 00:00:00",
        "billingAddress": "120 S Orange Ave",
        "billingCity": "Orlando",
        "billingState": "FL",
        "billingCountry": "USA",
        "billingPostalCode": "32801",
        "total": 3.96
    },
    {
        "customerId": 26,
        "invoiceDate": "2010/05/14 00:00:00",
        "billingAddress": "2211 W Berry Street",
        "billingCity": "Fort Worth",
        "billingState": "TX",
        "billingCountry": "USA",
        "billingPostalCode": "76110",
        "total": 5.94
    },
    {
        "customerId": 32,
        "invoiceDate": "2010/05/17 00:00:00",
        "billingAddress": "696 Osborne Street",
        "billingCity": "Winnipeg",
        "billingState": "MB",
        "billingCountry": "Canada",
        "billingPostalCode": "R3L 2B9",
        "total": 8.91
    },
    {
        "customerId": 41,
        "invoiceDate": "2010/05/22 00:00:00",
        "billingAddress": "11, Place Bellecour",
        "billingCity": "Lyon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "69002",
        "total": 13.86
    },
    {
        "customerId": 55,
        "invoiceDate": "2010/05/30 00:00:00",
        "billingAddress": "421 Bourke Street",
        "billingCity": "Sidney",
        "billingState": "NSW",
        "billingCountry": "Australia",
        "billingPostalCode": "2010",
        "total": 0.99
    },
    {
        "customerId": 56,
        "invoiceDate": "2010/06/12 00:00:00",
        "billingAddress": "307 Macacha Güemes",
        "billingCity": "Buenos Aires",
        "billingState": null,
        "billingCountry": "Argentina",
        "billingPostalCode": "1106",
        "total": 1.98
    },
    {
        "customerId": 58,
        "invoiceDate": "2010/06/12 00:00:00",
        "billingAddress": "12,Community Centre",
        "billingCity": "Delhi",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "110017",
        "total": 1.98
    },
    {
        "customerId": 1,
        "invoiceDate": "2010/06/13 00:00:00",
        "billingAddress": "Av. Brigadeiro Faria Lima, 2170",
        "billingCity": "São José dos Campos",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "12227-000",
        "total": 3.96
    },
    {
        "customerId": 5,
        "invoiceDate": "2010/06/14 00:00:00",
        "billingAddress": "Klanova 9/506",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14700",
        "total": 5.94
    },
    {
        "customerId": 11,
        "invoiceDate": "2010/06/17 00:00:00",
        "billingAddress": "Av. Paulista, 2022",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01310-200",
        "total": 8.91
    },
    {
        "customerId": 20,
        "invoiceDate": "2010/06/22 00:00:00",
        "billingAddress": "541 Del Medio Avenue",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94040-111",
        "total": 13.86
    },
    {
        "customerId": 34,
        "invoiceDate": "2010/06/30 00:00:00",
        "billingAddress": "Rua da Assunção 53",
        "billingCity": "Lisbon",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 0.99
    },
    {
        "customerId": 35,
        "invoiceDate": "2010/07/13 00:00:00",
        "billingAddress": "Rua dos Campeões Europeus de Viena, 4350",
        "billingCity": "Porto",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 1.98
    },
    {
        "customerId": 37,
        "invoiceDate": "2010/07/13 00:00:00",
        "billingAddress": "Berger Straße 10",
        "billingCity": "Frankfurt",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "60316",
        "total": 1.98
    },
    {
        "customerId": 39,
        "invoiceDate": "2010/07/14 00:00:00",
        "billingAddress": "4, Rue Milton",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75009",
        "total": 3.96
    },
    {
        "customerId": 43,
        "invoiceDate": "2010/07/15 00:00:00",
        "billingAddress": "68, Rue Jouvence",
        "billingCity": "Dijon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "21000",
        "total": 5.94
    },
    {
        "customerId": 49,
        "invoiceDate": "2010/07/18 00:00:00",
        "billingAddress": "Ordynacka 10",
        "billingCity": "Warsaw",
        "billingState": null,
        "billingCountry": "Poland",
        "billingPostalCode": "00-358",
        "total": 8.91
    },
    {
        "customerId": 58,
        "invoiceDate": "2010/07/23 00:00:00",
        "billingAddress": "12,Community Centre",
        "billingCity": "Delhi",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "110017",
        "total": 13.86
    },
    {
        "customerId": 13,
        "invoiceDate": "2010/07/31 00:00:00",
        "billingAddress": "Qe 7 Bloco G",
        "billingCity": "Brasília",
        "billingState": "DF",
        "billingCountry": "Brazil",
        "billingPostalCode": "71020-677",
        "total": 0.99
    },
    {
        "customerId": 14,
        "invoiceDate": "2010/08/13 00:00:00",
        "billingAddress": "8210 111 ST NW",
        "billingCity": "Edmonton",
        "billingState": "AB",
        "billingCountry": "Canada",
        "billingPostalCode": "T6G 2C7",
        "total": 1.98
    },
    {
        "customerId": 16,
        "invoiceDate": "2010/08/13 00:00:00",
        "billingAddress": "1600 Amphitheatre Parkway",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94043-1351",
        "total": 1.98
    },
    {
        "customerId": 18,
        "invoiceDate": "2010/08/14 00:00:00",
        "billingAddress": "627 Broadway",
        "billingCity": "New York",
        "billingState": "NY",
        "billingCountry": "USA",
        "billingPostalCode": "10012-2612",
        "total": 3.96
    },
    {
        "customerId": 22,
        "invoiceDate": "2010/08/15 00:00:00",
        "billingAddress": "120 S Orange Ave",
        "billingCity": "Orlando",
        "billingState": "FL",
        "billingCountry": "USA",
        "billingPostalCode": "32801",
        "total": 5.94
    },
    {
        "customerId": 28,
        "invoiceDate": "2010/08/18 00:00:00",
        "billingAddress": "302 S 700 E",
        "billingCity": "Salt Lake City",
        "billingState": "UT",
        "billingCountry": "USA",
        "billingPostalCode": "84102",
        "total": 8.91
    },
    {
        "customerId": 37,
        "invoiceDate": "2010/08/23 00:00:00",
        "billingAddress": "Berger Straße 10",
        "billingCity": "Frankfurt",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "60316",
        "total": 13.86
    },
    {
        "customerId": 51,
        "invoiceDate": "2010/08/31 00:00:00",
        "billingAddress": "Celsiusg. 9",
        "billingCity": "Stockholm",
        "billingState": null,
        "billingCountry": "Sweden",
        "billingPostalCode": "11230",
        "total": 0.99
    },
    {
        "customerId": 52,
        "invoiceDate": "2010/09/13 00:00:00",
        "billingAddress": "202 Hoxton Street",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "N1 5LH",
        "total": 1.98
    },
    {
        "customerId": 54,
        "invoiceDate": "2010/09/13 00:00:00",
        "billingAddress": "110 Raeburn Pl",
        "billingCity": "Edinburgh ",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "EH4 1HH",
        "total": 1.98
    },
    {
        "customerId": 56,
        "invoiceDate": "2010/09/14 00:00:00",
        "billingAddress": "307 Macacha Güemes",
        "billingCity": "Buenos Aires",
        "billingState": null,
        "billingCountry": "Argentina",
        "billingPostalCode": "1106",
        "total": 3.96
    },
    {
        "customerId": 1,
        "invoiceDate": "2010/09/15 00:00:00",
        "billingAddress": "Av. Brigadeiro Faria Lima, 2170",
        "billingCity": "São José dos Campos",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "12227-000",
        "total": 5.94
    },
    {
        "customerId": 7,
        "invoiceDate": "2010/09/18 00:00:00",
        "billingAddress": "Rotenturmstraße 4, 1010 Innere Stadt",
        "billingCity": "Vienne",
        "billingState": null,
        "billingCountry": "Austria",
        "billingPostalCode": "1010",
        "total": 8.91
    },
    {
        "customerId": 16,
        "invoiceDate": "2010/09/23 00:00:00",
        "billingAddress": "1600 Amphitheatre Parkway",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94043-1351",
        "total": 13.86
    },
    {
        "customerId": 30,
        "invoiceDate": "2010/10/01 00:00:00",
        "billingAddress": "230 Elgin Street",
        "billingCity": "Ottawa",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "K2P 1L7",
        "total": 0.99
    },
    {
        "customerId": 31,
        "invoiceDate": "2010/10/14 00:00:00",
        "billingAddress": "194A Chain Lake Drive",
        "billingCity": "Halifax",
        "billingState": "NS",
        "billingCountry": "Canada",
        "billingPostalCode": "B3S 1C5",
        "total": 1.98
    },
    {
        "customerId": 33,
        "invoiceDate": "2010/10/14 00:00:00",
        "billingAddress": "5112 48 Street",
        "billingCity": "Yellowknife",
        "billingState": "NT",
        "billingCountry": "Canada",
        "billingPostalCode": "X1A 1N6",
        "total": 1.98
    },
    {
        "customerId": 35,
        "invoiceDate": "2010/10/15 00:00:00",
        "billingAddress": "Rua dos Campeões Europeus de Viena, 4350",
        "billingCity": "Porto",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 3.96
    },
    {
        "customerId": 39,
        "invoiceDate": "2010/10/16 00:00:00",
        "billingAddress": "4, Rue Milton",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75009",
        "total": 5.94
    },
    {
        "customerId": 45,
        "invoiceDate": "2010/10/19 00:00:00",
        "billingAddress": "Erzsébet krt. 58.",
        "billingCity": "Budapest",
        "billingState": null,
        "billingCountry": "Hungary",
        "billingPostalCode": "H-1073",
        "total": 8.91
    },
    {
        "customerId": 54,
        "invoiceDate": "2010/10/24 00:00:00",
        "billingAddress": "110 Raeburn Pl",
        "billingCity": "Edinburgh ",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "EH4 1HH",
        "total": 13.86
    },
    {
        "customerId": 9,
        "invoiceDate": "2010/11/01 00:00:00",
        "billingAddress": "Sønder Boulevard 51",
        "billingCity": "Copenhagen",
        "billingState": null,
        "billingCountry": "Denmark",
        "billingPostalCode": "1720",
        "total": 0.99
    },
    {
        "customerId": 10,
        "invoiceDate": "2010/11/14 00:00:00",
        "billingAddress": "Rua Dr. Falcão Filho, 155",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01007-010",
        "total": 1.98
    },
    {
        "customerId": 12,
        "invoiceDate": "2010/11/14 00:00:00",
        "billingAddress": "Praça Pio X, 119",
        "billingCity": "Rio de Janeiro",
        "billingState": "RJ",
        "billingCountry": "Brazil",
        "billingPostalCode": "20040-020",
        "total": 1.98
    },
    {
        "customerId": 14,
        "invoiceDate": "2010/11/15 00:00:00",
        "billingAddress": "8210 111 ST NW",
        "billingCity": "Edmonton",
        "billingState": "AB",
        "billingCountry": "Canada",
        "billingPostalCode": "T6G 2C7",
        "total": 3.96
    },
    {
        "customerId": 18,
        "invoiceDate": "2010/11/16 00:00:00",
        "billingAddress": "627 Broadway",
        "billingCity": "New York",
        "billingState": "NY",
        "billingCountry": "USA",
        "billingPostalCode": "10012-2612",
        "total": 5.94
    },
    {
        "customerId": 24,
        "invoiceDate": "2010/11/19 00:00:00",
        "billingAddress": "162 E Superior Street",
        "billingCity": "Chicago",
        "billingState": "IL",
        "billingCountry": "USA",
        "billingPostalCode": "60611",
        "total": 8.91
    },
    {
        "customerId": 33,
        "invoiceDate": "2010/11/24 00:00:00",
        "billingAddress": "5112 48 Street",
        "billingCity": "Yellowknife",
        "billingState": "NT",
        "billingCountry": "Canada",
        "billingPostalCode": "X1A 1N6",
        "total": 13.86
    },
    {
        "customerId": 47,
        "invoiceDate": "2010/12/02 00:00:00",
        "billingAddress": "Via Degli Scipioni, 43",
        "billingCity": "Rome",
        "billingState": "RM",
        "billingCountry": "Italy",
        "billingPostalCode": "00192",
        "total": 0.99
    },
    {
        "customerId": 48,
        "invoiceDate": "2010/12/15 00:00:00",
        "billingAddress": "Lijnbaansgracht 120bg",
        "billingCity": "Amsterdam",
        "billingState": "VV",
        "billingCountry": "Netherlands",
        "billingPostalCode": "1016",
        "total": 1.98
    },
    {
        "customerId": 50,
        "invoiceDate": "2010/12/15 00:00:00",
        "billingAddress": "C/ San Bernardo 85",
        "billingCity": "Madrid",
        "billingState": null,
        "billingCountry": "Spain",
        "billingPostalCode": "28015",
        "total": 1.98
    },
    {
        "customerId": 52,
        "invoiceDate": "2010/12/16 00:00:00",
        "billingAddress": "202 Hoxton Street",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "N1 5LH",
        "total": 3.96
    },
    {
        "customerId": 56,
        "invoiceDate": "2010/12/17 00:00:00",
        "billingAddress": "307 Macacha Güemes",
        "billingCity": "Buenos Aires",
        "billingState": null,
        "billingCountry": "Argentina",
        "billingPostalCode": "1106",
        "total": 5.94
    },
    {
        "customerId": 3,
        "invoiceDate": "2010/12/20 00:00:00",
        "billingAddress": "1498 rue Bélanger",
        "billingCity": "Montréal",
        "billingState": "QC",
        "billingCountry": "Canada",
        "billingPostalCode": "H2G 1A7",
        "total": 8.91
    },
    {
        "customerId": 12,
        "invoiceDate": "2010/12/25 00:00:00",
        "billingAddress": "Praça Pio X, 119",
        "billingCity": "Rio de Janeiro",
        "billingState": "RJ",
        "billingCountry": "Brazil",
        "billingPostalCode": "20040-020",
        "total": 13.86
    },
    {
        "customerId": 26,
        "invoiceDate": "2011/01/02 00:00:00",
        "billingAddress": "2211 W Berry Street",
        "billingCity": "Fort Worth",
        "billingState": "TX",
        "billingCountry": "USA",
        "billingPostalCode": "76110",
        "total": 0.99
    },
    {
        "customerId": 27,
        "invoiceDate": "2011/01/15 00:00:00",
        "billingAddress": "1033 N Park Ave",
        "billingCity": "Tucson",
        "billingState": "AZ",
        "billingCountry": "USA",
        "billingPostalCode": "85719",
        "total": 1.98
    },
    {
        "customerId": 29,
        "invoiceDate": "2011/01/15 00:00:00",
        "billingAddress": "796 Dundas Street West",
        "billingCity": "Toronto",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "M6J 1V1",
        "total": 1.98
    },
    {
        "customerId": 31,
        "invoiceDate": "2011/01/16 00:00:00",
        "billingAddress": "194A Chain Lake Drive",
        "billingCity": "Halifax",
        "billingState": "NS",
        "billingCountry": "Canada",
        "billingPostalCode": "B3S 1C5",
        "total": 3.96
    },
    {
        "customerId": 35,
        "invoiceDate": "2011/01/17 00:00:00",
        "billingAddress": "Rua dos Campeões Europeus de Viena, 4350",
        "billingCity": "Porto",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 5.94
    },
    {
        "customerId": 41,
        "invoiceDate": "2011/01/20 00:00:00",
        "billingAddress": "11, Place Bellecour",
        "billingCity": "Lyon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "69002",
        "total": 8.91
    },
    {
        "customerId": 50,
        "invoiceDate": "2011/01/25 00:00:00",
        "billingAddress": "C/ San Bernardo 85",
        "billingCity": "Madrid",
        "billingState": null,
        "billingCountry": "Spain",
        "billingPostalCode": "28015",
        "total": 13.86
    },
    {
        "customerId": 5,
        "invoiceDate": "2011/02/02 00:00:00",
        "billingAddress": "Klanova 9/506",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14700",
        "total": 0.99
    },
    {
        "customerId": 6,
        "invoiceDate": "2011/02/15 00:00:00",
        "billingAddress": "Rilská 3174/6",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14300",
        "total": 1.98
    },
    {
        "customerId": 8,
        "invoiceDate": "2011/02/15 00:00:00",
        "billingAddress": "Grétrystraat 63",
        "billingCity": "Brussels",
        "billingState": null,
        "billingCountry": "Belgium",
        "billingPostalCode": "1000",
        "total": 1.98
    },
    {
        "customerId": 10,
        "invoiceDate": "2011/02/16 00:00:00",
        "billingAddress": "Rua Dr. Falcão Filho, 155",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01007-010",
        "total": 3.96
    },
    {
        "customerId": 14,
        "invoiceDate": "2011/02/17 00:00:00",
        "billingAddress": "8210 111 ST NW",
        "billingCity": "Edmonton",
        "billingState": "AB",
        "billingCountry": "Canada",
        "billingPostalCode": "T6G 2C7",
        "total": 5.94
    },
    {
        "customerId": 20,
        "invoiceDate": "2011/02/20 00:00:00",
        "billingAddress": "541 Del Medio Avenue",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94040-111",
        "total": 8.91
    },
    {
        "customerId": 29,
        "invoiceDate": "2011/02/25 00:00:00",
        "billingAddress": "796 Dundas Street West",
        "billingCity": "Toronto",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "M6J 1V1",
        "total": 13.86
    },
    {
        "customerId": 43,
        "invoiceDate": "2011/03/05 00:00:00",
        "billingAddress": "68, Rue Jouvence",
        "billingCity": "Dijon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "21000",
        "total": 0.99
    },
    {
        "customerId": 44,
        "invoiceDate": "2011/03/18 00:00:00",
        "billingAddress": "Porthaninkatu 9",
        "billingCity": "Helsinki",
        "billingState": null,
        "billingCountry": "Finland",
        "billingPostalCode": "00530",
        "total": 1.98
    },
    {
        "customerId": 46,
        "invoiceDate": "2011/03/18 00:00:00",
        "billingAddress": "3 Chatham Street",
        "billingCity": "Dublin",
        "billingState": "Dublin",
        "billingCountry": "Ireland",
        "billingPostalCode": null,
        "total": 1.98
    },
    {
        "customerId": 48,
        "invoiceDate": "2011/03/19 00:00:00",
        "billingAddress": "Lijnbaansgracht 120bg",
        "billingCity": "Amsterdam",
        "billingState": "VV",
        "billingCountry": "Netherlands",
        "billingPostalCode": "1016",
        "total": 3.96
    },
    {
        "customerId": 52,
        "invoiceDate": "2011/03/20 00:00:00",
        "billingAddress": "202 Hoxton Street",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "N1 5LH",
        "total": 5.94
    },
    {
        "customerId": 58,
        "invoiceDate": "2011/03/23 00:00:00",
        "billingAddress": "12,Community Centre",
        "billingCity": "Delhi",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "110017",
        "total": 8.91
    },
    {
        "customerId": 8,
        "invoiceDate": "2011/03/28 00:00:00",
        "billingAddress": "Grétrystraat 63",
        "billingCity": "Brussels",
        "billingState": null,
        "billingCountry": "Belgium",
        "billingPostalCode": "1000",
        "total": 13.86
    },
    {
        "customerId": 22,
        "invoiceDate": "2011/04/05 00:00:00",
        "billingAddress": "120 S Orange Ave",
        "billingCity": "Orlando",
        "billingState": "FL",
        "billingCountry": "USA",
        "billingPostalCode": "32801",
        "total": 0.99
    },
    {
        "customerId": 23,
        "invoiceDate": "2011/04/18 00:00:00",
        "billingAddress": "69 Salem Street",
        "billingCity": "Boston",
        "billingState": "MA",
        "billingCountry": "USA",
        "billingPostalCode": "2113",
        "total": 1.98
    },
    {
        "customerId": 25,
        "invoiceDate": "2011/04/18 00:00:00",
        "billingAddress": "319 N. Frances Street",
        "billingCity": "Madison",
        "billingState": "WI",
        "billingCountry": "USA",
        "billingPostalCode": "53703",
        "total": 1.98
    },
    {
        "customerId": 27,
        "invoiceDate": "2011/04/19 00:00:00",
        "billingAddress": "1033 N Park Ave",
        "billingCity": "Tucson",
        "billingState": "AZ",
        "billingCountry": "USA",
        "billingPostalCode": "85719",
        "total": 3.96
    },
    {
        "customerId": 31,
        "invoiceDate": "2011/04/20 00:00:00",
        "billingAddress": "194A Chain Lake Drive",
        "billingCity": "Halifax",
        "billingState": "NS",
        "billingCountry": "Canada",
        "billingPostalCode": "B3S 1C5",
        "total": 5.94
    },
    {
        "customerId": 37,
        "invoiceDate": "2011/04/23 00:00:00",
        "billingAddress": "Berger Straße 10",
        "billingCity": "Frankfurt",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "60316",
        "total": 14.91
    },
    {
        "customerId": 46,
        "invoiceDate": "2011/04/28 00:00:00",
        "billingAddress": "3 Chatham Street",
        "billingCity": "Dublin",
        "billingState": "Dublin",
        "billingCountry": "Ireland",
        "billingPostalCode": null,
        "total": 21.86
    },
    {
        "customerId": 1,
        "invoiceDate": "2011/05/06 00:00:00",
        "billingAddress": "Av. Brigadeiro Faria Lima, 2170",
        "billingCity": "São José dos Campos",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "12227-000",
        "total": 0.99
    },
    {
        "customerId": 2,
        "invoiceDate": "2011/05/19 00:00:00",
        "billingAddress": "Theodor-Heuss-Straße 34",
        "billingCity": "Stuttgart",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "70174",
        "total": 1.98
    },
    {
        "customerId": 4,
        "invoiceDate": "2011/05/19 00:00:00",
        "billingAddress": "Ullevålsveien 14",
        "billingCity": "Oslo",
        "billingState": null,
        "billingCountry": "Norway",
        "billingPostalCode": "0171",
        "total": 1.98
    },
    {
        "customerId": 6,
        "invoiceDate": "2011/05/20 00:00:00",
        "billingAddress": "Rilská 3174/6",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14300",
        "total": 3.96
    },
    {
        "customerId": 10,
        "invoiceDate": "2011/05/21 00:00:00",
        "billingAddress": "Rua Dr. Falcão Filho, 155",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01007-010",
        "total": 5.94
    },
    {
        "customerId": 16,
        "invoiceDate": "2011/05/24 00:00:00",
        "billingAddress": "1600 Amphitheatre Parkway",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94043-1351",
        "total": 8.91
    },
    {
        "customerId": 25,
        "invoiceDate": "2011/05/29 00:00:00",
        "billingAddress": "319 N. Frances Street",
        "billingCity": "Madison",
        "billingState": "WI",
        "billingCountry": "USA",
        "billingPostalCode": "53703",
        "total": 18.86
    },
    {
        "customerId": 39,
        "invoiceDate": "2011/06/06 00:00:00",
        "billingAddress": "4, Rue Milton",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75009",
        "total": 1.99
    },
    {
        "customerId": 40,
        "invoiceDate": "2011/06/19 00:00:00",
        "billingAddress": "8, Rue Hanovre",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75002",
        "total": 2.98
    },
    {
        "customerId": 42,
        "invoiceDate": "2011/06/19 00:00:00",
        "billingAddress": "9, Place Louis Barthou",
        "billingCity": "Bordeaux",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "33000",
        "total": 3.98
    },
    {
        "customerId": 44,
        "invoiceDate": "2011/06/20 00:00:00",
        "billingAddress": "Porthaninkatu 9",
        "billingCity": "Helsinki",
        "billingState": null,
        "billingCountry": "Finland",
        "billingPostalCode": "00530",
        "total": 7.96
    },
    {
        "customerId": 48,
        "invoiceDate": "2011/06/21 00:00:00",
        "billingAddress": "Lijnbaansgracht 120bg",
        "billingCity": "Amsterdam",
        "billingState": "VV",
        "billingCountry": "Netherlands",
        "billingPostalCode": "1016",
        "total": 8.94
    },
    {
        "customerId": 54,
        "invoiceDate": "2011/06/24 00:00:00",
        "billingAddress": "110 Raeburn Pl",
        "billingCity": "Edinburgh ",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "EH4 1HH",
        "total": 8.91
    },
    {
        "customerId": 4,
        "invoiceDate": "2011/06/29 00:00:00",
        "billingAddress": "Ullevålsveien 14",
        "billingCity": "Oslo",
        "billingState": null,
        "billingCountry": "Norway",
        "billingPostalCode": "0171",
        "total": 15.86
    },
    {
        "customerId": 18,
        "invoiceDate": "2011/07/07 00:00:00",
        "billingAddress": "627 Broadway",
        "billingCity": "New York",
        "billingState": "NY",
        "billingCountry": "USA",
        "billingPostalCode": "10012-2612",
        "total": 0.99
    },
    {
        "customerId": 19,
        "invoiceDate": "2011/07/20 00:00:00",
        "billingAddress": "1 Infinite Loop",
        "billingCity": "Cupertino",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "95014",
        "total": 1.98
    },
    {
        "customerId": 21,
        "invoiceDate": "2011/07/20 00:00:00",
        "billingAddress": "801 W 4th Street",
        "billingCity": "Reno",
        "billingState": "NV",
        "billingCountry": "USA",
        "billingPostalCode": "89503",
        "total": 1.98
    },
    {
        "customerId": 23,
        "invoiceDate": "2011/07/21 00:00:00",
        "billingAddress": "69 Salem Street",
        "billingCity": "Boston",
        "billingState": "MA",
        "billingCountry": "USA",
        "billingPostalCode": "2113",
        "total": 3.96
    },
    {
        "customerId": 27,
        "invoiceDate": "2011/07/22 00:00:00",
        "billingAddress": "1033 N Park Ave",
        "billingCity": "Tucson",
        "billingState": "AZ",
        "billingCountry": "USA",
        "billingPostalCode": "85719",
        "total": 5.94
    },
    {
        "customerId": 33,
        "invoiceDate": "2011/07/25 00:00:00",
        "billingAddress": "5112 48 Street",
        "billingCity": "Yellowknife",
        "billingState": "NT",
        "billingCountry": "Canada",
        "billingPostalCode": "X1A 1N6",
        "total": 8.91
    },
    {
        "customerId": 42,
        "invoiceDate": "2011/07/30 00:00:00",
        "billingAddress": "9, Place Louis Barthou",
        "billingCity": "Bordeaux",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "33000",
        "total": 13.86
    },
    {
        "customerId": 56,
        "invoiceDate": "2011/08/07 00:00:00",
        "billingAddress": "307 Macacha Güemes",
        "billingCity": "Buenos Aires",
        "billingState": null,
        "billingCountry": "Argentina",
        "billingPostalCode": "1106",
        "total": 0.99
    },
    {
        "customerId": 57,
        "invoiceDate": "2011/08/20 00:00:00",
        "billingAddress": "Calle Lira, 198",
        "billingCity": "Santiago",
        "billingState": null,
        "billingCountry": "Chile",
        "billingPostalCode": null,
        "total": 1.98
    },
    {
        "customerId": 59,
        "invoiceDate": "2011/08/20 00:00:00",
        "billingAddress": "3,Raj Bhavan Road",
        "billingCity": "Bangalore",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "560001",
        "total": 1.98
    },
    {
        "customerId": 2,
        "invoiceDate": "2011/08/21 00:00:00",
        "billingAddress": "Theodor-Heuss-Straße 34",
        "billingCity": "Stuttgart",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "70174",
        "total": 3.96
    },
    {
        "customerId": 6,
        "invoiceDate": "2011/08/22 00:00:00",
        "billingAddress": "Rilská 3174/6",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14300",
        "total": 5.94
    },
    {
        "customerId": 12,
        "invoiceDate": "2011/08/25 00:00:00",
        "billingAddress": "Praça Pio X, 119",
        "billingCity": "Rio de Janeiro",
        "billingState": "RJ",
        "billingCountry": "Brazil",
        "billingPostalCode": "20040-020",
        "total": 8.91
    },
    {
        "customerId": 21,
        "invoiceDate": "2011/08/30 00:00:00",
        "billingAddress": "801 W 4th Street",
        "billingCity": "Reno",
        "billingState": "NV",
        "billingCountry": "USA",
        "billingPostalCode": "89503",
        "total": 13.86
    },
    {
        "customerId": 35,
        "invoiceDate": "2011/09/07 00:00:00",
        "billingAddress": "Rua dos Campeões Europeus de Viena, 4350",
        "billingCity": "Porto",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 0.99
    },
    {
        "customerId": 36,
        "invoiceDate": "2011/09/20 00:00:00",
        "billingAddress": "Tauentzienstraße 8",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10789",
        "total": 1.98
    },
    {
        "customerId": 38,
        "invoiceDate": "2011/09/20 00:00:00",
        "billingAddress": "Barbarossastraße 19",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10779",
        "total": 1.98
    },
    {
        "customerId": 40,
        "invoiceDate": "2011/09/21 00:00:00",
        "billingAddress": "8, Rue Hanovre",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75002",
        "total": 3.96
    },
    {
        "customerId": 44,
        "invoiceDate": "2011/09/22 00:00:00",
        "billingAddress": "Porthaninkatu 9",
        "billingCity": "Helsinki",
        "billingState": null,
        "billingCountry": "Finland",
        "billingPostalCode": "00530",
        "total": 5.94
    },
    {
        "customerId": 50,
        "invoiceDate": "2011/09/25 00:00:00",
        "billingAddress": "C/ San Bernardo 85",
        "billingCity": "Madrid",
        "billingState": null,
        "billingCountry": "Spain",
        "billingPostalCode": "28015",
        "total": 8.91
    },
    {
        "customerId": 59,
        "invoiceDate": "2011/09/30 00:00:00",
        "billingAddress": "3,Raj Bhavan Road",
        "billingCity": "Bangalore",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "560001",
        "total": 13.86
    },
    {
        "customerId": 14,
        "invoiceDate": "2011/10/08 00:00:00",
        "billingAddress": "8210 111 ST NW",
        "billingCity": "Edmonton",
        "billingState": "AB",
        "billingCountry": "Canada",
        "billingPostalCode": "T6G 2C7",
        "total": 0.99
    },
    {
        "customerId": 15,
        "invoiceDate": "2011/10/21 00:00:00",
        "billingAddress": "700 W Pender Street",
        "billingCity": "Vancouver",
        "billingState": "BC",
        "billingCountry": "Canada",
        "billingPostalCode": "V6C 1G8",
        "total": 1.98
    },
    {
        "customerId": 17,
        "invoiceDate": "2011/10/21 00:00:00",
        "billingAddress": "1 Microsoft Way",
        "billingCity": "Redmond",
        "billingState": "WA",
        "billingCountry": "USA",
        "billingPostalCode": "98052-8300",
        "total": 1.98
    },
    {
        "customerId": 19,
        "invoiceDate": "2011/10/22 00:00:00",
        "billingAddress": "1 Infinite Loop",
        "billingCity": "Cupertino",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "95014",
        "total": 3.96
    },
    {
        "customerId": 23,
        "invoiceDate": "2011/10/23 00:00:00",
        "billingAddress": "69 Salem Street",
        "billingCity": "Boston",
        "billingState": "MA",
        "billingCountry": "USA",
        "billingPostalCode": "2113",
        "total": 5.94
    },
    {
        "customerId": 29,
        "invoiceDate": "2011/10/26 00:00:00",
        "billingAddress": "796 Dundas Street West",
        "billingCity": "Toronto",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "M6J 1V1",
        "total": 8.91
    },
    {
        "customerId": 38,
        "invoiceDate": "2011/10/31 00:00:00",
        "billingAddress": "Barbarossastraße 19",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10779",
        "total": 13.86
    },
    {
        "customerId": 52,
        "invoiceDate": "2011/11/08 00:00:00",
        "billingAddress": "202 Hoxton Street",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "N1 5LH",
        "total": 0.99
    },
    {
        "customerId": 53,
        "invoiceDate": "2011/11/21 00:00:00",
        "billingAddress": "113 Lupus St",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "SW1V 3EN",
        "total": 1.98
    },
    {
        "customerId": 55,
        "invoiceDate": "2011/11/21 00:00:00",
        "billingAddress": "421 Bourke Street",
        "billingCity": "Sidney",
        "billingState": "NSW",
        "billingCountry": "Australia",
        "billingPostalCode": "2010",
        "total": 1.98
    },
    {
        "customerId": 57,
        "invoiceDate": "2011/11/22 00:00:00",
        "billingAddress": "Calle Lira, 198",
        "billingCity": "Santiago",
        "billingState": null,
        "billingCountry": "Chile",
        "billingPostalCode": null,
        "total": 3.96
    },
    {
        "customerId": 2,
        "invoiceDate": "2011/11/23 00:00:00",
        "billingAddress": "Theodor-Heuss-Straße 34",
        "billingCity": "Stuttgart",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "70174",
        "total": 5.94
    },
    {
        "customerId": 8,
        "invoiceDate": "2011/11/26 00:00:00",
        "billingAddress": "Grétrystraat 63",
        "billingCity": "Brussels",
        "billingState": null,
        "billingCountry": "Belgium",
        "billingPostalCode": "1000",
        "total": 8.91
    },
    {
        "customerId": 17,
        "invoiceDate": "2011/12/01 00:00:00",
        "billingAddress": "1 Microsoft Way",
        "billingCity": "Redmond",
        "billingState": "WA",
        "billingCountry": "USA",
        "billingPostalCode": "98052-8300",
        "total": 13.86
    },
    {
        "customerId": 31,
        "invoiceDate": "2011/12/09 00:00:00",
        "billingAddress": "194A Chain Lake Drive",
        "billingCity": "Halifax",
        "billingState": "NS",
        "billingCountry": "Canada",
        "billingPostalCode": "B3S 1C5",
        "total": 0.99
    },
    {
        "customerId": 32,
        "invoiceDate": "2011/12/22 00:00:00",
        "billingAddress": "696 Osborne Street",
        "billingCity": "Winnipeg",
        "billingState": "MB",
        "billingCountry": "Canada",
        "billingPostalCode": "R3L 2B9",
        "total": 1.98
    },
    {
        "customerId": 34,
        "invoiceDate": "2011/12/22 00:00:00",
        "billingAddress": "Rua da Assunção 53",
        "billingCity": "Lisbon",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 1.98
    },
    {
        "customerId": 36,
        "invoiceDate": "2011/12/23 00:00:00",
        "billingAddress": "Tauentzienstraße 8",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10789",
        "total": 3.96
    },
    {
        "customerId": 40,
        "invoiceDate": "2011/12/24 00:00:00",
        "billingAddress": "8, Rue Hanovre",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75002",
        "total": 5.94
    },
    {
        "customerId": 46,
        "invoiceDate": "2011/12/27 00:00:00",
        "billingAddress": "3 Chatham Street",
        "billingCity": "Dublin",
        "billingState": "Dublin",
        "billingCountry": "Ireland",
        "billingPostalCode": null,
        "total": 8.91
    },
    {
        "customerId": 55,
        "invoiceDate": "2012/01/01 00:00:00",
        "billingAddress": "421 Bourke Street",
        "billingCity": "Sidney",
        "billingState": "NSW",
        "billingCountry": "Australia",
        "billingPostalCode": "2010",
        "total": 13.86
    },
    {
        "customerId": 10,
        "invoiceDate": "2012/01/09 00:00:00",
        "billingAddress": "Rua Dr. Falcão Filho, 155",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01007-010",
        "total": 0.99
    },
    {
        "customerId": 11,
        "invoiceDate": "2012/01/22 00:00:00",
        "billingAddress": "Av. Paulista, 2022",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01310-200",
        "total": 1.98
    },
    {
        "customerId": 13,
        "invoiceDate": "2012/01/22 00:00:00",
        "billingAddress": "Qe 7 Bloco G",
        "billingCity": "Brasília",
        "billingState": "DF",
        "billingCountry": "Brazil",
        "billingPostalCode": "71020-677",
        "total": 1.98
    },
    {
        "customerId": 15,
        "invoiceDate": "2012/01/23 00:00:00",
        "billingAddress": "700 W Pender Street",
        "billingCity": "Vancouver",
        "billingState": "BC",
        "billingCountry": "Canada",
        "billingPostalCode": "V6C 1G8",
        "total": 3.96
    },
    {
        "customerId": 19,
        "invoiceDate": "2012/01/24 00:00:00",
        "billingAddress": "1 Infinite Loop",
        "billingCity": "Cupertino",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "95014",
        "total": 5.94
    },
    {
        "customerId": 25,
        "invoiceDate": "2012/01/27 00:00:00",
        "billingAddress": "319 N. Frances Street",
        "billingCity": "Madison",
        "billingState": "WI",
        "billingCountry": "USA",
        "billingPostalCode": "53703",
        "total": 8.91
    },
    {
        "customerId": 34,
        "invoiceDate": "2012/02/01 00:00:00",
        "billingAddress": "Rua da Assunção 53",
        "billingCity": "Lisbon",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 13.86
    },
    {
        "customerId": 48,
        "invoiceDate": "2012/02/09 00:00:00",
        "billingAddress": "Lijnbaansgracht 120bg",
        "billingCity": "Amsterdam",
        "billingState": "VV",
        "billingCountry": "Netherlands",
        "billingPostalCode": "1016",
        "total": 0.99
    },
    {
        "customerId": 49,
        "invoiceDate": "2012/02/22 00:00:00",
        "billingAddress": "Ordynacka 10",
        "billingCity": "Warsaw",
        "billingState": null,
        "billingCountry": "Poland",
        "billingPostalCode": "00-358",
        "total": 1.98
    },
    {
        "customerId": 51,
        "invoiceDate": "2012/02/22 00:00:00",
        "billingAddress": "Celsiusg. 9",
        "billingCity": "Stockholm",
        "billingState": null,
        "billingCountry": "Sweden",
        "billingPostalCode": "11230",
        "total": 1.98
    },
    {
        "customerId": 53,
        "invoiceDate": "2012/02/23 00:00:00",
        "billingAddress": "113 Lupus St",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "SW1V 3EN",
        "total": 3.96
    },
    {
        "customerId": 57,
        "invoiceDate": "2012/02/24 00:00:00",
        "billingAddress": "Calle Lira, 198",
        "billingCity": "Santiago",
        "billingState": null,
        "billingCountry": "Chile",
        "billingPostalCode": null,
        "total": 5.94
    },
    {
        "customerId": 4,
        "invoiceDate": "2012/02/27 00:00:00",
        "billingAddress": "Ullevålsveien 14",
        "billingCity": "Oslo",
        "billingState": null,
        "billingCountry": "Norway",
        "billingPostalCode": "0171",
        "total": 8.91
    },
    {
        "customerId": 13,
        "invoiceDate": "2012/03/03 00:00:00",
        "billingAddress": "Qe 7 Bloco G",
        "billingCity": "Brasília",
        "billingState": "DF",
        "billingCountry": "Brazil",
        "billingPostalCode": "71020-677",
        "total": 13.86
    },
    {
        "customerId": 27,
        "invoiceDate": "2012/03/11 00:00:00",
        "billingAddress": "1033 N Park Ave",
        "billingCity": "Tucson",
        "billingState": "AZ",
        "billingCountry": "USA",
        "billingPostalCode": "85719",
        "total": 0.99
    },
    {
        "customerId": 28,
        "invoiceDate": "2012/03/24 00:00:00",
        "billingAddress": "302 S 700 E",
        "billingCity": "Salt Lake City",
        "billingState": "UT",
        "billingCountry": "USA",
        "billingPostalCode": "84102",
        "total": 1.98
    },
    {
        "customerId": 30,
        "invoiceDate": "2012/03/24 00:00:00",
        "billingAddress": "230 Elgin Street",
        "billingCity": "Ottawa",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "K2P 1L7",
        "total": 1.98
    },
    {
        "customerId": 32,
        "invoiceDate": "2012/03/25 00:00:00",
        "billingAddress": "696 Osborne Street",
        "billingCity": "Winnipeg",
        "billingState": "MB",
        "billingCountry": "Canada",
        "billingPostalCode": "R3L 2B9",
        "total": 3.96
    },
    {
        "customerId": 36,
        "invoiceDate": "2012/03/26 00:00:00",
        "billingAddress": "Tauentzienstraße 8",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10789",
        "total": 5.94
    },
    {
        "customerId": 42,
        "invoiceDate": "2012/03/29 00:00:00",
        "billingAddress": "9, Place Louis Barthou",
        "billingCity": "Bordeaux",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "33000",
        "total": 8.91
    },
    {
        "customerId": 51,
        "invoiceDate": "2012/04/03 00:00:00",
        "billingAddress": "Celsiusg. 9",
        "billingCity": "Stockholm",
        "billingState": null,
        "billingCountry": "Sweden",
        "billingPostalCode": "11230",
        "total": 13.86
    },
    {
        "customerId": 6,
        "invoiceDate": "2012/04/11 00:00:00",
        "billingAddress": "Rilská 3174/6",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14300",
        "total": 0.99
    },
    {
        "customerId": 7,
        "invoiceDate": "2012/04/24 00:00:00",
        "billingAddress": "Rotenturmstraße 4, 1010 Innere Stadt",
        "billingCity": "Vienne",
        "billingState": null,
        "billingCountry": "Austria",
        "billingPostalCode": "1010",
        "total": 1.98
    },
    {
        "customerId": 9,
        "invoiceDate": "2012/04/24 00:00:00",
        "billingAddress": "Sønder Boulevard 51",
        "billingCity": "Copenhagen",
        "billingState": null,
        "billingCountry": "Denmark",
        "billingPostalCode": "1720",
        "total": 1.98
    },
    {
        "customerId": 11,
        "invoiceDate": "2012/04/25 00:00:00",
        "billingAddress": "Av. Paulista, 2022",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01310-200",
        "total": 3.96
    },
    {
        "customerId": 15,
        "invoiceDate": "2012/04/26 00:00:00",
        "billingAddress": "700 W Pender Street",
        "billingCity": "Vancouver",
        "billingState": "BC",
        "billingCountry": "Canada",
        "billingPostalCode": "V6C 1G8",
        "total": 5.94
    },
    {
        "customerId": 21,
        "invoiceDate": "2012/04/29 00:00:00",
        "billingAddress": "801 W 4th Street",
        "billingCity": "Reno",
        "billingState": "NV",
        "billingCountry": "USA",
        "billingPostalCode": "89503",
        "total": 8.91
    },
    {
        "customerId": 30,
        "invoiceDate": "2012/05/04 00:00:00",
        "billingAddress": "230 Elgin Street",
        "billingCity": "Ottawa",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "K2P 1L7",
        "total": 13.86
    },
    {
        "customerId": 44,
        "invoiceDate": "2012/05/12 00:00:00",
        "billingAddress": "Porthaninkatu 9",
        "billingCity": "Helsinki",
        "billingState": null,
        "billingCountry": "Finland",
        "billingPostalCode": "00530",
        "total": 0.99
    },
    {
        "customerId": 45,
        "invoiceDate": "2012/05/25 00:00:00",
        "billingAddress": "Erzsébet krt. 58.",
        "billingCity": "Budapest",
        "billingState": null,
        "billingCountry": "Hungary",
        "billingPostalCode": "H-1073",
        "total": 1.98
    },
    {
        "customerId": 47,
        "invoiceDate": "2012/05/25 00:00:00",
        "billingAddress": "Via Degli Scipioni, 43",
        "billingCity": "Rome",
        "billingState": "RM",
        "billingCountry": "Italy",
        "billingPostalCode": "00192",
        "total": 1.98
    },
    {
        "customerId": 49,
        "invoiceDate": "2012/05/26 00:00:00",
        "billingAddress": "Ordynacka 10",
        "billingCity": "Warsaw",
        "billingState": null,
        "billingCountry": "Poland",
        "billingPostalCode": "00-358",
        "total": 3.96
    },
    {
        "customerId": 53,
        "invoiceDate": "2012/05/27 00:00:00",
        "billingAddress": "113 Lupus St",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "SW1V 3EN",
        "total": 5.94
    },
    {
        "customerId": 59,
        "invoiceDate": "2012/05/30 00:00:00",
        "billingAddress": "3,Raj Bhavan Road",
        "billingCity": "Bangalore",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "560001",
        "total": 8.91
    },
    {
        "customerId": 9,
        "invoiceDate": "2012/06/04 00:00:00",
        "billingAddress": "Sønder Boulevard 51",
        "billingCity": "Copenhagen",
        "billingState": null,
        "billingCountry": "Denmark",
        "billingPostalCode": "1720",
        "total": 13.86
    },
    {
        "customerId": 23,
        "invoiceDate": "2012/06/12 00:00:00",
        "billingAddress": "69 Salem Street",
        "billingCity": "Boston",
        "billingState": "MA",
        "billingCountry": "USA",
        "billingPostalCode": "2113",
        "total": 0.99
    },
    {
        "customerId": 24,
        "invoiceDate": "2012/06/25 00:00:00",
        "billingAddress": "162 E Superior Street",
        "billingCity": "Chicago",
        "billingState": "IL",
        "billingCountry": "USA",
        "billingPostalCode": "60611",
        "total": 1.98
    },
    {
        "customerId": 26,
        "invoiceDate": "2012/06/25 00:00:00",
        "billingAddress": "2211 W Berry Street",
        "billingCity": "Fort Worth",
        "billingState": "TX",
        "billingCountry": "USA",
        "billingPostalCode": "76110",
        "total": 1.98
    },
    {
        "customerId": 28,
        "invoiceDate": "2012/06/26 00:00:00",
        "billingAddress": "302 S 700 E",
        "billingCity": "Salt Lake City",
        "billingState": "UT",
        "billingCountry": "USA",
        "billingPostalCode": "84102",
        "total": 3.96
    },
    {
        "customerId": 32,
        "invoiceDate": "2012/06/27 00:00:00",
        "billingAddress": "696 Osborne Street",
        "billingCity": "Winnipeg",
        "billingState": "MB",
        "billingCountry": "Canada",
        "billingPostalCode": "R3L 2B9",
        "total": 5.94
    },
    {
        "customerId": 38,
        "invoiceDate": "2012/06/30 00:00:00",
        "billingAddress": "Barbarossastraße 19",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10779",
        "total": 8.91
    },
    {
        "customerId": 47,
        "invoiceDate": "2012/07/05 00:00:00",
        "billingAddress": "Via Degli Scipioni, 43",
        "billingCity": "Rome",
        "billingState": "RM",
        "billingCountry": "Italy",
        "billingPostalCode": "00192",
        "total": 13.86
    },
    {
        "customerId": 2,
        "invoiceDate": "2012/07/13 00:00:00",
        "billingAddress": "Theodor-Heuss-Straße 34",
        "billingCity": "Stuttgart",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "70174",
        "total": 0.99
    },
    {
        "customerId": 3,
        "invoiceDate": "2012/07/26 00:00:00",
        "billingAddress": "1498 rue Bélanger",
        "billingCity": "Montréal",
        "billingState": "QC",
        "billingCountry": "Canada",
        "billingPostalCode": "H2G 1A7",
        "total": 1.98
    },
    {
        "customerId": 5,
        "invoiceDate": "2012/07/26 00:00:00",
        "billingAddress": "Klanova 9/506",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14700",
        "total": 1.98
    },
    {
        "customerId": 7,
        "invoiceDate": "2012/07/27 00:00:00",
        "billingAddress": "Rotenturmstraße 4, 1010 Innere Stadt",
        "billingCity": "Vienne",
        "billingState": null,
        "billingCountry": "Austria",
        "billingPostalCode": "1010",
        "total": 3.96
    },
    {
        "customerId": 11,
        "invoiceDate": "2012/07/28 00:00:00",
        "billingAddress": "Av. Paulista, 2022",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01310-200",
        "total": 5.94
    },
    {
        "customerId": 17,
        "invoiceDate": "2012/07/31 00:00:00",
        "billingAddress": "1 Microsoft Way",
        "billingCity": "Redmond",
        "billingState": "WA",
        "billingCountry": "USA",
        "billingPostalCode": "98052-8300",
        "total": 10.91
    },
    {
        "customerId": 26,
        "invoiceDate": "2012/08/05 00:00:00",
        "billingAddress": "2211 W Berry Street",
        "billingCity": "Fort Worth",
        "billingState": "TX",
        "billingCountry": "USA",
        "billingPostalCode": "76110",
        "total": 23.86
    },
    {
        "customerId": 40,
        "invoiceDate": "2012/08/13 00:00:00",
        "billingAddress": "8, Rue Hanovre",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75002",
        "total": 0.99
    },
    {
        "customerId": 41,
        "invoiceDate": "2012/08/26 00:00:00",
        "billingAddress": "11, Place Bellecour",
        "billingCity": "Lyon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "69002",
        "total": 1.98
    },
    {
        "customerId": 43,
        "invoiceDate": "2012/08/26 00:00:00",
        "billingAddress": "68, Rue Jouvence",
        "billingCity": "Dijon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "21000",
        "total": 1.98
    },
    {
        "customerId": 45,
        "invoiceDate": "2012/08/27 00:00:00",
        "billingAddress": "Erzsébet krt. 58.",
        "billingCity": "Budapest",
        "billingState": null,
        "billingCountry": "Hungary",
        "billingPostalCode": "H-1073",
        "total": 3.96
    },
    {
        "customerId": 49,
        "invoiceDate": "2012/08/28 00:00:00",
        "billingAddress": "Ordynacka 10",
        "billingCity": "Warsaw",
        "billingState": null,
        "billingCountry": "Poland",
        "billingPostalCode": "00-358",
        "total": 5.94
    },
    {
        "customerId": 55,
        "invoiceDate": "2012/08/31 00:00:00",
        "billingAddress": "421 Bourke Street",
        "billingCity": "Sidney",
        "billingState": "NSW",
        "billingCountry": "Australia",
        "billingPostalCode": "2010",
        "total": 8.91
    },
    {
        "customerId": 5,
        "invoiceDate": "2012/09/05 00:00:00",
        "billingAddress": "Klanova 9/506",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14700",
        "total": 16.86
    },
    {
        "customerId": 19,
        "invoiceDate": "2012/09/13 00:00:00",
        "billingAddress": "1 Infinite Loop",
        "billingCity": "Cupertino",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "95014",
        "total": 1.99
    },
    {
        "customerId": 20,
        "invoiceDate": "2012/09/26 00:00:00",
        "billingAddress": "541 Del Medio Avenue",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94040-111",
        "total": 3.98
    },
    {
        "customerId": 22,
        "invoiceDate": "2012/09/26 00:00:00",
        "billingAddress": "120 S Orange Ave",
        "billingCity": "Orlando",
        "billingState": "FL",
        "billingCountry": "USA",
        "billingPostalCode": "32801",
        "total": 3.98
    },
    {
        "customerId": 24,
        "invoiceDate": "2012/09/27 00:00:00",
        "billingAddress": "162 E Superior Street",
        "billingCity": "Chicago",
        "billingState": "IL",
        "billingCountry": "USA",
        "billingPostalCode": "60611",
        "total": 7.96
    },
    {
        "customerId": 28,
        "invoiceDate": "2012/09/28 00:00:00",
        "billingAddress": "302 S 700 E",
        "billingCity": "Salt Lake City",
        "billingState": "UT",
        "billingCountry": "USA",
        "billingPostalCode": "84102",
        "total": 11.94
    },
    {
        "customerId": 34,
        "invoiceDate": "2012/10/01 00:00:00",
        "billingAddress": "Rua da Assunção 53",
        "billingCity": "Lisbon",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 10.91
    },
    {
        "customerId": 43,
        "invoiceDate": "2012/10/06 00:00:00",
        "billingAddress": "68, Rue Jouvence",
        "billingCity": "Dijon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "21000",
        "total": 16.86
    },
    {
        "customerId": 57,
        "invoiceDate": "2012/10/14 00:00:00",
        "billingAddress": "Calle Lira, 198",
        "billingCity": "Santiago",
        "billingState": null,
        "billingCountry": "Chile",
        "billingPostalCode": null,
        "total": 0.99
    },
    {
        "customerId": 58,
        "invoiceDate": "2012/10/27 00:00:00",
        "billingAddress": "12,Community Centre",
        "billingCity": "Delhi",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "110017",
        "total": 1.98
    },
    {
        "customerId": 1,
        "invoiceDate": "2012/10/27 00:00:00",
        "billingAddress": "Av. Brigadeiro Faria Lima, 2170",
        "billingCity": "São José dos Campos",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "12227-000",
        "total": 1.98
    },
    {
        "customerId": 3,
        "invoiceDate": "2012/10/28 00:00:00",
        "billingAddress": "1498 rue Bélanger",
        "billingCity": "Montréal",
        "billingState": "QC",
        "billingCountry": "Canada",
        "billingPostalCode": "H2G 1A7",
        "total": 3.96
    },
    {
        "customerId": 7,
        "invoiceDate": "2012/10/29 00:00:00",
        "billingAddress": "Rotenturmstraße 4, 1010 Innere Stadt",
        "billingCity": "Vienne",
        "billingState": null,
        "billingCountry": "Austria",
        "billingPostalCode": "1010",
        "total": 5.94
    },
    {
        "customerId": 13,
        "invoiceDate": "2012/11/01 00:00:00",
        "billingAddress": "Qe 7 Bloco G",
        "billingCity": "Brasília",
        "billingState": "DF",
        "billingCountry": "Brazil",
        "billingPostalCode": "71020-677",
        "total": 8.91
    },
    {
        "customerId": 22,
        "invoiceDate": "2012/11/06 00:00:00",
        "billingAddress": "120 S Orange Ave",
        "billingCity": "Orlando",
        "billingState": "FL",
        "billingCountry": "USA",
        "billingPostalCode": "32801",
        "total": 13.86
    },
    {
        "customerId": 36,
        "invoiceDate": "2012/11/14 00:00:00",
        "billingAddress": "Tauentzienstraße 8",
        "billingCity": "Berlin",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "10789",
        "total": 0.99
    },
    {
        "customerId": 37,
        "invoiceDate": "2012/11/27 00:00:00",
        "billingAddress": "Berger Straße 10",
        "billingCity": "Frankfurt",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "60316",
        "total": 1.98
    },
    {
        "customerId": 39,
        "invoiceDate": "2012/11/27 00:00:00",
        "billingAddress": "4, Rue Milton",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75009",
        "total": 1.98
    },
    {
        "customerId": 41,
        "invoiceDate": "2012/11/28 00:00:00",
        "billingAddress": "11, Place Bellecour",
        "billingCity": "Lyon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "69002",
        "total": 3.96
    },
    {
        "customerId": 45,
        "invoiceDate": "2012/11/29 00:00:00",
        "billingAddress": "Erzsébet krt. 58.",
        "billingCity": "Budapest",
        "billingState": null,
        "billingCountry": "Hungary",
        "billingPostalCode": "H-1073",
        "total": 5.94
    },
    {
        "customerId": 51,
        "invoiceDate": "2012/12/02 00:00:00",
        "billingAddress": "Celsiusg. 9",
        "billingCity": "Stockholm",
        "billingState": null,
        "billingCountry": "Sweden",
        "billingPostalCode": "11230",
        "total": 8.91
    },
    {
        "customerId": 1,
        "invoiceDate": "2012/12/07 00:00:00",
        "billingAddress": "Av. Brigadeiro Faria Lima, 2170",
        "billingCity": "São José dos Campos",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "12227-000",
        "total": 13.86
    },
    {
        "customerId": 15,
        "invoiceDate": "2012/12/15 00:00:00",
        "billingAddress": "700 W Pender Street",
        "billingCity": "Vancouver",
        "billingState": "BC",
        "billingCountry": "Canada",
        "billingPostalCode": "V6C 1G8",
        "total": 0.99
    },
    {
        "customerId": 16,
        "invoiceDate": "2012/12/28 00:00:00",
        "billingAddress": "1600 Amphitheatre Parkway",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94043-1351",
        "total": 1.98
    },
    {
        "customerId": 18,
        "invoiceDate": "2012/12/28 00:00:00",
        "billingAddress": "627 Broadway",
        "billingCity": "New York",
        "billingState": "NY",
        "billingCountry": "USA",
        "billingPostalCode": "10012-2612",
        "total": 1.98
    },
    {
        "customerId": 20,
        "invoiceDate": "2012/12/29 00:00:00",
        "billingAddress": "541 Del Medio Avenue",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94040-111",
        "total": 3.96
    },
    {
        "customerId": 24,
        "invoiceDate": "2012/12/30 00:00:00",
        "billingAddress": "162 E Superior Street",
        "billingCity": "Chicago",
        "billingState": "IL",
        "billingCountry": "USA",
        "billingPostalCode": "60611",
        "total": 5.94
    },
    {
        "customerId": 30,
        "invoiceDate": "2013/01/02 00:00:00",
        "billingAddress": "230 Elgin Street",
        "billingCity": "Ottawa",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "K2P 1L7",
        "total": 8.91
    },
    {
        "customerId": 39,
        "invoiceDate": "2013/01/07 00:00:00",
        "billingAddress": "4, Rue Milton",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75009",
        "total": 13.86
    },
    {
        "customerId": 53,
        "invoiceDate": "2013/01/15 00:00:00",
        "billingAddress": "113 Lupus St",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "SW1V 3EN",
        "total": 0.99
    },
    {
        "customerId": 54,
        "invoiceDate": "2013/01/28 00:00:00",
        "billingAddress": "110 Raeburn Pl",
        "billingCity": "Edinburgh ",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "EH4 1HH",
        "total": 1.98
    },
    {
        "customerId": 56,
        "invoiceDate": "2013/01/28 00:00:00",
        "billingAddress": "307 Macacha Güemes",
        "billingCity": "Buenos Aires",
        "billingState": null,
        "billingCountry": "Argentina",
        "billingPostalCode": "1106",
        "total": 1.98
    },
    {
        "customerId": 58,
        "invoiceDate": "2013/01/29 00:00:00",
        "billingAddress": "12,Community Centre",
        "billingCity": "Delhi",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "110017",
        "total": 3.96
    },
    {
        "customerId": 3,
        "invoiceDate": "2013/01/30 00:00:00",
        "billingAddress": "1498 rue Bélanger",
        "billingCity": "Montréal",
        "billingState": "QC",
        "billingCountry": "Canada",
        "billingPostalCode": "H2G 1A7",
        "total": 5.94
    },
    {
        "customerId": 9,
        "invoiceDate": "2013/02/02 00:00:00",
        "billingAddress": "Sønder Boulevard 51",
        "billingCity": "Copenhagen",
        "billingState": null,
        "billingCountry": "Denmark",
        "billingPostalCode": "1720",
        "total": 8.91
    },
    {
        "customerId": 18,
        "invoiceDate": "2013/02/07 00:00:00",
        "billingAddress": "627 Broadway",
        "billingCity": "New York",
        "billingState": "NY",
        "billingCountry": "USA",
        "billingPostalCode": "10012-2612",
        "total": 13.86
    },
    {
        "customerId": 32,
        "invoiceDate": "2013/02/15 00:00:00",
        "billingAddress": "696 Osborne Street",
        "billingCity": "Winnipeg",
        "billingState": "MB",
        "billingCountry": "Canada",
        "billingPostalCode": "R3L 2B9",
        "total": 0.99
    },
    {
        "customerId": 33,
        "invoiceDate": "2013/02/28 00:00:00",
        "billingAddress": "5112 48 Street",
        "billingCity": "Yellowknife",
        "billingState": "NT",
        "billingCountry": "Canada",
        "billingPostalCode": "X1A 1N6",
        "total": 1.98
    },
    {
        "customerId": 35,
        "invoiceDate": "2013/02/28 00:00:00",
        "billingAddress": "Rua dos Campeões Europeus de Viena, 4350",
        "billingCity": "Porto",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 1.98
    },
    {
        "customerId": 37,
        "invoiceDate": "2013/03/01 00:00:00",
        "billingAddress": "Berger Straße 10",
        "billingCity": "Frankfurt",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "60316",
        "total": 3.96
    },
    {
        "customerId": 41,
        "invoiceDate": "2013/03/02 00:00:00",
        "billingAddress": "11, Place Bellecour",
        "billingCity": "Lyon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "69002",
        "total": 5.94
    },
    {
        "customerId": 47,
        "invoiceDate": "2013/03/05 00:00:00",
        "billingAddress": "Via Degli Scipioni, 43",
        "billingCity": "Rome",
        "billingState": "RM",
        "billingCountry": "Italy",
        "billingPostalCode": "00192",
        "total": 8.91
    },
    {
        "customerId": 56,
        "invoiceDate": "2013/03/10 00:00:00",
        "billingAddress": "307 Macacha Güemes",
        "billingCity": "Buenos Aires",
        "billingState": null,
        "billingCountry": "Argentina",
        "billingPostalCode": "1106",
        "total": 13.86
    },
    {
        "customerId": 11,
        "invoiceDate": "2013/03/18 00:00:00",
        "billingAddress": "Av. Paulista, 2022",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01310-200",
        "total": 0.99
    },
    {
        "customerId": 12,
        "invoiceDate": "2013/03/31 00:00:00",
        "billingAddress": "Praça Pio X, 119",
        "billingCity": "Rio de Janeiro",
        "billingState": "RJ",
        "billingCountry": "Brazil",
        "billingPostalCode": "20040-020",
        "total": 1.98
    },
    {
        "customerId": 14,
        "invoiceDate": "2013/03/31 00:00:00",
        "billingAddress": "8210 111 ST NW",
        "billingCity": "Edmonton",
        "billingState": "AB",
        "billingCountry": "Canada",
        "billingPostalCode": "T6G 2C7",
        "total": 1.98
    },
    {
        "customerId": 16,
        "invoiceDate": "2013/04/01 00:00:00",
        "billingAddress": "1600 Amphitheatre Parkway",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94043-1351",
        "total": 3.96
    },
    {
        "customerId": 20,
        "invoiceDate": "2013/04/02 00:00:00",
        "billingAddress": "541 Del Medio Avenue",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94040-111",
        "total": 5.94
    },
    {
        "customerId": 26,
        "invoiceDate": "2013/04/05 00:00:00",
        "billingAddress": "2211 W Berry Street",
        "billingCity": "Fort Worth",
        "billingState": "TX",
        "billingCountry": "USA",
        "billingPostalCode": "76110",
        "total": 8.91
    },
    {
        "customerId": 35,
        "invoiceDate": "2013/04/10 00:00:00",
        "billingAddress": "Rua dos Campeões Europeus de Viena, 4350",
        "billingCity": "Porto",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 13.86
    },
    {
        "customerId": 49,
        "invoiceDate": "2013/04/18 00:00:00",
        "billingAddress": "Ordynacka 10",
        "billingCity": "Warsaw",
        "billingState": null,
        "billingCountry": "Poland",
        "billingPostalCode": "00-358",
        "total": 0.99
    },
    {
        "customerId": 50,
        "invoiceDate": "2013/05/01 00:00:00",
        "billingAddress": "C/ San Bernardo 85",
        "billingCity": "Madrid",
        "billingState": null,
        "billingCountry": "Spain",
        "billingPostalCode": "28015",
        "total": 1.98
    },
    {
        "customerId": 52,
        "invoiceDate": "2013/05/01 00:00:00",
        "billingAddress": "202 Hoxton Street",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "N1 5LH",
        "total": 1.98
    },
    {
        "customerId": 54,
        "invoiceDate": "2013/05/02 00:00:00",
        "billingAddress": "110 Raeburn Pl",
        "billingCity": "Edinburgh ",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "EH4 1HH",
        "total": 3.96
    },
    {
        "customerId": 58,
        "invoiceDate": "2013/05/03 00:00:00",
        "billingAddress": "12,Community Centre",
        "billingCity": "Delhi",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "110017",
        "total": 5.94
    },
    {
        "customerId": 5,
        "invoiceDate": "2013/05/06 00:00:00",
        "billingAddress": "Klanova 9/506",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14700",
        "total": 8.91
    },
    {
        "customerId": 14,
        "invoiceDate": "2013/05/11 00:00:00",
        "billingAddress": "8210 111 ST NW",
        "billingCity": "Edmonton",
        "billingState": "AB",
        "billingCountry": "Canada",
        "billingPostalCode": "T6G 2C7",
        "total": 13.86
    },
    {
        "customerId": 28,
        "invoiceDate": "2013/05/19 00:00:00",
        "billingAddress": "302 S 700 E",
        "billingCity": "Salt Lake City",
        "billingState": "UT",
        "billingCountry": "USA",
        "billingPostalCode": "84102",
        "total": 0.99
    },
    {
        "customerId": 29,
        "invoiceDate": "2013/06/01 00:00:00",
        "billingAddress": "796 Dundas Street West",
        "billingCity": "Toronto",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "M6J 1V1",
        "total": 1.98
    },
    {
        "customerId": 31,
        "invoiceDate": "2013/06/01 00:00:00",
        "billingAddress": "194A Chain Lake Drive",
        "billingCity": "Halifax",
        "billingState": "NS",
        "billingCountry": "Canada",
        "billingPostalCode": "B3S 1C5",
        "total": 1.98
    },
    {
        "customerId": 33,
        "invoiceDate": "2013/06/02 00:00:00",
        "billingAddress": "5112 48 Street",
        "billingCity": "Yellowknife",
        "billingState": "NT",
        "billingCountry": "Canada",
        "billingPostalCode": "X1A 1N6",
        "total": 3.96
    },
    {
        "customerId": 37,
        "invoiceDate": "2013/06/03 00:00:00",
        "billingAddress": "Berger Straße 10",
        "billingCity": "Frankfurt",
        "billingState": null,
        "billingCountry": "Germany",
        "billingPostalCode": "60316",
        "total": 5.94
    },
    {
        "customerId": 43,
        "invoiceDate": "2013/06/06 00:00:00",
        "billingAddress": "68, Rue Jouvence",
        "billingCity": "Dijon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "21000",
        "total": 8.91
    },
    {
        "customerId": 52,
        "invoiceDate": "2013/06/11 00:00:00",
        "billingAddress": "202 Hoxton Street",
        "billingCity": "London",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "N1 5LH",
        "total": 13.86
    },
    {
        "customerId": 7,
        "invoiceDate": "2013/06/19 00:00:00",
        "billingAddress": "Rotenturmstraße 4, 1010 Innere Stadt",
        "billingCity": "Vienne",
        "billingState": null,
        "billingCountry": "Austria",
        "billingPostalCode": "1010",
        "total": 0.99
    },
    {
        "customerId": 8,
        "invoiceDate": "2013/07/02 00:00:00",
        "billingAddress": "Grétrystraat 63",
        "billingCity": "Brussels",
        "billingState": null,
        "billingCountry": "Belgium",
        "billingPostalCode": "1000",
        "total": 1.98
    },
    {
        "customerId": 10,
        "invoiceDate": "2013/07/02 00:00:00",
        "billingAddress": "Rua Dr. Falcão Filho, 155",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01007-010",
        "total": 1.98
    },
    {
        "customerId": 12,
        "invoiceDate": "2013/07/03 00:00:00",
        "billingAddress": "Praça Pio X, 119",
        "billingCity": "Rio de Janeiro",
        "billingState": "RJ",
        "billingCountry": "Brazil",
        "billingPostalCode": "20040-020",
        "total": 3.96
    },
    {
        "customerId": 16,
        "invoiceDate": "2013/07/04 00:00:00",
        "billingAddress": "1600 Amphitheatre Parkway",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94043-1351",
        "total": 5.94
    },
    {
        "customerId": 22,
        "invoiceDate": "2013/07/07 00:00:00",
        "billingAddress": "120 S Orange Ave",
        "billingCity": "Orlando",
        "billingState": "FL",
        "billingCountry": "USA",
        "billingPostalCode": "32801",
        "total": 8.91
    },
    {
        "customerId": 31,
        "invoiceDate": "2013/07/12 00:00:00",
        "billingAddress": "194A Chain Lake Drive",
        "billingCity": "Halifax",
        "billingState": "NS",
        "billingCountry": "Canada",
        "billingPostalCode": "B3S 1C5",
        "total": 13.86
    },
    {
        "customerId": 45,
        "invoiceDate": "2013/07/20 00:00:00",
        "billingAddress": "Erzsébet krt. 58.",
        "billingCity": "Budapest",
        "billingState": null,
        "billingCountry": "Hungary",
        "billingPostalCode": "H-1073",
        "total": 0.99
    },
    {
        "customerId": 46,
        "invoiceDate": "2013/08/02 00:00:00",
        "billingAddress": "3 Chatham Street",
        "billingCity": "Dublin",
        "billingState": "Dublin",
        "billingCountry": "Ireland",
        "billingPostalCode": null,
        "total": 1.98
    },
    {
        "customerId": 48,
        "invoiceDate": "2013/08/02 00:00:00",
        "billingAddress": "Lijnbaansgracht 120bg",
        "billingCity": "Amsterdam",
        "billingState": "VV",
        "billingCountry": "Netherlands",
        "billingPostalCode": "1016",
        "total": 1.98
    },
    {
        "customerId": 50,
        "invoiceDate": "2013/08/03 00:00:00",
        "billingAddress": "C/ San Bernardo 85",
        "billingCity": "Madrid",
        "billingState": null,
        "billingCountry": "Spain",
        "billingPostalCode": "28015",
        "total": 3.96
    },
    {
        "customerId": 54,
        "invoiceDate": "2013/08/04 00:00:00",
        "billingAddress": "110 Raeburn Pl",
        "billingCity": "Edinburgh ",
        "billingState": null,
        "billingCountry": "United Kingdom",
        "billingPostalCode": "EH4 1HH",
        "total": 5.94
    },
    {
        "customerId": 1,
        "invoiceDate": "2013/08/07 00:00:00",
        "billingAddress": "Av. Brigadeiro Faria Lima, 2170",
        "billingCity": "São José dos Campos",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "12227-000",
        "total": 8.91
    },
    {
        "customerId": 10,
        "invoiceDate": "2013/08/12 00:00:00",
        "billingAddress": "Rua Dr. Falcão Filho, 155",
        "billingCity": "São Paulo",
        "billingState": "SP",
        "billingCountry": "Brazil",
        "billingPostalCode": "01007-010",
        "total": 13.86
    },
    {
        "customerId": 24,
        "invoiceDate": "2013/08/20 00:00:00",
        "billingAddress": "162 E Superior Street",
        "billingCity": "Chicago",
        "billingState": "IL",
        "billingCountry": "USA",
        "billingPostalCode": "60611",
        "total": 0.99
    },
    {
        "customerId": 25,
        "invoiceDate": "2013/09/02 00:00:00",
        "billingAddress": "319 N. Frances Street",
        "billingCity": "Madison",
        "billingState": "WI",
        "billingCountry": "USA",
        "billingPostalCode": "53703",
        "total": 1.98
    },
    {
        "customerId": 27,
        "invoiceDate": "2013/09/02 00:00:00",
        "billingAddress": "1033 N Park Ave",
        "billingCity": "Tucson",
        "billingState": "AZ",
        "billingCountry": "USA",
        "billingPostalCode": "85719",
        "total": 1.98
    },
    {
        "customerId": 29,
        "invoiceDate": "2013/09/03 00:00:00",
        "billingAddress": "796 Dundas Street West",
        "billingCity": "Toronto",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "M6J 1V1",
        "total": 3.96
    },
    {
        "customerId": 33,
        "invoiceDate": "2013/09/04 00:00:00",
        "billingAddress": "5112 48 Street",
        "billingCity": "Yellowknife",
        "billingState": "NT",
        "billingCountry": "Canada",
        "billingPostalCode": "X1A 1N6",
        "total": 5.94
    },
    {
        "customerId": 39,
        "invoiceDate": "2013/09/07 00:00:00",
        "billingAddress": "4, Rue Milton",
        "billingCity": "Paris",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "75009",
        "total": 8.91
    },
    {
        "customerId": 48,
        "invoiceDate": "2013/09/12 00:00:00",
        "billingAddress": "Lijnbaansgracht 120bg",
        "billingCity": "Amsterdam",
        "billingState": "VV",
        "billingCountry": "Netherlands",
        "billingPostalCode": "1016",
        "total": 13.86
    },
    {
        "customerId": 3,
        "invoiceDate": "2013/09/20 00:00:00",
        "billingAddress": "1498 rue Bélanger",
        "billingCity": "Montréal",
        "billingState": "QC",
        "billingCountry": "Canada",
        "billingPostalCode": "H2G 1A7",
        "total": 0.99
    },
    {
        "customerId": 4,
        "invoiceDate": "2013/10/03 00:00:00",
        "billingAddress": "Ullevålsveien 14",
        "billingCity": "Oslo",
        "billingState": null,
        "billingCountry": "Norway",
        "billingPostalCode": "0171",
        "total": 1.98
    },
    {
        "customerId": 6,
        "invoiceDate": "2013/10/03 00:00:00",
        "billingAddress": "Rilská 3174/6",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14300",
        "total": 1.98
    },
    {
        "customerId": 8,
        "invoiceDate": "2013/10/04 00:00:00",
        "billingAddress": "Grétrystraat 63",
        "billingCity": "Brussels",
        "billingState": null,
        "billingCountry": "Belgium",
        "billingPostalCode": "1000",
        "total": 3.96
    },
    {
        "customerId": 12,
        "invoiceDate": "2013/10/05 00:00:00",
        "billingAddress": "Praça Pio X, 119",
        "billingCity": "Rio de Janeiro",
        "billingState": "RJ",
        "billingCountry": "Brazil",
        "billingPostalCode": "20040-020",
        "total": 5.94
    },
    {
        "customerId": 18,
        "invoiceDate": "2013/10/08 00:00:00",
        "billingAddress": "627 Broadway",
        "billingCity": "New York",
        "billingState": "NY",
        "billingCountry": "USA",
        "billingPostalCode": "10012-2612",
        "total": 8.91
    },
    {
        "customerId": 27,
        "invoiceDate": "2013/10/13 00:00:00",
        "billingAddress": "1033 N Park Ave",
        "billingCity": "Tucson",
        "billingState": "AZ",
        "billingCountry": "USA",
        "billingPostalCode": "85719",
        "total": 13.86
    },
    {
        "customerId": 41,
        "invoiceDate": "2013/10/21 00:00:00",
        "billingAddress": "11, Place Bellecour",
        "billingCity": "Lyon",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "69002",
        "total": 0.99
    },
    {
        "customerId": 42,
        "invoiceDate": "2013/11/03 00:00:00",
        "billingAddress": "9, Place Louis Barthou",
        "billingCity": "Bordeaux",
        "billingState": null,
        "billingCountry": "France",
        "billingPostalCode": "33000",
        "total": 1.98
    },
    {
        "customerId": 44,
        "invoiceDate": "2013/11/03 00:00:00",
        "billingAddress": "Porthaninkatu 9",
        "billingCity": "Helsinki",
        "billingState": null,
        "billingCountry": "Finland",
        "billingPostalCode": "00530",
        "total": 1.98
    },
    {
        "customerId": 46,
        "invoiceDate": "2013/11/04 00:00:00",
        "billingAddress": "3 Chatham Street",
        "billingCity": "Dublin",
        "billingState": "Dublin",
        "billingCountry": "Ireland",
        "billingPostalCode": null,
        "total": 3.96
    },
    {
        "customerId": 50,
        "invoiceDate": "2013/11/05 00:00:00",
        "billingAddress": "C/ San Bernardo 85",
        "billingCity": "Madrid",
        "billingState": null,
        "billingCountry": "Spain",
        "billingPostalCode": "28015",
        "total": 5.94
    },
    {
        "customerId": 56,
        "invoiceDate": "2013/11/08 00:00:00",
        "billingAddress": "307 Macacha Güemes",
        "billingCity": "Buenos Aires",
        "billingState": null,
        "billingCountry": "Argentina",
        "billingPostalCode": "1106",
        "total": 8.91
    },
    {
        "customerId": 6,
        "invoiceDate": "2013/11/13 00:00:00",
        "billingAddress": "Rilská 3174/6",
        "billingCity": "Prague",
        "billingState": null,
        "billingCountry": "Czech Republic",
        "billingPostalCode": "14300",
        "total": 25.86
    },
    {
        "customerId": 20,
        "invoiceDate": "2013/11/21 00:00:00",
        "billingAddress": "541 Del Medio Avenue",
        "billingCity": "Mountain View",
        "billingState": "CA",
        "billingCountry": "USA",
        "billingPostalCode": "94040-111",
        "total": 0.99
    },
    {
        "customerId": 21,
        "invoiceDate": "2013/12/04 00:00:00",
        "billingAddress": "801 W 4th Street",
        "billingCity": "Reno",
        "billingState": "NV",
        "billingCountry": "USA",
        "billingPostalCode": "89503",
        "total": 1.98
    },
    {
        "customerId": 23,
        "invoiceDate": "2013/12/04 00:00:00",
        "billingAddress": "69 Salem Street",
        "billingCity": "Boston",
        "billingState": "MA",
        "billingCountry": "USA",
        "billingPostalCode": "2113",
        "total": 1.98
    },
    {
        "customerId": 25,
        "invoiceDate": "2013/12/05 00:00:00",
        "billingAddress": "319 N. Frances Street",
        "billingCity": "Madison",
        "billingState": "WI",
        "billingCountry": "USA",
        "billingPostalCode": "53703",
        "total": 3.96
    },
    {
        "customerId": 29,
        "invoiceDate": "2013/12/06 00:00:00",
        "billingAddress": "796 Dundas Street West",
        "billingCity": "Toronto",
        "billingState": "ON",
        "billingCountry": "Canada",
        "billingPostalCode": "M6J 1V1",
        "total": 5.94
    },
    {
        "customerId": 35,
        "invoiceDate": "2013/12/09 00:00:00",
        "billingAddress": "Rua dos Campeões Europeus de Viena, 4350",
        "billingCity": "Porto",
        "billingState": null,
        "billingCountry": "Portugal",
        "billingPostalCode": null,
        "total": 8.91
    },
    {
        "customerId": 44,
        "invoiceDate": "2013/12/14 00:00:00",
        "billingAddress": "Porthaninkatu 9",
        "billingCity": "Helsinki",
        "billingState": null,
        "billingCountry": "Finland",
        "billingPostalCode": "00530",
        "total": 13.86
    },
    {
        "customerId": 58,
        "invoiceDate": "2013/12/22 00:00:00",
        "billingAddress": "12,Community Centre",
        "billingCity": "Delhi",
        "billingState": null,
        "billingCountry": "India",
        "billingPostalCode": "110017",
        "total": 1.99
    }
]
''';
final invoices = (jsonDecode(_jsonInvoices) as List).map(
  (e) => Invoice.fromJsonDB(e),
);
