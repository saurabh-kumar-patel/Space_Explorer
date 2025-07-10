import 'package:flutter/material.dart';

import '../../../view_model/firebase_backend/isro/isro_fetch_data.dart';

class IsroUpcomingLaunchers extends StatelessWidget {
  const IsroUpcomingLaunchers({super.key});

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
          child: IsroUpComingMission(),
        )
      ],
    );
  }
}

