import 'package:apod/view/pages/universe/solar_system/planets/earth.dart';
import 'package:apod/view/pages/universe/solar_system/planets/mars.dart';
import 'package:apod/view/pages/universe/solar_system/planets/mercury.dart';
import 'package:apod/view/pages/universe/solar_system/planets/venus.dart';
import 'package:apod/view/pages/universe/solar_system/sun.dart';
import 'package:apod/widget/info_card.dart';
import 'package:flutter/material.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black87, Colors.black])),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: InfoCard(
                    title: "S U N",
                    subtitle:
                        "The Sun's is the star at the heart of our solar system. Its gravity holds the solar system together, keeping everything — from the biggest planets to the smallest bits of debris — in its orbit. The connection and interactions between the Sun and Earth drive the seasons, ocean currents, weather, climate, radiation belts and auroras.",
                    img: "assets/sun.png",
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Sun())),
                  ),
                ),
                InfoCard(
                  title: "Mercury",
                  subtitle:
                      "Mercury is the smallest planet in our solar system and the nearest to the Sun.Mercury is only slightly larger than Earth's Moon. It's the fastest planet, zipping around the Sun every 88 Earth days. Mercury is named for the swiftest of the ancient Roman gods.",
                  img: "assets/mercury.png",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mercury()));
                  },
                ),
                InfoCard(
                  title: "VENUS",
                  subtitle:
                      "Venus is the second planet from the Sun, and the sixth largest planet. It’s the hottest planet in our solar system.Venus is a cloud-swaddled planet and our nearest planetary neighbor. It has a surface hot enough to melt lead.",
                  img: "assets/venus.png",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Venus()));
                  },
                ),
                InfoCard(
                  title: 'EARTH',
                  subtitle:
                      "While Earth is only the fifth largest planet in the solar system, it is the only world in our solar system with liquid water on the surface. Just slightly larger than nearby Venus, Earth is the biggest of the four planets closest to the Sun, all of which are made of rock and metal.",
                  img: "assets/earth.png",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Earth()));
                  },
                ),
                InfoCard(
                  title: 'MARS',
                  subtitle:
                      "Mars is no place for the faint-hearted. It’s dry, rocky, and bitter cold. The fourth planet from the Sun, Mars, is one of Earth's two closest planetary neighbors (Venus is the other). Mars is one of the easiest planets to spot in the night sky — it looks like a bright red point of light",
                  img: "assets/Mars.png",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Mars()));
                  },
                ),
                InfoCard(
                  title: 'JUPITER',
                  subtitle:
                      "Jupiter is the largest and oldest planet in our solar system.If Jupiter was a hollow shell, 1,000 Earths could fit inside. Jupiter has the shortest day in the solar system, taking about 9.9 hours to spin around once on its axis.",
                  img: "assets/Jupiter.png",
                  onTap: () {},
                ),
                InfoCard(
                  title: 'SATURN',
                  subtitle:
                      "Saturn is the sixth planet from the Sun and the second largest planet in our solar system.Saturn is a massive ball made mostly of hydrogen and helium. It's surrounded by a beautiful ring system. It's the farthest planet from Earth discovered by the unaided human eye.",
                  img: "assets/Saturn.png",
                  onTap: () {},
                ),
                InfoCard(
                  title: 'URANUS',
                  subtitle:
                      "Uranus is the seventh planet from the Sun, and the third largest planet in our solar system – about four times wider than Earth.Uranus is very cold and windy. It is surrounded by faint rings, and more than two dozen small moons. It rotates at a nearly 90-degree angle from the plane of its orbit. This unique tilt makes Uranus appear to spin on its side",
                  img: "assets/Uranus.png",
                  onTap: () {},
                ),
                InfoCard(
                  title: 'NEPTUNE',
                  subtitle:
                      "Dark, cold and whipped by supersonic winds, giant Neptune is the eighth and most distant major planet orbiting our Sun.More than 30 times as far from the Sun as is Earth, Neptune is not visible to the naked eye. Neptune was the first planet located using math.",
                  img: "assets/Neptune.png",
                  onTap: () {},
                ),
                InfoCard(
                  title: 'Dwarf Planets',
                  subtitle:
                      " Pluto and other dwarf planets are a lot like regular planets. So what’s the big difference? The International Astronomical Union (IAU), a world organization of astronomers, came up with the definition of a planet in 2006.According to the IAU, a planet must do three things:\n 1.Orbit its host star (In our solar system that’s the Sun).\n 2. Be mostly round.\n 3. Be big enough that its gravity cleared away any other objects of similar size near its orbit around the Sun.",
                  img: "assets/Makemake.png",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
