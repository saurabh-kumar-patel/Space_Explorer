import 'package:apod/pages/isro_page/about_isro.dart';
import 'package:apod/pages/isro_page/launcher.dart';
import 'package:apod/pages/isro_page/spacecraft.dart';
import 'package:apod/pages/isro_page/upcoming_mission.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_theme/theme.dart';
import '../../widget/list.dart';

class IsroPage extends StatelessWidget {
  const IsroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Backcolor,
      appBar: AppBar(
        backgroundColor:NavBarcolor,
        title: const Text(
          "I S R O",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to ISRO Page! ISRO (Indian Space Research Organisation) is India's premier space agency, contributing significantly to the country's space program. I created this App to address the lack of a dedicated statistics website for ISRO. It provides regular updates and accurate information. The app is dedicated to ISRO and free to use. Explore and gain a deeper understanding of ISRO's contributions to space exploration. Thank you for visiting Space Explorer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("UPCOMING MISSION",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),),
              ),
              Container(
                width:  MediaQuery.of(context).size.width,
                height: 300,
                color: Backcolor,
                child:  const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MissionListScreen(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SpaceCraft(),
                          ),
                        ),
                    child: ListWidget(
                      title: 'Spacecrafts',
                      icon: Icons.airplanemode_active_outlined,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Launcher(),
                      ),
                    ),
                    child: ListWidget(
                      title: 'Launchers',
                      icon: Icons.rocket_launch_outlined,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutISRO(),
                      ),
                    ),
                    child: ListWidget(
                      title: 'About ISRO',
                      icon: Icons.history_sharp,
                    )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
