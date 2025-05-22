import 'package:flutter/material.dart';

import '../../../view_model/firebase_backend/isro/isro_fetch_data.dart';
import '../../../view_model/firebase_backend/nasa/nasa_fetch_data.dart';

class NasaLaunchesTab extends StatelessWidget {
  const NasaLaunchesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Upcoming",
            style: TextStyle(
                color: Colors.purple,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5),
        Expanded(
          child: NasaUpComingMission(),
        )
      ],
    );
  }
}

// FutureBuilder<QuerySnapshot>(
// future: fetchData(),
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return const Center(
// child: CircularProgressIndicator(),
// );
// } else if (snapshot.hasError ||
// !snapshot.hasData ||
// snapshot.data!.docs.isEmpty) {
// return const Center(
// child: Text(
// "No data found",
// ),
// );
// } else {
// // Once initial data is fetched, switch to StreamBuilder for real-time updates
// return StreamBuilder<QuerySnapshot>(
// stream: mycollection.snapshots(),
// builder: (context, streamSnapshot) {
// if (streamSnapshot.connectionState == ConnectionState.waiting) {
// // You might want to show a different indicator here, or nothing at all
// return const Center(
// child: CircularProgressIndicator(),
// );
// } else if (streamSnapshot.hasError ||
// !streamSnapshot.hasData ||
// streamSnapshot.data!.docs.isEmpty) {
// return const Center(
// child: Text("No data found"),
// );
// }
// return ListView.separated(
// itemCount:
// streamSnapshot.data!.docs.elementAt(0)["mission"].length > 3
// ? 3
//     : streamSnapshot.data!.docs
//     .elementAt(0)["mission"]
//     .length,
// shrinkWrap: true,
// separatorBuilder: (BuildContext context, int index) =>
// const SizedBox(width: 15),
// itemBuilder: (context, index) {
// return CardItems(
// img:
// "${streamSnapshot.data!.docs.elementAt(0)["mission"][index]["img"]}",
// text:
// "${streamSnapshot.data!.docs.elementAt(0)["mission"][index]["mission_name"]}",
// location:
// "${streamSnapshot.data!.docs.elementAt(0)["mission"][index]["place"]}",
// date:
// "${streamSnapshot.data!.docs.elementAt(0)["mission"][index]["date"]}",
// vehicle:
// "${streamSnapshot.data!.docs.elementAt(0)["mission"][index]["vehicle"]}",
// );
// },
// padding: const EdgeInsets.symmetric(horizontal: 5),
// );
// },
// );
// }
// },
// )
