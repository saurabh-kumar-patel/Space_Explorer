import 'package:flutter/material.dart';

import '../../../view_model/firebase_backend/isro/past_data.dart';
import '../../../view_model/firebase_backend/spacex/past_data.dart';

class SpaceXPastLaunchersTab extends StatelessWidget {
  const SpaceXPastLaunchersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Past",
            style: TextStyle(
                color: Colors.purple,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5),
        Expanded(
          child: SpaceXPastMission(),
        )
      ],
    );
  }
}
