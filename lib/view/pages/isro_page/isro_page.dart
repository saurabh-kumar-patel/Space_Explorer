import 'package:apod/view/pages/isro_page/past_launchers.dart';
import 'package:apod/view/pages/isro_page/isro_rockets_tabs.dart';
import 'package:apod/view_model/provider/url_luncher.dart';
import 'package:apod/widget/custom_theme/theme.dart';
import 'package:apod/widget/mysliverbar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../widget/icon.dart';
import 'isro_upcoming_launchers.dart';

class IsroScreen extends StatefulWidget {
  const IsroScreen({super.key});

  @override
  State<IsroScreen> createState() => _IsroPageState();
}

class _IsroPageState extends State<IsroScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                  Tab(text: 'ROCKETS'),
                  Tab(text: 'UPCOMING MISSIONS'),
                  Tab(text: 'PAST MISSIONS'),
                ],
              ),
              text: "ISRO",
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 15,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  alignment: Alignment.center,
                                  image: AssetImage("assets/isro.jpeg"),
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
                                "Indian Space Research Organization",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Textcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                "Government Agency, India",
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
                                vertical: 10, horizontal: 10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: const Text(
                                " Admin: V.Narayanan",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Textcolor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const Text(
                            "Founded: 1969",
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
                            launchLink(
                                "https://www.youtube.com/@isroofficial5866");
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
                            launchLink("https://www.isro.gov.in/");
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
                            launchLink("https://en.wikipedia.org/wiki/ISRO");
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
                            launchLink("https://x.com/isro");
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
                            launchLink("https://www.instagram.com/isro.dos/");
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
            IsroRocketsTab(),
            IsroUpcomingLaunchers(),
            PastLaunchersTab(),
          ],
        ),
      ),
    );
  }
}
