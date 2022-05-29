import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

import 'carousel_card.dart';

// import '../api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Future<Quotes> futureAlbum;

  // @override
  // void initState() {
  //   super.initState();
  //   futureAlbum = fetchQuote();
  // }
  List<Quote> quotesList = [];
  Future<List<Quote>> getQuotes() async {
    final response = await http.get(
        Uri.parse("https://mr-robot-quotes.herokuapp.com/quotes-api/api/"));
    var jsonData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in jsonData) {
        Quote quote = Quote(
            id: i["id"],
            quote: i["quote"],
            speaker: i["speaker"],
            image: i["pic"]);
        quotesList.add(quote);
      }
      return quotesList;
    } else {
      return quotesList;
    }
  }

  //   for (var q in jsonData) {
  //     Quote quote = Quote(
  //         id: q['id'],
  //         quote: q['quote'],
  //         speaker: q['speaker'],
  //         image: q['image']);
  //     quotes.add(quote);
  //   }
  //   print(quotes.length);
  //   return quotes;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(221, 46, 45, 45),
        appBar: AppBar(
          title: Text(
            "Mr.Robot",
            style: TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getQuotes(),
                builder: (context, AsyncSnapshot<List<Quote>> snapshot) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CarouselSlider.builder(
                      itemCount: quotesList.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              Container(
                                height: 300,
                                color: Colors.amber,
                                child: Text(snapshot.data![itemIndex].quote),
                              ),
                              Container(
                                height: 20,
                                color: Colors.amber,
                                child: Text("- lorem "),
                              ),
                            ],
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.75,
                        // aspectRatio: 16 / 9,
                        // viewportFraction: 0.8,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}

class Quote {
  final String id;
  final String quote;
  final String speaker;
  final String image;

  const Quote({
    required this.id,
    required this.quote,
    required this.speaker,
    required this.image,
  });
}
