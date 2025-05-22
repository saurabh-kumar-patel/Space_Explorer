import 'package:apod/view/pages/universe/black_hole/types.dart';
import 'package:flutter/material.dart';

import '../../../../view_model/provider/url_luncher.dart';
import '../../../../widget/custom_theme/theme.dart';

class BlackHole extends StatelessWidget {
  const BlackHole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Backcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Image(
                    image: AssetImage("assets/black.jpg"),
                    fit: BoxFit.cover,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Black Holes",
                    style: TextStyle(
                        color: Textcolor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TypesOfBlackHole())),
                    child: const Text(
                      "Types..",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                "Black holes are among the most mysterious cosmic objects, much studied but not fully understood. These objects aren’t really holes. They’re huge concentrations of matter packed into very tiny spaces. A black hole is so dense that gravity just beneath its surface, the event horizon, is strong enough that nothing – not even light – can escape. The event horizon isn’t a surface like Earth’s or even the Sun’s. It’s a boundary that contains all the matter that makes up the black hole.",
                style: TextStyle(
                    color: Textcolor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Finding Black Holes",
                style: TextStyle(
                    color: Textcolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                "Black holes don’t emit or reflect light, making them effectively invisible to telescopes. Scientists primarily detect and study them based on how they affect their surroundings:\n 1.Black holes can be surrounded by rings of gas and dust, called accretion disks, that emit light across many wavelengths, including X-rays.\n 2.A supermassive black hole’s intense gravity can cause stars to orbit around it in a particular way. Astronomers tracked the orbits of several stars near the center of the Milky Way to prove it houses a supermassive black hole, a discovery that won the 2020 Nobel Prize. \n 3. When very massive objects accelerate through space, they create ripples in the fabric of space-time called gravitational waves. Scientists can detect some of these by the ripples’ effect on detectors. \n 4.Massive objects like black holes can bend and distort light from more distant objects. This effect, called gravitational lensing, can be used to find isolated black holes that are otherwise invisible.",
                style: TextStyle(
                    color: Textcolor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Black Holes Are Not ...",
                style: TextStyle(
                    color: Textcolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                "1. Wormholes. They don’t provide shortcuts between different points in space, or portals to other dimensions or universes.\n2.Cosmic vacuum cleaners. Black holes don’t suck in other matter. From far enough away, their gravitational effects are just like those of other objects of the same mass.",
                style: TextStyle(
                    color: Textcolor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () => launchLink(
                      "https://science.nasa.gov/astrophysics/focus-areas/black-holes/stories/"),
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
