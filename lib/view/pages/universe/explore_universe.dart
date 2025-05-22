import 'package:apod/view/pages/universe/solar_system/Galaxy.dart';
import 'package:apod/view/pages/universe/solar_system/exoplanets.dart';
import 'package:apod/view/pages/universe/solar_system/planets.dart';
import 'package:apod/view/pages/universe/solar_system/stars_page.dart';
import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../widget/list.dart';
import 'black_hole/black_hole.dart';

class ExploreUniverse extends StatelessWidget {
  const ExploreUniverse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Backcolor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 25, 2, 2),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              const Text(
                "Explore The",
                style: TextStyle(
                    color: Textcolor,
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                "UNIVERSE",
                style: TextStyle(
                    color: Textcolor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListWidget(
                  subtitle:
                      'Our solar system includes the Sun, eight planets, five officially named dwarf planets, hundreds of moons, and thousands of asteroids and comets',
                  title: 'The Solar System',
                  img: "assets/solar.jpg",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PlanetPage()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListWidget(
                  subtitle:
                      'Concentrations of matter with gravity so powerful not even light can escape',
                  title: 'Black Hole',
                  img: "assets/black.jpg",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BlackHole()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListWidget(
                  subtitle:
                      'Stars are giant balls of hot gas – mostly hydrogen, with some helium and small amounts of other elements. Every star has its own life cycle, ranging from a few million to trillions of years, and its properties change as it ages.',
                  title: 'S t a r s',
                  img: "assets/stars.jpeg",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StarsScreen(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListWidget(
                  subtitle:
                      'An exoplanet is any planet beyond our solar system. Most of them orbit other stars, but some free-floating exoplanets, called rogue planets, are untethered to any star. We’ve confirmed more than 5,800 exoplanets out of the billions that we believe exist',
                  title: 'Exoplanets',
                  img: "assets/exoplanets.jpg",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExoplanetsScreens(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListWidget(
                  subtitle:
                      'Galaxies consist of stars, planets, and vast clouds of gas and dust, all bound together by gravity. The largest contain trillions of stars and can be more than a million light-years across.',
                  title: 'Galaxies',
                  img: "assets/galaxies.jpeg",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalaxyScreens(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
