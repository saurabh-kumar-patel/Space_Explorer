import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../../view_model/provider/url_luncher.dart';

class Mercury extends StatelessWidget {
  const Mercury({super.key});

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
                      "assets/mercury.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 40, 0, 0),
                        child: Text(
                          "Mercury",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "Mercury is the closest planet to the Sun, and the smallest planet in our solar system. It's only slightly larger than Earth's Moon.",
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
                "Mercury Facts",
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
                "Mercury is the smallest planet in our solar system and nearest to the Sun. It's only slightly larger than Earth's Moon. From the surface of Mercury, the Sun would appear more than three times as large as it does when viewed from Earth, and the sunlight would be as much as seven times brighter.",
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
                "assets/Suning/mercury.webp",
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Mercury's surface temperatures are both extremely hot and cold. Because the planet is so close to the Sun, day temperatures can reach highs of 800°F (430°C). Without an atmosphere to retain that heat at night, temperatures can dip as low as -290°F (-180°C).",
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
                "Despite its proximity to the Sun, Mercury is not the hottest planet in our solar system – that title belongs to nearby Venus, thanks to its dense atmosphere. But Mercury is the fastest planet, zipping around the Sun every 88 Earth days.",
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
                "Potential for Life",
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
                "Mercury's environment is not conducive to life as we know it. The temperatures and solar radiation that characterize this planet are most likely too extreme for organisms to adapt to.",
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
                "Size and Distance",
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
                "With a radius of 1,516 miles (2,440 kilometers), Mercury is a little more than 1/3 the width of Earth. If Earth were the size of a nickel, Mercury would be about as big as a blueberry.",
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
                "From an average distance of 36 million miles (58 million kilometers), Mercury is 0.4 astronomical units away from the Sun. One astronomical unit (abbreviated as AU), is the distance from the Sun to Earth. From this distance, it takes sunlight 3.2 minutes to travel from the Sun to Mercury.",
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
                "1. Mercury is the smallest planet in our solar system.\n  2.Mercury is a terrestrial planet. It is small and rocky.\n3.Mercury has a thin exosphere.\n4.Mercury’s surface can be as hot as 800 degrees F during the daytime and as cold as -300 degrees F during the nighttime. (But Mercury is not the hottest planet in the solar system. The hottest planet is Venus.)\n5.Mercury’s poles have water-ice.",
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
                "Time on Mercury",
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
                "1.A day on Mercury lasts 59 Earth days.\n2.A year on Mercury lasts 88 Earth days.",
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
                "Mercury’s Neighbors",
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
                "Mercury does not have any moons.\nMercury is the closest planet to the Sun.\nVenus is Mercury’s neighboring planet.",
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
                "1.Mercury has been known since ancient times because it can be seen without advanced telescopes.\n2.Because it is so close to the Sun, Mercury is hard to study from Earth. No people have ever gone to Mercury, but two robotic spacecraft have visited. The spacecraft were called Mariner 10 and MESSENGER.\n3.MESSENGER mapped Mercury by taking pictures of the planet's surface, including some areas that had not been seen before. It also collected information about what the surface and insides of Mercury are made of.",
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
                      "https://science.nasa.gov/solar-system/resources/resource-packages/mercury-resources/"),
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
