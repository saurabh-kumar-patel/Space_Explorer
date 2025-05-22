import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../../view_model/provider/url_luncher.dart';

class Earth extends StatelessWidget {
  const Earth({super.key});

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
                      "assets/earth.png",
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
                          "Earth",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "Earth – our home planet – is the third planet from the Sun, and the fifth largest planet. It's the only place we know of inhabited by living things.",
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
            Text(
              "QUICK FACTS",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 20,
                children: [
                  SizedBox(
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Length Of Day",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "23.9 hours",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Length Of Year",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "365.25 days",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Distance From Sun",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "93,327,712miles/150,196,428km",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Divider(
                            thickness: 1,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "One Way Light Time To Sun",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "8.350022 minutes",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "8 Need-to-Know Things About Our Home Planet",
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
                "1. Measuring Up If the Sun were as tall as a typical front door, Earth would be the size of a nickel.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "2. We're On It Earth is a rocky planet with a solid and dynamic surface of mountains, canyons, plains and more. Most of our planet is covered in water.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "3. Breathe Easy Earth's atmosphere is 78% nitrogen, 21% oxygen and 1% other ingredients. It's the perfect balance for us to breathe and live.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "4. Our Cosmic Companion Earth has one moon.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "5. Ringless Earth has no rings.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "6. Orbital Science Many orbiting spacecraft study the Earth from above as a whole system — observing the atmosphere, ocean, glaciers, and the solid earth.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "7. Home, Sweet Home Earth is the perfect place for life as we know it.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "8. Protective Shield Our atmosphere protects us from incoming meteoroids, most of which break up in our atmosphere before they can strike the surface.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Since we live here, you might think we know all there is to know about Earth. Not at all, actually! We have a lot we can learn about our home planet. Right now, there are many satellites orbiting Earth taking pictures and measurements. This is how we can learn more about weather, oceans, soil, climate change, and many other important topics.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                "assets/Suning/life.png",
                fit: BoxFit.cover,
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
                "1. Earth is a terrestrial planet. It is small and rocky.2. Earth's atmosphere is the right thickness to keep the planet warm so living things like us can be there. It’s the only planet in our solar system we know of that supports life. It is mostly nitrogen, and it has plenty of oxygen for us to breathe. ",
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
                "Time on Earth",
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
                "1.A day on Earth lasts a little under 24 hours.2. One year on Earth lasts 365.25 days. That 0.25 extra means every four years we need to add one day to our calendar. We call it a leap day (in a leap year).",
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
                "Earth’s Neighbors",
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
                "1.Earth has just one Moon. It is the only planet to have just one moon.\n2. Earth has lots of spacecraft watching it. There is still a lot we can learn about our home planet.\n 3. Earth is the third planet from the Sun in our solar system. That means Venus and Mars are Earth’s neighboring planets. ",
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
                "1.We have known about our planet since ancient times, of course. But we didn’t know our place in the solar system for a long time.",
                style: TextStyle(
                  color: Textcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () =>
                      launchLink("https://science.nasa.gov/earth/multimedia/"),
                  child: const Text(
                    "Multimedia & Galleries",
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
