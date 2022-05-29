// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<Quotes> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://mr-robot-quotes.herokuapp.com/quotes-api/api/'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Quotes.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load Quotes');
//   }
// }
// var url = Uri.parse('https://example.com/whatsit/create');
// var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
// print('Response status: ${response.statusCode}');
// print('Response body: ${response.body}');

// print(await http.read(Uri.parse('https://example.com/foobar.txt')));
// class Quotes {
//   final String id;
//   final String quote;
//   final String speaker;
//   final String image;

//   const Quotes({
//     required this.id,
//     required this.quote,
//     required this.speaker,
//     required this.image,
//   });

//   factory Quotes.fromJson(List<Map<String, dynamic>> json) {
//     return Quotes(
//       id: json[0]['id'],
//       quote: json[1]['quote'],
//       speaker: json[2]['speaker'],
//       image: json[3]['pic'],
//     );
//   }
// }

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<Quotes> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Quotes>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data!.quote);
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
