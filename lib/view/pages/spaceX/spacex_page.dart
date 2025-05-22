import 'package:apod/view/pages/spaceX/spacex_rockets_tab.dart';
import 'package:apod/view/pages/spaceX/spacex_upcoming_launchers.dart';
import 'package:apod/view/pages/spaceX/spacex_past_launchers.dart';
import 'package:apod/widget/custom_theme/theme.dart';
import 'package:apod/widget/mysliverbar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../view_model/provider/url_luncher.dart';
import '../../../widget/icon.dart';

class SpaceXPage extends StatefulWidget {
  const SpaceXPage({super.key});

  @override
  State<SpaceXPage> createState() => _SpaceXPageState();
}

class _SpaceXPageState extends State<SpaceXPage>
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
                  Tab(text: 'Rockets'),
                  Tab(text: 'Upcoming Launches'),
                  Tab(text: 'Past Launches'),
                ],
              ),
              text: "SpaceX",
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 70,
                            width: 80,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  alignment: Alignment.center,
                                  image: AssetImage("assets/X.png"),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 2,
                            children: [
                              Text(
                                "SpaceX",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Textcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Text(
                                "American Company",
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
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Text(
                                "CEO: Elon Musk",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Textcolor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const Text(
                            "Founded: 2002",
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
                            launchLink("https://www.youtube.com/@SpaceX");
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
                            launchLink("https://www.spacex.com/");
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
                            launchLink("https://en.wikipedia.org/wiki/SpaceX");
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
                            launchLink("https://x.com/SpaceX");
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
                            launchLink("https://www.instagram.com/spacex/");
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
            SpacexRocketsTab(),
            SpaceXLaunchesTab(),
            SpaceXPastLaunchersTab()
          ],
        ),
      ),
    );
  }
}
