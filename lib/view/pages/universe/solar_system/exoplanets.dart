import 'package:flutter/material.dart';

import '../../../../view_model/provider/url_luncher.dart';
import '../../../../widget/custom_theme/theme.dart';

class ExoplanetsScreens extends StatelessWidget {
  const ExoplanetsScreens({super.key});

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
                        "assets/Suning/exop.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(5, 30, 2, 0),
                          child: Text(
                            "Exoplanets",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: const Text(
                            "An exoplanet is any planet beyond our solar system. Most of them orbit other stars, but some free-floating exoplanets, called rogue planets, are untethered to any star. We’ve confirmed more than 5,800 exoplanets out of the billions that we believe exist.",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: Colors.black12,
                  child: Column(
                    spacing: 5,
                    children: [
                      Row(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Exoplanets Discoveries",
                            style:
                                TextStyle(color: Colors.white60, fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {
                                launchLink(
                                    "https://science.nasa.gov/exoplanets/discoveries-dashboard/");
                              },
                              child: Text(
                                "Exoplanets Discoveries",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 18),
                              ))
                        ],
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
                                    "Confirmed Exoplanets",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 18),
                                  ),
                                  Text(
                                    "5885",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 18),
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
                                    "Star Count",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 18),
                                  ),
                                  Text(
                                    "4397",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 18),
                                  )
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
                                    "Planetary System",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 18),
                                  ),
                                  Text(
                                    "4532",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 18),
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
                                    "New Discovery",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 18),
                                  ),
                                  Text(
                                    "WASP-116 b",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    const Text(
                      "Overview",
                      style: TextStyle(
                        color: Textcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    TextButton(
                        onPressed: () => launchLink(
                            "https://science.nasa.gov/gallery/exoplanets/"),
                        child: const Text(
                          "Go To Gallery",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "Most of the exoplanets discovered so far are in a relatively small region of our galaxy, the Milky Way. (“Small” meaning within thousands of light-years of our solar system; one light-year equals 5.88 trillion miles, or 9.46 trillion kilometers.) Even the closest known exoplanet to Earth, Proxima Centauri b, is still about 4 light-years away. We know there are more planets than stars in the galaxy. \n \n By measuring exoplanets’ sizes (diameters) and masses (weights), we can see compositions ranging from rocky (like Earth and Venus) to gas-rich (like Jupiter and Saturn). Some planets may be dominated by water or ice, while others are dominated by iron or carbon. We’ve identified lava worlds covered in molten seas, puffy planets the density of Styrofoam and dense cores of planets still orbiting their stars.",
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
                  "Types of exoplanets",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Image(
                    image: AssetImage("assets/Suning/Exoplanet_types-2.jpeg")),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("K2-18 b",
                        style: TextStyle(
                            color: Textcolor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () => launchLink(
                            "https://blogs.nasa.gov/webb/2025/04/18/how-nasas-webb-telescope-supports-our-search-for-life-beyond-earth/"),
                        child: const Text(
                          "Read More...",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "K2-18 b is a super-Earth exoplanet, nearly nine times the mass of Earth, and is about 124 light-years away. It only takes about 33 days to orbit its star, a red dwarf that’s smaller and cooler than our Sun, but it resides in the “Habitable Zone” — the region around a star neither too hot not too cold, where liquid water could exist on a planet’s surface.\n\n The Hubble Space Telescope detected water vapor in K2-18 b’s atmosphere in 2019 — the first time for a habitable-zone exoplanet. And the James Webb Space Telescope has since found carbon-bearing molecules including methane and carbon dioxide in K2-18 b’s atmosphere. Webb telescope observations also revealed the possible detection of a molecule called dimethyl sulfide. On Earth, most dimethyl sulfide in the atmosphere is emitted by marine phytoplankton.",
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
                        "https://science.nasa.gov/exoplanets/stories/"),
                    child: const Text(
                      "...Exoplanet Stories...",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ],
          )),
    );
  }
}
