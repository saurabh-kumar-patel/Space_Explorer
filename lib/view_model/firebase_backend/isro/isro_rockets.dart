import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../widget/card_items.dart';
import '../../../widget/custom_theme/theme.dart';

class IsroRockets extends StatefulWidget {
  const IsroRockets({super.key});

  @override
  State<IsroRockets> createState() => _IsroRocketsState();
}

class _IsroRocketsState extends State<IsroRockets> {
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
              final docSnapshot = streamSnapshot.data!.docs.elementAt(0);
              final launchersData = docSnapshot["launchers"] ?? {};

// Prevent null values by defaulting to empty lists
              final List<dynamic> plannedList = launchersData["planned"] ?? [];
              final List<dynamic> retiredList = launchersData["retired"] ?? [];
              final List<dynamic> underUsageList =
                  launchersData["under_usage"] ?? [];

              print(
                  "Planned: $plannedList, Retired: $retiredList, Under Usage: $underUsageList");

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Currently in Use",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                        itemCount: underUsageList.length,
                        itemBuilder: (context, index) {
                          final rocket = underUsageList[index];
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
                                  'fairing-diameter':
                                      rocket["fairing-diameter"],
                                  'fairing-height': rocket["fairing-height"],
                                  'partial_failures':
                                      rocket["partial_failures"],
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
                      ),
                    ),
                    // Planned Launchers Section
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Text(
                          "Planned Launches",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 350, // Adjust height as needed
                      child: ListView.builder(
                        itemCount: plannedList.length,
                        itemBuilder: (context, index) {
                          final rocket = plannedList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/rocketDetails',
                                arguments: {
                                  'img': rocket["img"],
                                  'name': rocket["name"],
                                  'details': rocket["details"],
                                  'link': rocket["link"],
                                  'status': rocket["status"],
                                },
                              );
                            },
                            child: CardItems(
                              img: rocket["img"],
                              text: rocket["name"],
                            ),
                          );
                        },
                      ),
                    ),

                    //  Retired Launchers Section
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Retired Launches",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                        itemCount: retiredList.length,
                        itemBuilder: (context, index) {
                          final rocket = retiredList[index];
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
                                  'failures': rocket["failures"],
                                  'liftoff-thrust': rocket["liftoff-thrust"],
                                  'missions': rocket["missions"],
                                  'fairing-diameter':
                                      rocket["fairing-diameter"],
                                  'partial_failures':
                                      rocket["partial_failures"],
                                  'payload-to-LEO': rocket["payload-to-LEO"],
                                  'rocket-height': rocket["rocket-height"],
                                  'stages': rocket["stages"],
                                  'strap-ons': rocket["strap-ons"],
                                  'successful': rocket["successful"],
                                },
                              );
                            },
                            child: CardItems(
                              img: rocket["img"].toString(),
                              text: rocket["name"].toString(),
                            ),
                          );
                        },
                      ),
                    ),

                    // // Under Usage Launchers Section
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
//import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../../widget/card_items.dart'; // Assuming CardItems takes img and text
// import '../../../widget/custom_theme/theme.dart'; // Assuming Textcolor is defined here
//
// class IsroRockets extends StatefulWidget {
//   const IsroRockets({super.key});
//
//   @override
//   State<IsroRockets> createState() => _IsroRocketsState();
// }
//
// class _IsroRocketsState extends State<IsroRockets> {
//   // --- Reference the specific document ---
//   // --- Replace 'isro_data' with your ACTUAL document ID ---
//   final DocumentReference isroDocRef = FirebaseFirestore.instance
//       .collection('ListOfRocket')
//       .doc('Isro_launchers'); // <-- Use your specific document ID here
//
//   @override
//   Widget build(BuildContext context) {
//     // --- Use only StreamBuilder ---
//     return StreamBuilder<DocumentSnapshot>(
//       stream: isroDocRef.snapshots(), // Stream the specific document
//       builder: (context, snapshot) {
//         // --- Handle Loading ---
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//
//         // --- Handle Errors ---
//         if (snapshot.hasError) {
//           print("Firestore Error: ${snapshot.error}"); // Log the error
//           return const Center(
//             child: Text(
//               "Error loading data.",
//               style: TextStyle(
//                   color: Textcolor, fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//           );
//         }
//
//         // --- Handle No Data (Document doesn't exist or has no data) ---
//         if (!snapshot.hasData ||
//             !snapshot.data!.exists ||
//             snapshot.data!.data() == null) {
//           return const Center(
//             child: Text(
//               "No rocket data found.",
//               style: TextStyle(
//                   color: Textcolor, fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//           );
//         }
//
//         // --- Extract Data Safely ---
//         final docData = snapshot.data!.data() as Map<String, dynamic>;
//         // Access the nested 'launchers' map within the document data
//         final launchersData =
//             docData["launchers"]?["launchers"] as Map<String, dynamic>? ??
//                 {}; // Adjust based on your actual top-level key if needed
//
//         final List<dynamic> underUsageList =
//             launchersData["under_usage"] as List<dynamic>? ?? [];
//         final List<dynamic> plannedList =
//             launchersData["planned"] as List<dynamic>? ?? [];
//         final List<dynamic> retiredList =
//             launchersData["retired"] as List<dynamic>? ?? [];
//
//         // Optional: Check if all lists are empty
//         if (underUsageList.isEmpty &&
//             plannedList.isEmpty &&
//             retiredList.isEmpty) {
//           return const Center(
//             child: Text(
//               "No launchers categorized.",
//               style: TextStyle(
//                   color: Textcolor, fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//           );
//         }
//
//         // --- Build UI ---
//         return SingleChildScrollView(
//           padding:
//               const EdgeInsets.only(bottom: 20), // Add padding at the bottom
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // --- Currently in Use Section ---
//               if (underUsageList.isNotEmpty) ...[
//                 const Padding(
//                   padding: EdgeInsets.all(12.0),
//                   child: Text(
//                     "Currently in Use",
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green),
//                   ),
//                 ),
//                 ListView.builder(
//                   shrinkWrap: true, // Allow list to size itself
//                   physics:
//                       const NeverScrollableScrollPhysics(), // Disable internal scroll
//                   itemCount: underUsageList.length,
//                   itemBuilder: (context, index) {
//                     final rocket =
//                         underUsageList[index] as Map<String, dynamic>;
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(
//                           context,
//                           '/rocketDetails',
//                           arguments: {
//                             // Pass only available fields, use lowercase keys
//                             'img': rocket['img'],
//                             'status': rocket['status'] ??
//                                 'Unknown', // Provide default
//                             'name': rocket['name'],
//                             'details': rocket['details'],
//                             'link': rocket['link'],
//                             'first_flight': rocket[
//                                 'first-flight'], // Use snake_case if that's in Firestore
//                             'height': rocket['height'],
//                             'rocket_height': rocket[
//                                 'rocket-height'], // Keep hyphen if that's the key
//                             'failures': rocket['failures'],
//                             'liftoff_thrust': rocket['liftoff-thrust'],
//                             'liftoff_mass': rocket['liftoff-mass'],
//                             'missions': rocket['missions'],
//                             'landing_legs':
//                                 rocket['landing-legs'], // Check if this exists
//                             'fairing_diameter': rocket['fairing-diameter'],
//                             'partial_failures': rocket['partial_failures'],
//                             'payload_to_gto': rocket['payload-to-GTO'],
//                             'payload_to_leo': rocket['payload-to-LEO'],
//                             'stages': rocket['stages'],
//                             'strap_ons': rocket['strap-ons'],
//                             'successful': rocket['successful'],
//                             // Removed duplicate 'rocket-height'
//                           },
//                         );
//                       },
//                       child: CardItems(
//                         img: rocket['img']?.toString() ??
//                             '', // Handle potential null
//                         text: rocket['name']?.toString() ??
//                             'Unnamed Rocket', // Handle potential null
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 15), // Spacing between sections
//               ],
//
//               // --- Planned Launchers Section ---
//               if (plannedList.isNotEmpty) ...[
//                 const Padding(
//                   padding: EdgeInsets.all(12.0),
//                   child: Text(
//                     "Planned Launches",
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue),
//                   ),
//                 ),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: plannedList.length,
//                   itemBuilder: (context, index) {
//                     final rocket = plannedList[index] as Map<String, dynamic>;
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(
//                           context,
//                           '/rocketDetails',
//                           arguments: {
//                             'img': rocket['img'],
//                             'name': rocket['name'],
//                             'details': rocket['details'],
//                             'link': rocket['link'],
//                             'status': rocket['status'],
//                             // Only pass fields available for planned rockets
//                           },
//                         );
//                       },
//                       child: CardItems(
//                         img: rocket['img']?.toString() ?? '',
//                         text: rocket['name']?.toString() ??
//                             'Unnamed Planned Rocket',
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 15), // Spacing between sections
//               ],
//
//               //  --- Retired Launchers Section ---
//               if (retiredList.isNotEmpty) ...[
//                 const Padding(
//                   padding: EdgeInsets.all(12.0),
//                   child: Text(
//                     "Retired Launches",
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.red),
//                   ),
//                 ),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: retiredList.length,
//                   itemBuilder: (context, index) {
//                     final rocket = retiredList[index] as Map<String, dynamic>;
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(
//                           context,
//                           '/rocketDetails',
//                           arguments: {
//                             'img': rocket['img'],
//                             'status': rocket['status'],
//                             'name': rocket['name'],
//                             'details': rocket['details'],
//                             'link': rocket['link'],
//                             'failures': rocket['failures'],
//                             'liftoff_thrust': rocket['liftoff-thrust'],
//                             'missions': rocket['missions'],
//                             'fairing_diameter': rocket['fairing-diameter'],
//                             'partial_failures': rocket['partial_failures'],
//                             'payload_to_leo': rocket['payload-to-LEO'],
//                             'rocket_height': rocket['rocket-height'],
//                             'stages': rocket['stages'],
//                             'strap_ons': rocket['strap-ons'],
//                             'successful': rocket['successful'],
//                             // Pass fields specific to retired rockets
//                           },
//                         );
//                       },
//                       child: CardItems(
//                         img: rocket['img']?.toString() ?? '',
//                         text: rocket['name']?.toString() ??
//                             'Unnamed Retired Rocket',
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
