import 'package:flutter/material.dart';

import '../../../../view_model/provider/url_luncher.dart';
import '../../../../widget/custom_theme/theme.dart';

class StarsScreen extends StatelessWidget {
  const StarsScreen({super.key});

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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                          child: Text(
                            "Star Basics",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Text(
                          "Stars are giant balls of hot gas – mostly hydrogen, with some helium and small amounts of other elements. Every star has its own life cycle,ranging from a few million to trillions of years, and its properties change as it ages ",
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
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "Astronomers estimate that the universe could contain up to one septillion stars – that’s a one followed by 24 zeros. Our Milky Way alone contains more than 100 billion, including our most well-studied star, the Sun.",
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
                  "Birth",
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
                    image: AssetImage("assets/Suning/Carina_Nebula-1.jpeg")),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "Stars form in large clouds of gas and dust called molecular clouds. Molecular clouds range from 1,000 to 10 million times the mass of the Sun and can span as much as hundreds of light-years. Molecular clouds are cold which causes gas to clump, creating high-density pockets. Some of these clumps can collide with each other or collect more matter, strengthening their gravitational force as their mass grows. Eventually, gravity causes some of these clumps to collapse. When this happens, friction causes the material to heat up, which eventually leads to the development of a protostar – a baby star. Batches of stars that have recently formed from molecular clouds are often called stellar clusters, and molecular clouds full of stellar clusters are called stellar nurseries.",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              //life cycle
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "Life Cycle",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "At first, most of the protostar’s energy comes from heat released by its initial collapse. After millions of years, immense pressures and temperatures in the star’s core squeeze the nuclei of hydrogen atoms together to form helium, a process called nuclear fusion. Nuclear fusion releases energy, which heats the star and prevents it from further collapsing under the force of gravity.",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Image(
                    image: AssetImage("assets/Suning/Sun_Emits_Flare.jpeg")),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "Astronomers call stars that are stably undergoing nuclear fusion of hydrogen into helium main sequence stars. This is the longest phase of a star’s life. The star’s luminosity, size, and temperature will slowly change over millions or billions of years during this phase. Our Sun is roughly midway through its main sequence stage.",
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
                  "A star’s gas provides its fuel, and its mass determines how rapidly it runs through its supply, with lower-mass stars burning longer, dimmer, and cooler than very massive stars. More massive stars must burn fuel at a higher rate to generate the energy that keeps them from collapsing under their own weight. Some low-mass stars will shine for trillions of years – longer than the universe has currently existed – while some massive stars will live for only a few million years.",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              // Death
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "Death",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "At the beginning of the end of a star’s life, its core runs out of hydrogen to convert into helium. The energy produced by fusion creates pressure inside the star that balances gravity’s tendency to pull matter together, so the core starts to collapse. But squeezing the core also increases its temperature and pressure, making the star slowly puff up. However, the details of the late stages of the star’s death depend strongly on its mass.",
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
                  "A low-mass star’s atmosphere will keep expanding until it becomes a subgiant or giant star while fusion converts helium into carbon in the core. (This will be the fate of our Sun, in several billion years.) Some giants become unstable and pulsate, periodically inflating and ejecting some of their atmospheres. Eventually, all the star’s outer layers blow away, creating an expanding cloud of dust and gas called a planetary nebula.",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Image(
                    image: AssetImage("assets/Suning/The_Helix_Nebula-1.jpeg")),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "All that’s left of the star is its core, now called a white dwarf, a roughly Earth-sized stellar cinder that gradually cools over billions of years.",
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
                  "A high-mass star goes further. Fusion converts carbon into heavier elements like oxygen, neon, and magnesium, which will become future fuel for the core. For the largest stars, this chain continues until silicon fuses into iron. These processes produce energy that keeps the core from collapsing, but each new fuel buys it less and less time. The whole process takes just a few million years. By the time silicon fuses into iron, the star runs out of fuel in a matter of days. The next step would be fusing iron into some heavier element but doing so requires energy instead of releasing it.",
                  style: TextStyle(
                    color: Textcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Image(image: AssetImage("assets/Suning/Tycho-1.jpeg")),
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "The star’s iron core collapses until forces between the nuclei push the brakes, then it rebounds. This change creates a shock wave that travels outward through the star. The result is a huge explosion called a supernova. The core survives as an incredibly dense remnant, either a neutron star or a black hole.\n\n Material cast into the cosmos by supernovae and other stellar events will enrich future molecular clouds and become incorporated into the next generation of stars.",
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
                        "https://science.nasa.gov/astrophysics/focus-areas/how-do-stars-form-and-evolve/stories/"),
                    child: const Text(
                      "...Start Stories...",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          )),
    );
  }
}
