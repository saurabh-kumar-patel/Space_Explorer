import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../view_model/provider/url_luncher.dart';

class Sun extends StatelessWidget {
  const Sun({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Backcolor,
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
                      "assets/Suning/sun1.jpg",
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
                          "The Sun",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "The Sun is the star at the heart of our solar system. Its gravity holds the solar system together, keeping everything — from the biggest planets to the smallest bits of debris — in its orbit.",
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
                "OverView",
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
                "The Sun's gravity holds the solar system together, keeping everything – from the biggest planets to the smallest particles of debris – in its orbit. The connection and interactions between the Sun and Earth drive the seasons, ocean currents, weather, climate, radiation belts and auroras. Though it is special to us, there are billions of stars like our Sun scattered across the Milky Way galaxy.",
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
                "The Sun has many names in many cultures. The Latin word for Sun is “sol,” which is the main adjective for all things Sun-related: solar.",
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
                "Facts about the Sun",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Image(image: AssetImage("assets/Suning/lifecycle.png")),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "1. The Sun goes through ups and downs in activity like solar flares. It gets more active with more sunspots and then less active over a period of 11 years. This is called the solar cycle.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "2. The Sun has been getting slowly brighter since it was born. A couple of billions of years ago, the Sun was a little dimmer than it is now.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "3. The Sun contains almost ALL of the material in our solar system. 99% of it. All the planets, asteroids and comets add up to less than 1% of the total.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "4.The Sun is so far away that it takes light about 8 minutes and 20 seconds for it to get to us – and light is the fastest thing in the universe.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "5. the Sun’s core is the hottest part of all, at a sizzling 27 million degrees Fahrenheit!",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "6. Our Sun is about 100 times wider than Earth, but it is just an average sized star. Astronomers have found some stars that are 100 times bigger than the Sun and others that are 10 times smaller. ",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () =>
                      launchLink("https://science.nasa.gov/sun/stories/"),
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
