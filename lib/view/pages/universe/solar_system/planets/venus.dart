import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../../view_model/provider/url_luncher.dart';

class Venus extends StatelessWidget {
  const Venus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 2,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset(
                      "assets/venus.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 40, 0, 0),
                        child: Text(
                          "Venus",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "Venus is the second planet from the Sun, and the sixth largest planet. It’s the hottest planet in our solar system.",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Venus Facts",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Venus is the second planet from the Sun, and our closest planetary neighbor. It's the hottest planet in our solar system, and is sometimes called Earth's twin.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Introduction",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                "assets/Suning/venus2.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Venus is the second planet from the Sun, and Earth's closest planetary neighbor. Venus is the third brightest object in the sky after the Sun and Moon. Venus spins slowly in the opposite direction from most planets.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Venus is similar in structure and size to Earth, and is sometimes called Earth's evil twin. Its thick atmosphere traps heat in a runaway greenhouse effect, making it the hottest planet in our solar system with surface temperatures hot enough to melt lead. Below the dense, persistent clouds, the surface has volcanoes and deformed mountains.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "Structure and Surface",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "1. Venus is the hottest planet in our solar system.\n  2.Venus is a terrestrial planet. It is small and rocky.\n3.Venus has a thick atmosphere. It traps heat and makes Venus very hot.\n4.Venus has an active surface, including volcanoes!\n5.Venus spins the opposite direction of Earth and most other planets.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Time on Venus",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "1.A day on Venus lasts 243 Earth days.\n2.A year on Venus lasts 225 Earth days",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Venus’s Neighbors",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "1.Venus does not have any moons.\n2.Venus is the second planet from the Sun. That means Mercury and Earth are Venus's neighboring planets.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Quick History",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "1.Venus has been known since ancient times because it can be seen easily without a telescope.\n2.Venus has been visited by several spacecraft: Mariner 2, Mariner 5, Mariner 10, Pioneer Venus 1, Pioneer Venus 2, and an orbiter called Magellan.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () => launchLink(
                      "https://science.nasa.gov/solar-system/resources/resource-packages/venus-resources/"),
                  child: const Text(
                    "Read More Article...",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
