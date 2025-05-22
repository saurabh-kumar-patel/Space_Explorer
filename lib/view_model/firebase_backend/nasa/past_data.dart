import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../widget/card_items.dart';
import '../../../widget/custom_theme/theme.dart';
import '../../provider/url_luncher.dart';

class NasaPastMission extends StatefulWidget {
  const NasaPastMission({super.key});

  @override
  State<NasaPastMission> createState() => _NasaPastMissionState();
}

class _NasaPastMissionState extends State<NasaPastMission> {
  final CollectionReference mycollection =
      FirebaseFirestore.instance.collection('ListOfPastMissions');

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
              final missiondata =
                  streamSnapshot.data!.docs.elementAt(1)["mission"];
              return ListView.separated(
                itemCount: missiondata.length,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final missionData = streamSnapshot.data!.docs
                          .elementAt(1)["mission"][index];

                      Navigator.pushNamed(
                        context,
                        '/PastMission',
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
                      img: "${missiondata[index]["img"]}",
                      text: "${missiondata[index]["mission_name"]}",
                      location: "${missiondata[index]["place"]}",
                      date: "${missiondata[index]["date"]}",
                      vehicle: "${missiondata[index]["vehicle"]}",
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
