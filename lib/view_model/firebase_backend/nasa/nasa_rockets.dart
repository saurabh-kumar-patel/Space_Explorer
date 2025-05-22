import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../widget/card_items.dart';
import '../../../widget/custom_theme/theme.dart';

class NasaRockets extends StatefulWidget {
  const NasaRockets({super.key});

  @override
  State<NasaRockets> createState() => _NasaRocketsState();
}

class _NasaRocketsState extends State<NasaRockets> {
  final CollectionReference mycollection =
      FirebaseFirestore.instance.collection('ListOfRocket');

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
              final docSnapshot = streamSnapshot.data!.docs.elementAt(1);
              final launchersData = docSnapshot["launchers"] ?? {};

              return ListView.builder(
                itemCount: launchersData.length,
                itemBuilder: (context, index) {
                  final rocket = launchersData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/rocketDetails',
                        arguments: {
                          'img': rocket["img"],
                          'status': rocket["status"],
                          'name': rocket["name"],
                          'details': rocket["details"],
                          'link': rocket["link"],
                          'first-flight': rocket["first-flight"],
                          'height': rocket["height"],
                          'rocket-height': rocket["rocket-height"],
                          'failures': rocket["failures"],
                          'liftoff-thrust': rocket["liftoff-thrust"],
                          'liftoff-mass': rocket["liftoff-mass"],
                          'missions': rocket["missions"],
                          'landing-legs': rocket["landing-legs"],
                          'fairing-diameter': rocket["fairing-diameter"],
                          'fairing-height': rocket["fairing-height"],
                          'partial_failures': rocket["partial_failures"],
                          'payload-to-GTO': rocket["payload-to-GTO"],
                          'payload-to-LEO': rocket["payload-to-LEO"],
                          'variants': rocket["variants"],
                          'stages': rocket["stages"],
                          'strap-ons': rocket["strap-ons"],
                          'successful': rocket["successful"],
                        },
                      );
                    },
                    child: CardItems(
                      img: rocket['img'],
                      text: rocket["name"].toString(),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
