import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CarouselSlider.builder(
            itemCount: 15,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
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
                      child: Text(
                          "lorem ipsum kjsdhgkj vsajd glkj kjsab lkjgblk agkjb akj bkj kllk    "),
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
            ),
          ),
        ));
  }
}
