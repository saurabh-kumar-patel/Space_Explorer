import 'package:flutter/material.dart';

import '../../../view_model/firebase_backend/isro/isro_rockets.dart';

class IsroRocketsTab extends StatefulWidget {
  const IsroRocketsTab({super.key});

  @override
  State<IsroRocketsTab> createState() => _IsroRocketsTabState();
}

class _IsroRocketsTabState extends State<IsroRocketsTab> {
  @override
  Widget build(BuildContext context) {
    return const IsroRockets();
  }
}
