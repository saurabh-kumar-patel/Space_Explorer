import 'dart:math';

import 'package:apod/view/pages/isro_page/isro_page.dart';
import 'package:apod/view/pages/spaceX/spacex_page.dart';

import 'package:apod/view/pages/universe/explore_universe.dart';
import 'package:apod/widget/card.dart';
import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';

import '../../view_model/provider/url_luncher.dart';
import 'apod_page.dart';

import 'nasa/nasa_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Backcolor,
      appBar: AppBar(
        backgroundColor: NavBarcolor,
        iconTheme: const IconThemeData(color: Textcolor, size: 25, weight: 25),
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
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExploreUniverse(),
                    )),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: min(MediaQuery.of(context).size.width * 0.6, 600),
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
                              color: Textcolor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "EXPLORE SPACE ORGANIZATION",
                style: TextStyle(
                    color: Textcolor,
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
                        builder: (context) => const IsroScreen(),
                      ),
                    ),
                    child: const CardWidget(
                      image: 'assets/isro.jpeg',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NASAPage())),
                  child: const CardWidget(
                    image: 'assets/nasa.jpg',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SpaceXPage(),
                        )),
                    child: const CardWidget(
                      image: 'assets/X.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => launchLink(
                        "https://eyes.nasa.gov/apps/solar-system/#/home?embed=true"),
                    child: const CardWidget(
                      image: 'assets/stars.jpeg',
                      title: "3D view",
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Image",
                style: TextStyle(
                    color: Textcolor,
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
                    child: const CardWidget(
                      title: "Nasa Astronomy Picture of the Day",
                      image: 'assets/thunder.jpg',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
