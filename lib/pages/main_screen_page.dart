import 'dart:math';

import 'package:apod/pages/isro_page/isro.dart';
import 'package:apod/widget/card.dart';
import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'apod_page.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Backcolor,
      appBar: AppBar(
        backgroundColor:NavBarcolor,
        title: const Text(
          "S p a c e  E x p l o r e r",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: min(MediaQuery.of(context).size.width * 0.6,600),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/nebula.jpg",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                      ),
                    ),
                    const Center(
                      child: Text(
                        "EXPLORE THE UNIVERSE",
                        style: TextStyle(
                            color:Textcolor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "EXPLORE SPACE ORGANIZATION",
                style: TextStyle(
                    color:Textcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IsroPage(),
                      ),
                    ),
                    child: CardWidget(
                      image: 'assets/isro.jpeg',
                    ),
                  ),
                ),
                CardWidget(
                  image: 'assets/nasa.jpg',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CardWidget(
                image: 'assets/X.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Image",
                style: TextStyle(
                    color:Textcolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ApodPage())),
                    child: CardWidget(
                      title: "A P O D",
                      image: 'assets/thunder.jpg',
                    ),
                  ),
                ),
                CardWidget(
                  title: 'Mars Rover Image',
                  image: 'assets/rover.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
