import 'package:flutter/material.dart';

import '../../../../view_model/provider/url_luncher.dart';
import '../../../../widget/custom_theme/theme.dart';

class GalaxyScreens extends StatelessWidget {
  const GalaxyScreens({super.key});

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
                        "assets/galaxies.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Galaxy Basics",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "Galaxies consist of stars, planets, and vast clouds of gas and dust, all bound together by gravity. The largest contain trillions of stars and can be more than a million light-years across. The smallest can contain a few thousand stars and span just a few hundred light-years. Most large galaxies have supermassive black holes at their centers, some with billions of times the Sun’s mass.",
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
                  "Galaxies come in a variety of shapes, mostly spirals and ellipticals, as well as those with less orderly appearances, usually dubbed irregular.\n \nMost galaxies are between 10 billion and 13.6 billion years old. Some are almost as old as the universe itself, which formed around 13.8 billion years ago. Astronomers think the youngest known galaxy formed approximately 500 million years ago.",
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
                  "Galaxies can organize into groups of about 100 or fewer members held together by their mutual gravity. Larger structures, called clusters, may contain thousands of galaxies. Groups and clusters can be arranged in superclusters, which are not gravitationally bound. Superclusters, empty voids, “walls” of galaxies, and other large-scale structures make up the cosmic web of matter in the universe.",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "Our Milky Way",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "Our home galaxy is called the Milky Way. It’s a spiral galaxy with a disk of stars spanning more than 100,000 light-years. Earth is located along one of the galaxy’s spiral arms, about halfway from the center. Our solar system takes about 240 million years to orbit the Milky Way just once.",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Image(image: AssetImage("assets/Suning/milky_way.jpeg")),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "From our perspective on Earth, the Milky Way looks like a faint, milky band of light arcing across the entire sky, which is how it got its name. This feature marks the central disk of our home galaxy seen edge on.\n\nThe Milky Way sits in a neighborhood with over 50 other galaxies called the Local Group. Its members range in size from dwarf galaxies (smaller galaxies with up to a few billion stars) to Andromeda, our nearest large galactic neighbor.",
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
                      "https://science.nasa.gov/astrophysics/focus-areas/what-are-galaxies/stories/"),
                  child: const Text(
                    "...Galaxies Stories...",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
