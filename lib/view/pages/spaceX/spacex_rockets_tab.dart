import 'package:flutter/material.dart';

import '../../../view_model/firebase_backend/isro/isro_rockets.dart';
import '../../../view_model/firebase_backend/spacex/spacex_rockets.dart';

class SpacexRocketsTab extends StatefulWidget {
  const SpacexRocketsTab({super.key});

  @override
  State<SpacexRocketsTab> createState() => _SpacexRocketsTabState();
}

class _SpacexRocketsTabState extends State<SpacexRocketsTab> {
  @override
  Widget build(BuildContext context) {
    return const SpacexRockets();
  }
}
