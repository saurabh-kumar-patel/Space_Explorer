import 'package:apod/view/pages/isro_page/isro_rockets_tabs.dart';
import 'package:apod/widget/custom_theme/theme.dart';
import 'package:apod/widget/mysliverbar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../view_model/provider/url_luncher.dart';
import '../../../widget/icon.dart';
import 'nasa_rockets_tab.dart';
import 'nasa_upcoming_launchers.dart';
import 'nasa_past_launchers.dart';

class NASAPage extends StatefulWidget {
  const NASAPage({super.key});

  @override
  State<NASAPage> createState() => _NASAPageState();
}

class _NASAPageState extends State<NASAPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 20, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Backcolor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
              title: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: 'Rockets',
                  ),
                  Tab(text: 'Upcoming Launches'),
                  Tab(text: ' Past Launches'),
                ],
              ),
              text: "NASA",
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 15,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/nasa.jpg"),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 2,
                            children: [
                              Text(
                                "National Aeronautics and Space Administration",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Textcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                "Government Agency,United States",
                                style: TextStyle(
                                    color: Textcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Text(
                                " Admin:Janet Petro ",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Textcolor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const Text(
                            "Founded: 1958",
                            style: TextStyle(
                                color: Textcolor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                    child: Row(
                      spacing: 1,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImgButton(
                          icon: const Icon(
                            Bootstrap.youtube,
                            color: Textcolor,
                            size: 30,
                          ),
                          text: 'YouTube',
                          onPressed: () {
                            launchLink("https://www.youtube.com/@NASA");
                          },
                        ),
                        ImgButton(
                          icon: Icon(
                            Bootstrap.google,
                            color: Textcolor,
                            size: 30,
                          ),
                          text: 'Website',
                          onPressed: () {
                            launchLink("https://www.nasa.gov/");
                          },
                        ),
                        ImgButton(
                          icon: Icon(
                            Bootstrap.wikipedia,
                            color: Textcolor,
                            size: 30,
                          ),
                          text: 'Wikipedia',
                          onPressed: () {
                            launchLink("https://en.wikipedia.org/wiki/NASA");
                          },
                        ),
                        ImgButton(
                          icon: Icon(
                            Bootstrap.twitter_x,
                            color: Textcolor,
                            size: 30,
                          ),
                          text: 'X Profile',
                          onPressed: () {
                            launchLink("https://x.com/NASA");
                          },
                        ),
                        ImgButton(
                          icon: Icon(
                            Bootstrap.instagram,
                            color: Textcolor,
                            size: 30,
                          ),
                          text: 'Instagram',
                          onPressed: () {
                            launchLink("https://www.instagram.com/nasa/");
                          },
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [
            NasaRocketsTab(),
            NasaLaunchesTab(),
            NasaPastLaunchersTab()
          ],
        ),
      ),
    );
  }
}
