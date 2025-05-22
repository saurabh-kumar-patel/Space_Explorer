import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../widget/custom_theme/theme.dart';

class TypesOfBlackHole extends StatelessWidget {
  const TypesOfBlackHole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Backcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Types of Black Holes",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "Astronomers generally divide black holes into three categories according to their mass: stellar-mass, supermassive, and intermediate-mass. The mass ranges that define each group are approximate, and scientists are always reassessing where the boundaries should be set. Cosmologists suspect a fourth type, primordial black holes formed during the birth of the universe, may also lurk undetected in the cosmos.",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "1. Stellar-mass Black Holes",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Image(
                      image: AssetImage("assets/animation/Stellar.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "When a star with more than eight times the Sun’s mass runs out of fuel, its core collapses, rebounds, and explodes as a supernova. What’s left behind depends on the star’s mass before the explosion. If it was near the threshold, it creates a city-sized, superdense neutron star. If it had around 20 times the Sun’s mass or more, the star’s core collapses into a stellar-mass black hole.",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "Nearly all the stellar-mass black holes observed so far have been found because they’re paired with stars. They likely originated as mismatched stars where the more massive one evolved rapidly into a black hole. In some cases, called X-ray binaries, the black hole pulls gas off the star into a disk that heats up enough to produce X-rays. Binaries have revealed around 50 suspected or confirmed stellar-mass black holes in the Milky Way, but scientists think there may be as many as 100 million in our galaxy alone.",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              //Supermassive
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "2.Supermassive",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "Almost every large galaxy, including our Milky Way, has a supermassive black hole at its center. These monster objects have hundreds of thousands to billions of times the Sun’s mass, although some scientists place the lower boundary at tens of thousands.",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Animate(
                      child: Image.asset("assets/animation/Supermassic.gif",
                          fit: BoxFit.cover),
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Observations of distant galaxies show that some supermassive black holes formed in the first billion years after the birth of the universe. It’s possible these black holes began with the collapse of supermassive stars in the early universe, which gave them a head start.",
                    style: TextStyle(
                        color: Textcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
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

              // Intermediate Black Hole
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "3. Intermediate",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "Scientists are puzzled by the size gap between stellar-mass and supermassive black holes.",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),

              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset("assets/animation/Intermediate.jpeg",
                        fit: BoxFit.cover),
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "They think there should be a continuum of sizes because, over cosmic time, collisions between stellar-mass black holes should have created some intermediate-mass black holes. These should range from around one hundred to hundreds of thousands of times the Sun’s mass – or tens of thousands, depending on how supermassive black holes are defined. Scientists are actively hunting for examples of these so-called missing-link black holes. Numerous candidates have been identified but have proven difficult to confirm.",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              //Primordial
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "4. Primordial",
                  style: TextStyle(
                      color: Textcolor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    "Scientists theorize that primordial black holes formed in the first second after the birth of the universe. In that moment, pockets of hot material may have been dense enough to form black holes, potentially with masses ranging from 100,000 times less than a paperclip to 100,000 times more than the Sun’s. Then as the universe quickly expanded and cooled, the conditions for forming black holes this way ended.",
                    style: TextStyle(
                        color: Textcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
              const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    "Now, 13.8 billion years later, scientists haven’t yet found definitive proof these primordial black holes ever existed. It’s possible, however, that they could have evaporated as the cosmos aged due to quantum mechanical processes occurring at the edges of their event horizons. According to theoretical predictions, lower-mass black holes (those with less mass than a mountain) would evaporate more quickly than larger ones, which could mean many of these early black holes have completely dissipated. But more massive primordial black holes could still linger across the universe.",
                    style: TextStyle(
                        color: Textcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
