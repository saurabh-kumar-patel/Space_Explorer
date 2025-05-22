import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../widget/card_items.dart';
import '../../../widget/custom_theme/theme.dart';
import '../../provider/url_luncher.dart';

class SpaceXUpComingMission extends StatefulWidget {
  const SpaceXUpComingMission({super.key});

  @override
  State<SpaceXUpComingMission> createState() => _SpaceXUpComingMissionState();
}

class _SpaceXUpComingMissionState extends State<SpaceXUpComingMission> {
  final CollectionReference mycollection =
      FirebaseFirestore.instance.collection('ListOfUpcomingMissions');

  // Function to fetch data initially
  Future<QuerySnapshot> fetchData() async {
    return await mycollection.get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              "Internet error",
              style: TextStyle(
                  color: Textcolor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
        } else {
// Once initial data is fetched, switch to StreamBuilder for real-time updates
          return StreamBuilder<QuerySnapshot>(
            stream: mycollection.snapshots(),
            builder: (context, streamSnapshot) {
              if (streamSnapshot.connectionState == ConnectionState.waiting) {
// You might want to show a different indicator here, or nothing at all
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (streamSnapshot.hasError ||
                  !streamSnapshot.hasData ||
                  streamSnapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(
                        color: Textcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                );
              }
              final mission = streamSnapshot.data!.docs.elementAt(2)["mission"];
              return ListView.separated(
                itemCount: mission.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final missionData = streamSnapshot.data!.docs
                          .elementAt(2)["mission"][index];

                      Navigator.pushNamed(
                        context,
                        '/upcomingMission',
                        arguments: {
                          'img': missionData["img"],
                          'Date': missionData["date"],
                          'title': missionData["mission_name"],
                          'Details': missionData["details"],
                          'link': missionData["link"],
                          'orbit': missionData["orbit"],
                          'place': missionData["place"],
                          'vehicle': missionData["vehicle"],
                          'payloads': missionData["payloads"],
                        },
                      );
                    },
                    child: CardItems(
                      img: "${mission[index]["img"]}",
                      text: "${mission[index]["mission_name"]}",
                      location: "${mission[index]["place"]}",
                      date: "${mission[index]["date"]}",
                      vehicle: "${mission[index]["vehicle"]}",
                    ),
                  );
                },
                padding: const EdgeInsets.symmetric(horizontal: 5),
              );
            },
          );
        }
      },
    );
  }
}
